clear, clc, close all;
%%load image and resize
im = imread("B.png");
% feaure = extractHOGFeatures(im);

if size(im,3)
    im = double(im)/255;
    im = mean(im,3);
end

rows = size(im,1);
columns = size(im,2);

if mod(rows,8) ~= 0 && mod(columns,8)
    r = rem(rows,8);
    c = rem(columns,8);
    im = resize(im,[rows-r,columns-c]);
end

rows = size(im,1);
columns = size(im,2);
r = rows/8;
c = columns/8;
l = r*c;

Features = extractHOGFeatures_cw(im);
%{
%%function

myx = [-1 0 1; -2 0 2; -1 0 1]; 
myy = [-1 -2 -1; 0 0 0; 1 2 1]; 


for i = 1:size(im, 1) - 2 
    for j = 1:size(im, 2) - 2 
  
        % Gradient approximations 
        Gx = sum(sum(myx.*im(i:i+2, j:j+2))); 
        Gy = sum(sum(myy.*im(i:i+2, j:j+2))); 
                 
        % Calculate magnitude of vector 
        magnitude(i+1, j+1) = sqrt(Gx.^2 + Gy.^2); 
         
    end
end

angle = atand(im./im);
angle =imadd(angle,90);
angle(isnan(magnitude)) =0;

Features = [];
cell = [];
normcell = [];

for i = 0: rows/8 -2
    for j = 0: columns/8 -2
        cell =[im(8*i+1: 8*i+8 ,8*j+1 : 8*j+8)];
         
            [mag, dir] = imgradient(cell);


         l1 = sum(abs(cell));
         normcell =[normcell l1];
         histr = zeros(1,9);
                for k=1:8
                    for n=1:8     
                        alpha= cell(k,n);
                        
                        % Binning Process (Bi-Linear Interpolation)
                        if alpha>0.1 && alpha<=0.30
                            histr(1)=histr(1)+ cell(k,n)*(0.30-alpha)/20;
                            histr(2)=histr(2)+ cell(k,n)*(alpha-0.10)/20;
                        elseif alpha>0.30 && alpha<=0.50
                            histr(2)=histr(2)+ cell(k,n)*(0.50-alpha)/20;                 
                            histr(3)=histr(3)+ cell(k,n)*(alpha-0.30)/20;
                        elseif alpha>0.50 && alpha<=0.70
                            histr(3)=histr(3)+ cell(k,n)*(0.70-alpha)/20;
                            histr(4)=histr(4)+ cell(k,n)*(alpha-0.50)/20;
                        elseif alpha>0.70 && alpha<=0.90
                            histr(4)=histr(4)+ cell(k,n)*(0.90-alpha)/20;
                            histr(5)=histr(5)+ cell(k,n)*(alpha-0.70)/20;
                        elseif alpha>0.90 && alpha<=1.10
                            histr(5)=histr(5)+ cell(k,n)*(1.10-alpha)/20;
                            histr(6)=histr(6)+ cell(k,n)*(alpha-0.90)/20;
                        elseif alpha>1.10 && alpha<=1.30
                            histr(6)=histr(6)+ cell(k,n)*(1.30-alpha)/20;
                            histr(7)=histr(7)+ cell(k,n)*(alpha-1.10)/20;
                        elseif alpha>1.30 && alpha<=1.50
                            histr(7)=histr(7)+ cell(k,n)*(1.50-alpha)/20;
                            histr(8)=histr(8)+ cell(k,n)*(alpha-1.30)/20;
                        elseif alpha>1.50 && alpha<=1.70
                            histr(8)=histr(8)+ cell(k,n)*(1.70-alpha)/20;
                            histr(9)=histr(9)+ cell(k,n)*(alpha-1.50)/20;
                        elseif alpha>=0 && alpha<=0.10
                            histr(1)=histr(1)+ cell(k,n)*(alpha+0.10)/20;
                            histr(9)=histr(9)+ cell(k,n)*(0.10-alpha)/20;
                        elseif alpha>1.70 && alpha<=1.80
                            histr(9)=histr(9)+ cell(k,n)*(1.90-alpha)/20;
                            histr(1)=histr(1)+ cell(k,n)*(alpha-1.70)/20;
                        end
                    end   
                    
                end 
                Features = [Features histr];
           Features=Features/sqrt(norm(Features)^2+.01);
    end
end
Features(isnan(Features)) = 0;
Features=Features/sqrt(norm(Features)^2+.001);
for z=1:length(Features)
    if Features(z)>0.2
         Features(z)=0.2;
    end
end
Features=Features/sqrt(norm(Features)^2+.001);     

%}


