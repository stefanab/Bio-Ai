function image = removeNoise()

image = double(imread('noisy.tiff'));
figure(1);
imshow(image);
imageRep = ones(348,458);
for i=1:348
    for j=1:458
        if (image(i,j) < 128)
            imageRep(i,j) = 0;
        else
              imageRep(i,j) = 1;
        end
    end
end
m = 11;
nhood = makeNhood(m);

se = strel(nhood);
dialted = imdilate(imageRep,se);

se = strel('disk',20,8);
dialted = imerode(dialted,se);

for i=1:348
    for j=1:458
        if (dialted(i,j) == 1)
            image(i,j) = 255;
        else
              image(i,j) = 0;
        end
    end
end
imageshow = uint8(image);
figure(2);
imshow(imageshow);


end

