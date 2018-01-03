n=25
V=[1;zeros(n-1, 1)];
wmain=ones(1,n)*0.95;
woff=ones(1,n-1)*0.05;
W=diag(wmain,0)+diag(woff,-1);