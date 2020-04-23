a = imread('blocks.jfif');
%imshow(a);
r = im2double(a);
C= 1;

%Logarithmic Operator :- Reducing contrast of the brighter regions 
figure()
s = C * log(1+r);
subplot(121)
imshow(a);
subplot(122)
imshow(s);


% Exponential :- enchancing th e contrast of brighter region
C= 2;
figure()
gamma = 2;
s = C * r.^gamma;
subplot(121)
imshow(a);
subplot(122)

imshow(s);
