function image = removeNoiseWhiteCheckers()

image = grayscaleConversion('image1.png');

imageRep = ones(498,800);
for i=1:498
    for j=1:800
        if (image(i,j) > 128)
            imageRep(i,j) = 0;
        else
              imageRep(i,j) = 1;
        end
    end
end


se = strel('disk', 10, 8);
dialted = imdilate(imageRep,se);

se = strel('disk',10,8);
dialted = imerode(dialted,se);

for i=1:498
    for j=1:800
        if (dialted(i,j) == 1)
            image(i,j) = 0;
        else
              image(i,j) = 255;
        end
    end
end
imageshow = uint8(image);
figure(3);
imshow(imageshow);
imagedist = distanceTransform(image);
figure(7);
imshow(uint8(imagedist));

end

