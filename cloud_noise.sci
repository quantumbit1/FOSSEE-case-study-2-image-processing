function [out] = cloud_noise(im,D,n)
//UNTITLED6 Summary of this function goes here
//   Detailed explanation goes here
h = size(im,1);// height of the image
w = size(im,2);// width of the image 
// Here we are making the filter according to the width of th e fiter 
[x ,y] = meshgrid(-floor(w/2):floor((w-1)/2),-floor(h/2):floor((h-1)/2));
out  = 1./(1+(D./(x.^2+y.^2).^0.5).*(2*n));
out = 1-out;
figure;
imshow(out);

end

