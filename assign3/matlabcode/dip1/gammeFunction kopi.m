function gammeFunction
figure(1);
imshow('aerial1.tiff');
image = double(imread('aerial1.tiff'));

I = image.^1.1;

imgToshow = uint8(I);

figure(2);
imshow(imgToshow);
end