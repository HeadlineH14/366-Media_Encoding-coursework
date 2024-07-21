
load('Rf.mat', 'Rf');

x = height(Rf);
y = width(Rf);  



rmax = 0;
% loop for getting the max of R
for i = 1:x
    for j = 1:y
        if Rf(i,j) > rmax
            rmax = Rf(i,j);

        end
    end
end


% loop for finding which corners are withing the threshold 
for i = 1:x-1
    for j = 1:y-1
        if Rf(i,j) > 0.1 *rmax && Rf(i,j) > Rf(i-1,j-1) && Rf(i, j) > R(i-1, j+1) && Rf(i, j) > Rf(i+1, j-1) && Rf(i, j) > Rf(i+1, j+1)
            CornerFlagImage(i,j) = 1;
        end
    end
end


[PosC, PosR] = find(CornerFlagImage == 1);
figure, imshow(InputImage);
Pos_q = [PosR, PosC];
save KeyPoints.mat Pos_q;
hold on;
plot(PosR,PosC,'r.','Markersize',15);
axis image;
hold off;
