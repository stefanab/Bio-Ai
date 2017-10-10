function gradientMorph()

image = removeNoise();
figure(1);
imshow(image);
image = double(image);
finalimage = image;

nhood= strel('square',3);
erodedImage = imerode(image,nhood);


for i=1:348
    for j=1:458
        if (image(i,j) == erodedImage(i,j))
            finalimage(i,j) = 0;
        else
              finalimage(i,j) = 255;
        end
    end
end

finalimage = uint8(finalimage);
figure(2);
imshow(finalimage);
end

