function convImage = grayscaleConversionRed(string)

image = double(imread(string));


disp(size(image));
I1 = [1:256;1:256];
I2 = [1:256;1:256];
m = 20;
se = strel('square',m);
for i=1:498
    for j=1:800
        red = image(i,j,2);
        I1(i,j) = image(i,j,2);
        if red < 8
            red = 255;
        else
            red =0;
        end
        
        I2(i,j) = red;
         
    end
end
imgToShow4 = uint8(I2);
figure(4);
imshow(imgToShow4);


imgToShow2 = uint8(I2);

convImage = imgToShow2;



end

