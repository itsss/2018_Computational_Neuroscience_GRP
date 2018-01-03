cut = -Inf; 
sat = Inf; 
tEnd = 200; 
nTs = tEnd + 1; 

v = 1; 
w = 0.90; 

x = zeros(1, nTs); 
start = 11; 

x(start) = 1; 
x(start:nTs)=ones(1,nTs-start+1); 

y = zeros(1, nTs);

for t=2:nTs, 
    y(t) = w * y(t-1) + v*x(t-1);
    if y(t) < cut,  y(t) = cut; end
    if y(t) > sat,  y(t) = sat; end
end

lw = 3;
fs = 18;
tBase = 0 : tEnd;

clf
subplot(2,1,1)
plot(tBase, x, 'k', 'linewidth', lw)
axis([0 tEnd 0 1.1])
xlabel('time step','fontsize', fs)
ylabel('input','fontsize', fs)
set(gca, 'fontsize', fs)
set(gca, 'linewidth', lw)

subplot(2,1,2)
plot(tBase, y, 'k', 'linewidth', lw)
axis([0 tEnd 0 1.1*max(y)])
xlabel('time step','fontsize',fs)
ylabel('output','fontsize',fs)
set(gca,'fontsize',fs)
set(gca,'linewidth',lw)
