
InputImage = imread("kodim09gray.png"); % Try to replace 'Neuschwanstein.png' with other images as well

I = double(InputImage);
% single sobel filter
myx = [-1 0 1];
myy = [-1;0;1];

%sobel derivative of image
for i = 1:size(I, 1) - 2 
    for j = 1:size(I, 2) - 2 
  
        % Gradient approximations 
        Dxf(i+1, j+1) = sum(sum(myx.*I(i:i+2, j:j+2))); 
        Dyf(i+1, j+1) = sum(sum(myy.*I(i:i+2, j:j+2)));        
    end
end


imagesc(Dxf);
colormap gray;
axis image off;
figure,imagesc(Dyf);
colormap gray;
axis image off;

save Dxf.mat Dxf;
save Dyf.mat Dyf;