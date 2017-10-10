function convImage = grayscaleConversion(string)

image = double(imread(string));


disp(size(image));
I1 = [1:256;1:256];
I2 = [1:256;1:256];

for i=1:498
    for j=1:800
        red = image(i,j,1);
       
        green = image(i,j,2);
        blue = image(i,j,3);
       
       
        gray = 0.2126 * red + 0.7152 * green + 0.0722 * blue;
        
        I2(i,j) = gray;
         
    end
end
imgToShow1 = uint8(image);
imgToShow2 = uint8(I2);
convImage = imgToShow2;
figure(1);
imshow(imgToShow1);
figure(3);
imshow(imgToShow2);
end

