stv=4;
dec=0.7;
pls=[0 0 1 0 0];
x=[pls pls pls pls pls pls];
[dum nTs] = size(x);
y = zeros(1, nTs);
v = stv;
for t = 1 : nTs,
    y(t) = v * x(t);
    if x(t)>0,
        v=v*dec;
    end
end

clf
subplot(211)
plot(x)
axis([0 nTs 0 1.1])
xlabel('time step')
ylabel('input')

subplot(212)
plot(y)
axis([0 nTs 0 stv+0.5])
xlabel('time step')
ylabel('output')