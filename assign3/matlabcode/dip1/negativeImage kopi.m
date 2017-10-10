figure(1);
imshow('aerial1.tiff');
image = double(imread('aerial1.tiff'));

I = 255-image;

imgToshow = uint8(I);
figure(2);
imshow(imgToshow);