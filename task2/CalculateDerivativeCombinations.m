
load('Dxf.mat', 'Dxf');
load('Dyf.mat', 'Dyf');



figure(1);
subplot(1,2,1);
imagesc(Dxf);
colormap gray;
title('Dx f')
axis image off;
subplot(1,2,2);
imagesc(Dyf);
colormap gray;
axis image off;
title('Dy f')

% combined derivatives

Qxxf = Dxf.^2;

Qxyf = Dxf .* Dyf; 

Qyyf = Dyf.^2;

figure(2);
subplot(1,3,1);
imagesc(Qxxf);
colormap gray;
axis image off;
title('Qxx f')

subplot(1,3,2);
imagesc(Qxyf);
colormap gray;
axis image off;
title('Qxy f')

subplot(1,3,3);
imagesc(Qyyf);
colormap gray;
axis image off;
title('Qyy f')

% gaussian filter on the combined derivative 

k = fspecial("gaussian",[7,7]);


SQxxf = imfilter(Qxxf,k);

SQxyf = imfilter(Qxyf,k);

SQyyf = imfilter(Qyyf,k);



save SQf.mat SQxxf SQxyf SQyyf;

figure(3);
subplot(1,3,1);
imagesc(SQxxf);
colormap gray;
axis image off;
title('S[Qxx f]')

subplot(1,3,2);
imagesc(SQxyf);
colormap gray;
axis image off;
title('S[Qxy f]')

subplot(1,3,3);
imagesc(SQyyf);
colormap gray;
axis image off;
title('S[Qyy f]')
