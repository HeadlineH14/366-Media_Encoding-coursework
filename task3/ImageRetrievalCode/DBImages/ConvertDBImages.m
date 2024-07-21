clear;
close all;

ImageHeight = 112;
ImageWidth = 92;
VectorSize = ImageHeight*ImageWidth;

ImageFiles = dir('*.png');
NumDBImages = length(ImageFiles);
DBVecImages = zeros(VectorSize,NumDBImages);
for i=1:NumDBImages
    DBImg = imread(ImageFiles(i).name);
    DBImg = double(DBImg);
    DBImg = reshape(DBImg,[10304,1]);
    DBVecImages(:,i) = DBImg;

    %%% missing lines from here
    %%% .....
    %%% missing lines till here
end
save DBVecImages.mat DBVecImages;
