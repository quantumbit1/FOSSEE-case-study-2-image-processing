% loading image 
[chess2,chessmap] = imread('chessboardgrayscale.png');
chess=chess2;
%imfinfo('chessboard.png');
%chess = ind2gray(chess,chessmap);
chess = im2double(chess);
%subplot(221)
imshow(im2uint8(chess),chessmap);
title("Original image");

[h w]=size(chess);

% noise generated
X = butterlp(chess,1,1);
t = X;
%t =(1-0.02)    *rand(h,w)+ 0.02;
%t =im2uint8(t);
% noise displayed
%subplot(222)
imshow((t));
title('noise displayed');


% parameters for image 
alpha = 0.6;
L = max(chess(:));% brightest pixel 
r = chess; % r= desired image 
%subplot(224)
%imshow(r);
%title('r')

% computation of the algorithm
s = (((alpha*L).*r).*t) + L.*(1-t);
%subplot(223)
figure()
imshow(s);
title('s')

raw_input = log(L-s +0.01);
% FFT Transform of raw_input
raw_input_fft = fft2(raw_input);


% Ideal low pass filter
Hj=ideal_hpf(chess,15);
    %Inverse FFT 
    hj=ifft2(Hj);
        % Kaiser Window
        w= window2(h,w,@kaiser);
        %multiply
        h_spatial=hj.*w;
    %FFT 
    H_uv=fft2(h_spatial);
   
%Output steps 
    %stage 1
    %frequency domain multiplication of raw_input_fft with H_uv to produce 
    %output in frquency domain.
    Output_in_frequency_domain = raw_input_fft.*H_uv;
    
    %stage 2
    % IFFT of the previous frequncy domain output
    Output_in_time_domain = ifft2(Output_in_frequency_domain);
    
    %stage 3 removing exponent
    t_new = exp(Output_in_time_domain);
    %ifftshow(t_new);
    %title('t_new');
    
    
    output_image = ((L/alpha) - ((L-s)./(alpha*(t_new))));
    
    %imshow(output_image);
    get = ifftshow((output_image));
    
    
    %subplot(224)
    figure()
    imshow(get)
    title("L*r");
    
    
    %bit_layer(get);
    


    



