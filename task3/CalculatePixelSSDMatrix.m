DataDir = './Data/';

FeatureFileName1 = sprintf('%sQueryPixelFeatures.mat',DataDir);
FeatureFileName2 = sprintf('%sTargetPixelFeatures.mat',DataDir);

load(FeatureFileName1,'FeatureDescriptors');
Img1FeatureDescriptors = FeatureDescriptors;

load(FeatureFileName2,'FeatureDescriptors');
Img2FeatureDescriptors = FeatureDescriptors;

[FeatureDescriptorSize,NumFeatures1] = size(Img1FeatureDescriptors);
[FeatureDescriptorSize,NumFeatures2] = size(Img2FeatureDescriptors);

%%% calculate SSDs
    SSDPixelMatrix = zeros(NumFeatures1,NumFeatures2);

    % get the ssd from query and target
        for i = 1:NumFeatures1
            SSDPixelMatrix(i,:) = SSD(Img1FeatureDescriptors(:,i),Img2FeatureDescriptors(:,:));
        end

save SSDPixelMatrix.mat SSDPixelMatrix;