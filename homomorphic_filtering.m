a = imread('landsat4.jpg');
%a = rgb2gray(a);

%imfinfo('landsat2.jpg');
imshow(a);
title('Original');
im = im2double(a);

fftlogim = fft2(log(im+0.01));
f = butterhp(a,150,2);
c = fftlogim.*f;
h = real(ifft2(c));
%figure,imshow(h/255);
h1 = exp(h);
modified_image = ifftshow(h1);
title('Modified');

bit_layer(a);


