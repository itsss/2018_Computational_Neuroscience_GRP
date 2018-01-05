[nPat, nIn] = size(InPat);
permute_index=randperm(nPat);
InPat=InPat(permute_index,:);
DesOut=DesOut(permute_index);