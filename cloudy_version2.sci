// loading image 
chess2 = imread('landsat1.jpg');
chess=chess2;
//imfinfo('chessboard.png');
//chess = ind2gray(chess,chessmap);
[r_chess,b_chess,g_chess]=RGB_splitter(chess);
r_chess = im2double(r_chess);
b_chess = im2double(b_chess);
g_chess = im2double(g_chess);
//figure;
//subplot(121)
//imshow(im2uint8(chess),chessmap);
//title("Original image");

[h w]=size(r_chess);

//noise generated
X = butterhp(r_chess,50,1);
/*t1 = rand(10);
t=interp2(t1,9);
t = imresize(t,0.3);
t = t(1:size(chess,1),1:size(chess,2));*/
t = X ;//movingmean((1-0.02)*rand(h,w)+ 0.02,101,2,2);
//t =(1-0.02)*rand(h,w)+ 0.02;
//t =im2uint8(t);
// noise displayed
//subplot(121)
imshow((t));
title('noise displayed');


// parameters for image 
alpha = 1;
L_r = max(r_chess(:));// brightest pixel
L_b = max(b_chess(:));// brightest pixel
L_g = max(g_chess(:));// brightest pixel

r_red = r_chess; // r= desired image 
r_blue = b_chess; // r= desired image 
r_green = g_chess; // r= desired image 


//subplot(224)
//imshow(r);
//title('r')

// computation of the algorithm
s_red = (((alpha*L_r).*r_red).*t) + L_r.*(1-t);
s_blue = (((alpha*L_b).*r_blue).*t) + L_b.*(1-t);
s_green = (((alpha*L_g).*r_green).*t) + L_g.*(1-t);

// Recombination of 3 channels;
s = RGB_recombiner(s_red,s_blue,s_green,chess);

//subplot(223)
figure;
imshow(s);
title('input')
//-----------------------------------------------------------------------------------

raw_input_red = log(L_r-s_red +0.00001);
raw_input_blue = log(L_b-s_blue +0.00001);
raw_input_green = log(L_g-s_green +0.00001);
// FFT Transform of raw_input
raw_input_fft_red = fft2(raw_input_red);
raw_input_fft_blue = fft2(raw_input_blue);
raw_input_fft_green = fft2(raw_input_green);

//------------------------------------------------------------------------------------

// Ideal low pass filter
Hj=ideal_hpf(chess,10000);
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
    Output_in_frequency_domain_red = raw_input_fft_red.*H_uv;
    Output_in_frequency_domain_blue = raw_input_fft_blue.*H_uv;
    Output_in_frequency_domain_green = raw_input_fft_green.*H_uv;
    
    //stage 2
    // IFFT of the previous frequncy domain output
    Output_in_time_domain_red = ifft2(Output_in_frequency_domain_red);
    Output_in_time_domain_blue = ifft2(Output_in_frequency_domain_blue);
    Output_in_time_domain_green = ifft2(Output_in_frequency_domain_green);
    
    //stage 3 removing exponent
    t_new_red = exp(Output_in_time_domain_red);
    t_new_blue = exp(Output_in_time_domain_blue);
    t_new_green = exp(Output_in_time_domain_green);
    
    //ifftshow(t_new);
    //title('t_new');
    //--------------------------------------------------------------------------------
    
    output_image_red = ((L_r/alpha) - ((L_r-s_red)./(alpha*(t_new_red))));
    
    output_image_blue = ((L_b/alpha) - ((L_b-s_blue)./(alpha*(t_new_blue))));
    output_image_green = ((L_g/alpha) - ((L_g-s_green)./(alpha*(t_new_green))));
   
    //imshow(output_image);
    get_red = ifftshow((output_image_red));
    get_blue = ifftshow((output_image_blue));
    get_green = ifftshow((output_image_green));
    
    //subplot(224)
    /*{
    figure()
    imshow(get)
    title("L*r");
    %}*/
    /*
   %{
    figure;
    subplot(121);imshow(get);
    subplot(122);imhist(get); 
    imh = imadjust(get,[0.2,0.7],[0.0,1.0]);
    %}*/
    imh1_red = imhistequal(get_red);
    imh1_blue = imhistequal(get_blue);
    imh1_green = imhistequal(get_green);
    
    imh1 = RGB_recombiner(imh1_red,imh1_blue,imh1_green,chess);
    
    //figure;
    //subplot(221);imshow(imh);title('stretch');
    //subplot(222);imhist(imh);
    //subplot(224)
    figure
    imshow(imh1);title('Output');
    //subplot(122);imhist(imh1);
    
    
    //bit_layer(get);
    


    



