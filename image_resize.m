a= imread('cameraman.tif');
[r,c] = size(a);
new = zeros(r*2,c*2);
y=1;x=1;
for i=1:2:r
    for j=1:2:c
        new(x,y) = a(i,j);
        y=y+1;
    end
    x=x+1;
    y=1;
end

figure()
imshow(a);

figure()
imshow(new/255);

        