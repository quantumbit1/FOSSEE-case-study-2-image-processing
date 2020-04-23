function [redchannel,bluechannel,greenchannel] = RGB_splitter(im)
rgbImage = im;
% Extract color channels.
redchannel = rgbImage(:,:,1); % Red channel
greenchannel = rgbImage(:,:,2); % Green channel
bluechannel = rgbImage(:,:,3); % Blue channel
end

