function globalThreshhold()

image = double(imread('fraction.tif'));
figure(1);
imshow('fraction.tif');


Told = 0.0;
G1 = [];
G2 = [];
m=0;
 for i = 1:482
     for j = 1:566
         m = m + image(i,j);
          
    end
 end
 m = m/(482*566);
 T=m;
        
    while (T - Told > .05) 
        Told = T;

        for i = 1:482
            for j = 1:566
                pix = image(i,j);
                if (pix < T)
                    G1 = [G1 pix];
                else
                    G2 = [G2 pix];
                end
            end
        end
        m1 = 0;
        for i = 1:length(G1)
            m1 = m1 + G1(i);
        end
        m1 = m1/length(G1);
        m2 = 0;
        for i = 1:length(G2)
            m2 = m2 + G2(i);
        end
        m2 = m2/length(G2);
        T = (m1+m2)/2;
    end
 for i = 1:482
     for j = 1:566
         if (image(i,j) < T)
             image(i,j) = 0;
         else
             image(i,j) = 255;
         end
     end
 end

convedImage = uint8(image);
figure(2);
imshow(convedImage);
end

