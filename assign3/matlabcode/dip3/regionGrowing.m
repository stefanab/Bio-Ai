function regionGrowing()

image = double(imread('fraction.tif'));
figure(1);
imshow('fraction.tif');
x1 = 254; 
y1 = 143;
x2 = 253;
y2 = 268;
x3 = 241; 
y3 = 359;
x4 = 244;
y4 = 448;
I = [];
for i =1:482
    for j=1:566
        I(i,j) = 0;
    end
end
I(x1,y1) = 1;
I(x2,y2) = 1;
I(x3,y3) = 1;
I(x4,y4) = 1;

T = 70;

queue = [x1,y1;x2,y2;x3,y3;x4,y4];

while (size(queue) > 0)
    [m, n] = size(queue);
    nextPoint = queue(m,:);
    queue(m,:) = [];
    for i=-1:2:1
        
            if(nextPoint(1) ~= 1 && nextPoint(2) ~= 1 && nextPoint(1) ~= 482 && nextPoint(2)~= 566)
                nextRow = [nextPoint(1),nextPoint(2)+i];
                nextRow2 = [nextPoint(1)+i, nextPoint(2)];
                if(I(nextRow(1),nextRow(2)) == 0)
                    if(255 - image(nextRow(1),nextRow(2)) <= T)
                        queue = [queue ; nextRow];
                        I(nextRow(1),nextRow(2)) = 1;
                    else
                        I(nextRow(1),nextRow(2)) = 2;
                    end
                end
                if(I(nextRow2(1),nextRow2(2)) == 0)
                    if(255 - image(nextRow2(1),nextRow2(2)) <= T)
                        queue = [queue ; nextRow2];
                        I(nextRow2(1),nextRow2(2)) = 1;
                    else
                        I(nextRow2(1),nextRow2(2)) = 2;
                    end
                end
            end
     end
                
end
for i =1:482
    for j=1:566
        if (I(i,j) == 1)
            image(i,j) = 255;
        else
        image(i,j) = 0;
        end
    end
end
convedImage = uint8(image);
figure(2);
imshow(convedImage);
end


