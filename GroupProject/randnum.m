N = rand

if N < 0.25
    result=4;
end
if 0.25<=N & N <= 0.5
    result=8;
end
if 0.5<=N & N <= 0.75
    result=16;
end
if 0.75<=N & N <= 1
    result=32;
end

val = rand
if val < 0.5
    result2 = 1;
else
    result2 = 0;
end

disp(N);
disp(result);
disp(result2);