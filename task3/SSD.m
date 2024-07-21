function ssd = SSD(A,B) 
X = A - B;
ssd = sum(X.^2);
end