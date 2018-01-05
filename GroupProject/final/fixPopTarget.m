if k >= 1 && k <= 4
    N=4;
elseif k >= 5 && k <= 8
    N=8;
elseif k >= 9 && k <= 12
    N=16;
else 
    N=32;
end
    
if rem(k,4) == 0
    popout = 0;
    target = 0;
elseif rem(k+1,4) == 0
    popout = 0;
    target = 1;
elseif rem(k+2, 4) == 0
    popout = 1;
    target = 0;
else
    popout = 1;
    target = 1;
end

    