clear;
close all;

ImageHeight = 112;
ImageWidth = 92;

load DBVecImages.mat DBVecImages;
[~,NumImages] = size(DBVecImages);

figure(1);
DisplayPatches(DBVecImages', 200, ImageHeight, ImageWidth, 20);

display('done.');
