[nPat,nIn]=size(InPat);
[nPat,nOut]=size(DesOut);
V=zeros(nOut, nIn);
for i=1:nOut,
    for j=1:nIn,
        for k=1:nPat
            x = InPat(k, j);
            y = DesOut(k, i);
            deltaV = (2*y-1)*(2*x-1);
            V(i,j)=V(i,j)+deltaV;
        end
    end
end

Out=zeros(nPat,nOut);
for k=1:nPat,
    x=InPat(k,:)';
    q=V*x;
    y=q>0;
    Out(k,:)=y';
end
