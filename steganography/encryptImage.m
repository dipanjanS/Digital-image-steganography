function [Share1] = encryptImage (InputChannel,Key)

sizeImage=size(InputChannel);
InputChannel=dither(InputChannel);
keySize=size(Key);
Share1=zeros(sizeImage(1),sizeImage(1));
m=1;
n=1;
for i=1:sizeImage(1)
    if(m>keySize(1))
            m=1;
    end
    for j=1:sizeImage(2)
        if(n>keySize(2))
            n=1;
        end
        Share1(i,j)=bitxor(InputChannel(i,j),Key(m,n));
        n=n+1;
    end
    m=m+1;
end

clear sizeImage ;
clear InputChannel;
clear keySize;