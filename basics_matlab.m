%%
for i = 1 : 10
    disp(i); % print 1 ~ 10
end
%%
x = 0;
for i = 1 : 10
    x = x + i;
    disp(x); % print 1 ~ 55
end
%%
x = 5;
if(x < 10) 
    disp(x-5);
else
    disp(x+5);
end % print 0
%%
1:10 % 1 2 3 4 5 6 7 8 9 10
cumsum(1:10) % 1 3 6 10 15 21 28 36 45 55

%%
t=[0:0.1:3.14*2]
x = sin(t);
size(t)
plot(t,x) % print graph(figure)