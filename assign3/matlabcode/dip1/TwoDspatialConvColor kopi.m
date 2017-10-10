function TwoDspatialConvColor

image = double(imread('beans.tiff'));
figure(1);
imshow('beans.tiff');
filter = [1,2,1;2,4,2;1,2,1]*(1/16);


for i=2:(length(image)-1)
    for j=2:(length(image)-1)
        
        finalRed = 0;
        finalGreen = 0;
        finalBlue = 0;
            for s = -1:1
                for t = -1:1
                    finalRed = finalRed + filter(s+2,t+2)*image(i-s,j-t,1);
                    finalGreen = finalGreen + filter(s+2,t+2)*image(i-s,j-t,2);
                    finalBlue = finalBlue + filter(s+2,t+2)*image(i-s,j-t,3);
                end
            end

        image(i,j,1) = finalRed;
        image(i,j,2) = finalGreen;
        image(i,j,3) = finalBlue;
    end
end
            
convedImage = uint8(image);
figure(2);
imshow(convedImage);

end




