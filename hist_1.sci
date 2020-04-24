function  out_img  = hist_1( in_img)

L=256;

if(size(in_img,3)>1)
    in_img=rgb2gray(in_img);

    //display('The image is converted to grayscale image');
     figure;
    imshow(in_img);
    title('Original Image (Grayscale)');
end


counts=zeros(256,1);
for i=0:255
    counts(i+1)=sum(sum(in_img==i));
end
p=counts/(size(in_img,1)*size(in_img,2));

s=(L-1)*cumsum(p);

//round the float into the nearest integare
s=round(s);
out_img=uint8(zeros(size(in_img)));
for k=1:size(s,1)
    out_img(in_img==k-1)=s(k);
end

endfunction

