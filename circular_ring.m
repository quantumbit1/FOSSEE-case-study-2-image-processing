% LOW PASS FILTERS CAN BE MADE USING CIRCLE  
% image in which we will allow center to pass will make lowpass filter

[x, y] = meshgrid(-128:127,-128:127);
z= sqrt(x.^2+y.^2);
c = z<15;
figure,imshow(c);

cf = fftshift(fft2(c));
cf1 = log(1+abs(cf));
m = max(cf1(:));
figure,imshow(im2uint8(cf1/m));

b = 1./(1+(z./15).^2);
figure,imshhow(b);