function image = removeNoiseRedCheckers()

image = grayscaleConversionRed('image1.png');

imageRep = ones(498,800);
for i=1:498
    for j=1:800
        if (image(i,j) > 9 && i >100 && j < 400)
            imageRep(i,j) = 0;
        else
              imageRep(i,j) = 255;
        end
    end
end


figure(3);
imToShow = uint8(imageRep);
imshow(imToShow);
se = strel('square', 60);
dialted = imopen(imageRep,se);



for i=1:498
    for j=1:800
        if (dialted(i,j) == 255)
            image(i,j) = 0;
        else
              image(i,j) = 255;
        end
    end
end


imageshow = uint8(image);
figure(5);
imshow(imageshow);
imagedist = distanceTransform(image);
figure(7);
imshow(uint8(imagedist));


end

