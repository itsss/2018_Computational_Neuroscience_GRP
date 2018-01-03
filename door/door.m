doors = zeros(100, 1)-1;

for p = 1 : 100
    for d = 1 : 100
        if mod(d,p)==0
            doors(d) = -doors(d);
        end
        %disp([p, d])
    end
end

%find(doors>0) open door