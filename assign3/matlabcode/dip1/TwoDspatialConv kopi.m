function TwoDspatialConv

image = double(imread('aerial2.tiff'));
figure(1);
imshow('aerial2.tiff');
filter = [0.5,0.2,0.1;0.1,0.50,1.1;1.2,1.3,1.2];


for i=2:(length(image)-1)
    for j=2:(length(image)-1)
        
        finalGray = 0;
            for s = -1:1
                for t = -1:1
                    finalGray = finalGray + filter(s+2,t+2)*image(i-s,j-t);
                end
            end
        finalGray = finalGray/9;
        image(i,j) = finalGray;
    end
end
            
convedImage = uint8(image);
figure(2);
imshow(convedImage);

end

