function TwoDspatialConvSobelOp

image = double(imread('aerial1.tiff'));
figure(1);
imshow('aerial1.tiff');
xkernel = [-1,0,1;-2,0,2;-1,0,1];
ykernel = [1,2,1;0,0,0;-1,-2,-1];

for i=2:(length(image)-1)
    for j=2:(length(image)-1)
        
        finalGray = 0;
        finalGrayx = 0;
        finalGrayy = 0;
            for s = -1:1
                for t = -1:1
                    finalGrayx = finalGrayx + (xkernel(s+2,t+2))*image(i-s,j-t);
                    finalGrayy = finalGrayy + (ykernel(s+2,t+2))*image(i-s,j-t); 
                end
            end
            finalGray = sqrt(finalGrayx^2 + finalGrayy^2);
         finalGray = finalGray/9;
       
        image(i,j) = finalGray;
    end
end
            
convedImage = uint8(image);
figure(2);
imshow(convedImage);

end