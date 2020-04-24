// loading image 
[chess2] = imread('chessboardgrayscale.png');
chess=chess2;
//imfinfo('chessboard.png');
//chess = ind2gray(chess,chessmap);
chess = im2double(chess);
//subplot(221)
//imshow(im2uint8(chess));
//title("Original image");

[h w]=size(chess);

// noise generated
/*
p = graycolormap(size(chess,1));
row = size(chess,1);
cols= size(chess,2)/3+1;
rep_p = repmat(p,row,cols);
t=rep_p(1:size(chess,1),1:(size(chess,2)));

*/
X = cloud_noise(chess,10,1);
t = X;
//t =(1-0.02)*rand(h,w)+ 0.02;
//t =im2uint8(t);
// noise displayed
//subplot(222)
//imshow((t));
//title('noise displayed');


// parameters for image 
alpha = 0.6;
 //-----------------------------------------------------------------------------
 /*
Class  Approximate Transmission
Fu11    Cloud O. 1
Most    Cloud 0.3
Ha1f    Cloud 0.5
Small   Cloud 0.75
Water   (No Cloud) 1.0
Ground  (No Cloud) 1.0
*/
//------------------------------------------------------------------------------



L = max(chess(:));// brightest pixel 
r = chess; // r= desired image 
//subplot(224)
//imshow(r);
//title('r')

// computation of the algorithm
s = (((alpha*L).*r).*t) + L.*(1-t);
//subplot(223)
figure()
imshow(s);
title('INPUT')

raw_input = log(L-s +0.01);
// FFT Transform of raw_input
raw_input_fft = fft2(raw_input);


// Ideal low pass filter
Hj=ideal_hpf(chess,15);
    //Inverse FFT 
    hj=ifft2(bool2s(Hj));
        // Kaiser Window
        kaiser_coefficient = 0;    //alpha	window shape
                                  //0 	Rectangular shape
                                 //5  	Similar to the Hamming window
                                //6   	Similar to the Hanning window
                               //8.6  	Similar to the Blackman window
        w= window2(h,w,kaiser_coefficient);
        //multiply
        h_spatial=hj.*w;
    //FFT 
    H_uv=fft2(h_spatial);
   
//Output steps 
    //stage 1
    //frequency domain multiplication of raw_input_fft with H_uv to produce 
    //output in frquency domain.
    Output_in_frequency_domain = raw_input_fft.*H_uv;
    
    //stage 2
    // IFFT of the previous frequncy domain output
    Output_in_time_domain = ifft2(Output_in_frequency_domain);
    
    //stage 3 removing exponent
    t_new = exp(Output_in_time_domain);
    //ifftshow(t_new);
    //title('t_new');
    
    
    output_image = ((L/alpha) - ((L-s)./(alpha*(t_new))));
    
    //imshow(output_image);
    ifftshow((output_image));
    title("OUTPUT");
    
    //subplot(224)
    //imshow(get)
    //title("L*r");
    
    
    //bit_layer(get);
    


    



