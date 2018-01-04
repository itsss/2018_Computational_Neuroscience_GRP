a=0.1; %학습하는 속도가 달라짐
tol=0.01;
nIts=100000;
[nPat,nIn]=size(InPat);
[nPat,nOut]=size(DesOut);
V=rand(nOut,nIn)*2-1;
maxErr=10;

for c = 1 : nIts,
    pIndx=ceil(rand*nPat);
    d=DesOut(pIndx,:)';
    x=InPat(pIndx,:)';
    q=V*x;
    y=1./(1+exp(-q));
    dy=y.*(1-y);
    e=d-y;
    g=e.*dy;
    deltaV=a*g*x';
    V=V+deltaV;
    if rem(c, 20) == 0,
        Q = (V*InPat')';
        Out = 1./(1+exp(-Q));
        maxErr=sum(abs(DesOut-Out));
        bar(Out);
        ylim([0 1]);
        drawnow;
    end
    if maxErr < tol,
        break
    end
end
