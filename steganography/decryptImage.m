function  [Output] = decryptImage (Share1,Key)

sizeImage=size(Share1);
keySize=size(Key);
Output = zeros(sizeImage(1),sizeImage(2));
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
        Output(i,j)=bitxor(Share1(i,j),Key(m,n));
        n=n+1;
    end
    m=m+1;
end

clear sizeImage ;
clear Share1;
clear Share2;
clear keySize;