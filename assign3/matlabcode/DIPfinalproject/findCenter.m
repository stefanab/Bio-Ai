function centers = findCenter(image,type)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[x, y] = size(image);
queue = [];
centers = [];
highestx = -1;
highesty = -1;
highest = 0;
visited = zeros(x,y);
for i = 1:x
    for j = 1:y
        if visited(i,j) == 0
            queue = [queue, i, j];
        while size(queue) ~= 0
            yj = queue(length(queue));
            xi = queue(length(queue)-1);
            queue = queue(1:end-2);
            if visited(xi,yj) == 0
                 visited(xi,yj) = 1;
                if image(xi,yj) ~= 0

                if image(xi,yj) > highest
                    highest = image(xi,yj);
                    highestx = xi;
                    highesty = yj;
                end
                for side = -1:2:1
                    if xi ~= 0 && yj ~= 0 && xi~=x && yj~=y
                    queue = [queue, xi+side, yj];
                    queue = [queue, xi, yj+side];
                    end
                end
                end
            end
        end
        if highest ~=0
            
        centers = [centers ; num2str(highestx),':' , num2str(highesty),':', type];
        highest =0;
        end
        end
    end
end

end

