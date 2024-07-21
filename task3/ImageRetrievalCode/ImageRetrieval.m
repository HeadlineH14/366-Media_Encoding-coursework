clear;
close all;

ImageHeight = 112;
ImageWidth = 92;

Tau = 22000000;

load QueryImage/QueryVecImage.mat QueryVecImage;
load DBimages/DBVecImages.mat DBVecImages;
load QuerySSD.mat SSDVal;
x = 0;
for i=1:200
    if SSDVal(i,1) < Tau
        x = x+1;
        sddvaltest(i,1) = SSDVal(i,1);
        RetrievedVecImages(:,x) = DBVecImages(:,i);
    end
end

NumRetrievedImages = x;


%%% missing lines from here
%%% .....
%%% missing lines till here

figure(1);
DisplayPatches(RetrievedVecImages', NumRetrievedImages, ImageHeight, ImageWidth, NumRetrievedImages);
