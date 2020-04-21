
%bit planes say a pixel has illumination of 159 ~ 10011111
% so corresponding to each pixel there will be nos of bits = plane of 
function [ ] = bit_layer(a)

 %a= (imread('landsat1.jpg'));
 
 %a =rgb2gray(a);
 
 [h w] = size(a);
     

cd = double((a));
p1=mod(cd,2);
p2=mod(floor(cd/2),2);
p3=mod(floor(cd/4),2);
p4=mod(floor(cd/8),2);
p5=mod(floor(cd/16),2);
p6=mod(floor(cd/32),2);
p7=mod(floor(cd/64),2);
p8=mod(floor(cd/128),2);




subplot(241)
imshow(p1)
subplot(242)
imshow(p2);
subplot(243)
imshow(p3);
subplot(244)
imshow(p4);
subplot(245)
imshow(p5);
subplot(246)
imshow(p6);
subplot(247)
imshow(p7);
subplot(248)
imshow(p8);



P =2*(2*(2*(2*(2*(2*(2*p7+p6)+p5)+0)+p4)+p3)+p2)+p1;

figure()
imshow(uint8(P));
title('bitlayer output')

end
