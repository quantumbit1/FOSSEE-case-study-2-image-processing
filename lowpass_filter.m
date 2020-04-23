a = imread('cameraman.tif');
af = fftshift(fft2(a));
figure,imshow(af);

fftshow(af);

%LOW PASS FILTER DESIGNING

[x,y] = meshgrid(-128:127,-128:127);
z = sqrt(x.^2+y.^2);
c=z<50;


%convolution in spatial domain results in multiplication in frequncy domain

af1 = af.*c;
fftshow(af1);
ifftshow(ifft2(af1));

a_lp_image = ifft2(af1);
hb = butterlp(a_lp_image,50,2);
af = fftshift(fft2(a));
fftshow(af);
afhb = af1.*hb;
fftshow(afhb);
ifftshow(ifft2(afhb));


