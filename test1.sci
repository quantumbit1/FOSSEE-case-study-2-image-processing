a = imread('camera.tif');
//b= imread('circles.tif');
figure()
subplot(221);
imshow(a)
b = rand(128,128)> 0.51;
subplot(222);
imshow(b)


//colormap(autumn)

//[i,imap] = imread('flowers.gif');
// here imap variable stores the mapped RGB value
//
/*subplot(223)
imshow(i,imap)
*/
c= a>120;
subplot(223);
imshow(c);


figure()
d= im2double(a);
imshow(d);



impixelinfo 
