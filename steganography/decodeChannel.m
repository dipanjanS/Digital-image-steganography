%the DecodeChannel fn outputs the restored OutputChannel  
%the inputs taken are Share1 and the share2
function [OutputChannel]= decodeChannel(Share1,Share2)
close  all;
I = Share1;
I2 = Share2;
k=size(I);
X=zeros(1);
Y=zeros(1);
for i=1:k(1)
   for j=1:k(2)
    
        if(I(i,j)==I2(i,j))
            X(i,j)=1;
        else
            X(i,j)=0;
        end
   end
end
i=1;
j=1;
for m=1:k(1)/2
    for n=1:k(2)/2
        if(X(i,j)==0 && X(i+1,j)==0&&X(i,j+1)==0&&X(i+1,j+1)==0)
            Y(m,n)=0;
        else Y(m,n)=1;
           
        end
        j=j+2;
    end
    j=1;
    i=i+2;
end
OutputChannel=Y;