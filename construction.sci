
a =[1 2 3;4 5 6]
ntimes = 1;
Xq = 1:1/2^ntimes:size(a,2);
Yq = 1:1/2^ntimes:size(a,1);
V = a;
X = V(1,:);
v_cols = size(V,1);
Y = V(1,1:v_cols);

Z = cos(X')*cos(Y);

C  = splin2d(X,Y,Z,"periodic");
 
t1  = interp2d(Xq,Yq,X,Y,C,"by_zero");
