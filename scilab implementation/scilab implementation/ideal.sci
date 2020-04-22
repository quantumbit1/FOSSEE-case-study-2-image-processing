function [out] = ideal(im,D)
//UNTITLED6 Summary of this function goes here
//   Detailed explanation goes here
    h = size(im,1);// height of the image
    w = size(im,2);// width of the image 
    // Here we are making the filter according to the width of th e fiter 
    [x ,y] = meshgrid(-floor(w/2):floor((w-1)/2),-floor(h/2):floor((h-1)/2));
    z = sqrt(x.^2+y.^2);
    out=z<=D;// cutoff frequency;
    figure()
    imshow(out)
    pause(2);
endfunction
