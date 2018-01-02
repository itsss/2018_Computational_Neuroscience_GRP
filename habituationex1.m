pls = [0 1];
x = [pls pls pls pls];
nTs = length(x);
stv = 0.5;
dec = 2;
y = zeros(1, nTs);
v = stv;

for t = 1 : nTs
    y(t) = v * x(t);
    disp([t, x(t), v, y(t)]);
    if(x(t) > 0)
        v = v * dec;
    end
end

subplot(2,1,1);
plot(x);
title('Input');
subplot(2,1,2);
plot(y);
title('Output');