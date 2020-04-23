function [recombinedRGBImage] = RGB_recombiner(redchannel,bluechannel,greenchannel,rgbImage)
% Create an all black channel.
allBlack = zeros(size(rgbImage, 1), size(rgbImage, 2), 'uint8');
% Create color versions of the individual color channels.
just_red = cat(3, redchannel, allBlack, allBlack);
just_green = cat(3, allBlack, greenchannel, allBlack);
just_blue = cat(3, allBlack, allBlack, bluechannel);

% Recombine the individual color channels to create the original RGB image again.
recombinedRGBImage = cat(3, redchannel, greenchannel, bluechannel);
end

