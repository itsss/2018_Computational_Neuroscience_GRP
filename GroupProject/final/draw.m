function draw (N,target,popout)

ro = -1;
rx = -1;
bo = -1;
bx = -1;

%N=4;
%target=true;
%popout=true;

if target==true,
    ro=zeros(1,2);
    ro(1,1)=(rand()*30);
    ro(1,2)=(rand()*30);
    if popout==true,
        for t=1:N/2-1
            bo(t,1)=(rand()*30);
            bo(t,2)=(rand()*30);
        end
        for t=1:N/2
            bx(t,1)=(rand()*30);
            bx(t,2)=(rand()*30);
        end
    elseif popout==false  
        bx(1,1)=(rand()*30);
        bx(1,2)=(rand()*30);
        for t=1:N/2-1,
            for i=1:2,
                rx(t,i)=(rand()*30);
                bo(t,i)=(rand()*30);
            end
        end
    end
elseif target==false
    if popout==true,
        for t=1:N/2,
            for i=1:2,
                bo(t,i)=(rand()*30);
                bx(t,i)=(rand()*30);
            end
        end
    elseif popout==false,
        for t=1:N/2,
            for i=1:2,
                rx(t,i)=(rand()*30);
                bo(t,i)=(rand()*30);
            end
        end
    end
end

%disp(ro);
%disp(rx);
%disp(bo);
%disp(bx);

drawPic(ro,rx,bo,bx);
