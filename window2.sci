function w=window2(N,M,alpha)

wc=window('kr',N,alpha);
wr=window('kr',M,alpha);
[maskr,maskc]=meshgrid(wr,wc);

//maskc=repmat(wc,1,M); Old version
//maskr=repmat(wr',N,1);

w=maskr.*maskc;

end
