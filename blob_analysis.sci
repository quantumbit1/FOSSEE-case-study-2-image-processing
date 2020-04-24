RGB = imread("landsat6.jpeg");
i = rgb2gray(RGB);
//i=RGB;
figure();imshow(RGB);
InvertedImage = uint8(255*ones(size(i,1),size(i,2))) - i;
figure();imshow(InvertedImage);
Histogram = imhist(InvertedImage);
figure();plot(0:255,Histogram);


//finding threshold automatically using Otsu method

Threshold = imgraythresh(InvertedImage)

LogicalImage = im2bw(InvertedImage,Threshold);

StructureElement = imcreatese('rect',5,5);
FilteredLogicalImage = imclose(LogicalImage,StructureElement)
[ObjectImage,n] = imlabel(FilteredLogicalImage);

f1=scf(1);f1.name='Logical Image';
imshow(LogicalImage);
f2=scf(2);f2.name='Filtered Logical Image';
imshow(FilteredLogicalImage,jetcolormap(n))
f3=scf(3);f3.name='Result of Blob Analysis';
imshow(ObjectImage,jetcolormap(n))


//Blob defining area.
[Area, BB] = imblobprop(ObjectImage);
f4=scf(4);f4.name='Result of Blob Analysis';
figure();
imshow(RGB);
imrects(BB,[255 0 0]);
