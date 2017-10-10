function [ output_args ] = untitled2( input_args )

image = double(imread('beans.tiff'));


disp(size(image));
I1 = [1:256;1:256];
I2 = [1:256;1:256];

for i=1:length(image)
    for j=1:256
        red = image(i,j,1);
       
        green = image(i,j,2);
        blue = image(i,j,3);
        gray = (red + green + blue)/3;
        I1(i,j) = gray;
        gray = 0.2126 * red + 0.7152 * green + 0.0722 * blue;
        
        I2(i,j) = gray;
         
    end
end
imgToShow1 = uint8(I1);
imgToShow2 = uint8(I2);
figure(1);
imshow(imgToShow1);
figure(2);
imshow(imgToShow2);
end

