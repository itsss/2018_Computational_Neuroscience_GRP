function drawPic(a,b,c,d)

n=30; %size of pic

clf


title('Find Red Circle');
axis([-1 n+1 -1 n+1]);
hold on

sz = size(a);
if a(1,1) == -1
else
plot(a(1,1),a(1,2),'ro');
for i=2:sz(1)
    hold on
    plot(a(i,1),a(i,2),'ro');
end
end

sz = size(b);
if b(1,1) == -1
else
    hold on;
    plot(b(1,1),b(1,2),'rx');
    for i=2:sz(1)
        hold on
        plot(b(i,1),b(i,2),'rx');
    end
end


sz = size(c);
if c(1,1) == -1
else
hold on;
plot(c(1,1),c(1,2),'bo');
for i=2:sz(1)
    hold on
    plot(c(i,1),c(i,2),'bo');
end
end

sz = size(d);
if d(1,1) == -1
else
hold on;
plot(d(1,1),d(1,2),'bx');
for i=2:sz(1)
    hold on
    plot(d(i,1),d(i,2),'bx');
end
end

    hold off;
    
end
