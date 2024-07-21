clear;
close all;

ImageHeight = 112;
ImageWidth = 92;
VectorSize = ImageHeight*ImageWidth;

QueryImageFilename = 'QueryImage.png';
QImg = imread(QueryImageFilename);
imshow(QImg);
QImg = double(QImg);
imshow(uint8(QImg));
axis image;
axis off;
QueryVecImage = QImg(:);
save QueryVecImage.mat QueryVecImage;

display('done.');
