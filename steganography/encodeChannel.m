%The EncodeChannel fn outputs the two shares for a single channel
%the Input takes the Input Matrix and Encoder takes the Encoding Matrix
function [Share1,Share2] = encodeChannel (InputChannel,Encoder)
 J = InputChannel;
%I2=rgb2gray(I2);
%I2=histeq(I2);

k=size(J);
m=1;
n=1;
X=zeros(2*k(1),2*k(2));
Y=zeros(2*k(1),2*k(2));

for i=1:k(1)
    for j=1:k(2)
        if(J(i,j)==1)%black
            %share 1
            X(m,n)=0;
            X(m+1,n)=1;
            X(m,n+1)=1;
            X(m+1,n+1)=0;
            %share 2
            Y(m,n)=0;
            Y(m+1,n)=1;
            Y(m,n+1)=1;
            Y(m+1,n+1)=0;
        else %white
             %share 1
            X(m,n)=0;
            X(m+1,n)=1;%1
            X(m,n+1)=1;%1
            X(m+1,n+1)=0;
            %share 2
            Y(m,n)=1;%1
            Y(m+1,n)=0;
            Y(m,n+1)=0;
            Y(m+1,n+1)=1;%1
        end
    n=n+2;
    end
    n=1;
    m=m+2;
end

imwrite(X,'./temp/share1.jpg','jpg');
imwrite(Y,'./temp/share2.jpg','jpg');

close all;
I=imread('./temp/share1.jpg');
I2=imread('./temp/share2.jpg');
X=Encoder;
k=size(I);
X=imresize(X,k);

for i=1:k(1)
    for j=1:k(2)
        I(i,j)=X(i,j)+I(i,j);
        I2(i,j)=X(i,j)+I2(i,j);
    end
end

Share1=I;
Share2=I2;
