clear;
close all;

ImageHeight = 112;
ImageWidth = 92;

load QueryImage/QueryVecImage.mat QueryVecImage;
load DBImages/DBVecImages.mat DBVecImages;

[~,NumDBImages] = size(DBVecImages);

SSDVal = zeros(NumDBImages,1);

for i=1:NumDBImages
    SSDVal(i,1) = SSD(DBVecImages(:,i),QueryVecImage) ;
end

save QuerySSD.mat SSDVal;

for i=1:10
    display(sprintf('Image%03d: SSD value = %f',i,SSDVal(i)));
end
