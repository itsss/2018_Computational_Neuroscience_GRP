% backPropTrain.m
% this script trains a three-layered network of units
% with the squashing activation funciton to associate 
% patterns using backpropagation

a = 0.25;
tol = 0.01;
nHid = 100;

[nPat,nIn]=size(InPat); 
[nPat,nOut]=size(DesOut); 
V=rand(nHid,nIn+1)*2-1; 
U=rand(nOut,nHid+1)*2-1;
deltaV=zeros(nHid,nIn+1); 
deltaU=zeros(nOut,nHid+1);
maxErr=inf; 
b=1; 
nIts=100000;

for c=1:nIts,
    pIndx=ceil(rand*nPat); 
    d=DesOut(pIndx,:); 
    x=[InPat(pIndx,:) b]'; 
    y=1./(1+exp(-V*x)); 
    y=[y' b]'; 
    z=1./(1+exp(-U*y)); 
    e=d-z'; 
    if max(abs(e))>tol,
        x=x';y=y';z=z'; 
        zg=e.*(z.*(1-z));
        yg=(y.*(1-y)).*(zg*U); 
        deltaU=a*zg'*y; 
        deltaV=a*yg(1:nHid)'*x; 
        U=U+deltaU; 
        V=V+deltaV; 
     end 
    if rem(c,200)==0, 
        Inb=[InPat b*ones(nPat,1)]; 
        Hid=(1./(1+exp(-V*Inb')))';
        Hidb=[Hid b*ones(nPat,1)]; 
        Out=(1./(1+exp(-U*Hidb')))'; 
        maxErr=max(max(abs(DesOut-Out)));
        %bar(Out); ylim([0 1]); drawnow;
    end 
    if maxErr<tol, break, end, 
end 

%see graph => plot(Out, 'o')
%see image => imagesc(U) or imagesc(V)
%Train 이후의 결과 (U와 V) 

%clf;
%plot([1:nPat],DesOut,'o',[1:nPat],Out,'rx');