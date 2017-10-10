function distanceTransform()

image = removeNoise();
startImage = double(image);
figure(1);
imshow(image);
image = double(image);
nhood = [1 1 1; 1 1 1; 1 1 1];
change = 0;
counter = zeros(348,458);

nextImage = imerode(image,nhood);
 for i=1:348
        for j=1:458
            if (nextImage(i,j) == 255)
                 counter(i,j) = counter(i,j) + 1;
                 
            end
            if (nextImage(i,j) == 0 && image(i,j) ~= 0)
                     change = 1;
            end
            
        end
 end
 image = nextImage;
counted = 0;
while(change == 1)
    change = 0;
    counted = counted + 1;
    nextImage = imerode(image,nhood);

    for i=1:348
        for j=1:458
             if (nextImage(i,j) == 255)
                 counter(i,j) = counter(i,j) + 1;            
             end
             if (nextImage(i,j) == 0 && image(i,j) ~= 0)
                         change = 1;
             end
        end
    end
    image = nextImage;
    
end

for i = 1:348
    for j=1:458
        startImage(i,j) = 0 + (counter(i,j) * 7);
    end
end
imageShow= uint8(startImage);
figure(2);
imshow(imageShow);
end

