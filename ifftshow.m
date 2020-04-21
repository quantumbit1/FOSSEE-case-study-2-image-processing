function [new_image] = ifftshow(f)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
f1 = abs(f);
fm = max(f1(:));
new_image=im2uint8(f1/fm);
figure,imshow(new_image);
end

