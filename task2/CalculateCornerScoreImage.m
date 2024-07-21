
load('SQf.mat', 'SQxxf', 'SQxyf', 'SQyyf');


k = 0.4;
[r, c] = size(SQxyf);

R = zeros(r,c);

% calculate R for the corner scores
for i = 2:1:r-1
    for j=2:1:c-1
        Ix = sum(sum(SQxxf(i-1:i+1,j-1:j+1)));
        Iy = sum(sum(SQyyf(i-1:i+1,j-1:j+1)));
        Ixy = sum(sum(SQxyf(i-1:i+1,j-1:j+1)));
        
        M = [Ix Ixy;
            Ixy Iy];
        Rf(i,j) = (Ix .* Iy) - (Ixy.^2) - k * ( Ixy + Iy ).^ 2;

    end
end

save Rf.mat Rf;

imagesc(Rf);
colormap gray;
axis image off;
title('R[f]')
