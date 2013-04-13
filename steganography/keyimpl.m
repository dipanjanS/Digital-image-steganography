function [KeyArray]=keyimpl(SecretCode)
SecKey=dec2bin(uint8(SecretCode),8);
SecKeySize=size(SecKey);

S=SecKeySize(1);
R=rem(S,4);
P=4-R;

if R~=0
    S1=S+P;
    
else
    S1=S;
end

PaddedKey=zeros(S1,8);
PaddedKeySize=size(PaddedKey);
for i=1:SecKeySize(1)
    for j=1:8
        PaddedKey(i,j)=SecKey(i,j)-48;
        
    end    
end
PaddedKey=fliplr(PaddedKey);
PaddedKey=circshift(PaddedKey,[PaddedKeySize(1)/2 -PaddedKeySize(2)/2]);
for i=1:PaddedKeySize(1)-1
    for j=2:PaddedKeySize(2)
        temp=bitxor(bitxor(PaddedKey(i,PaddedKeySize(2)-j+1),PaddedKey(i,PaddedKeySize(2)-j+2)),bitxor(PaddedKey(i+1,PaddedKeySize(2)-j+1),PaddedKey(i+1,PaddedKeySize(2)-j+2)));        
        PaddedKey(i,j)=bitxor(PaddedKey(i,j),temp);
        PaddedKey=circshift(PaddedKey,2);
    end    
end
PaddedKey=circshift(PaddedKey,[PaddedKeySize(1)/2 -PaddedKeySize(2)/2]);
PaddedKey=transpose(PaddedKey);

Resized=reshape(PaddedKey,32,[]);
Resized=transpose(Resized);

rKeySize=size(Resized);
KeyArray=zeros(1,32);

for i=1:rKeySize(1)/2
    for j=1:rKeySize(2)
        if(i==1||j==1)
            KeyArray(1,j)=bitxor(Resized(i,j),Resized(i+1,j));
        else
            temp=bitxor(bitxor(Resized(i,rKeySize(2)-j+1),Resized(i,rKeySize(2)-j+2)),bitxor(Resized(i+1,rKeySize(2)-j+1),Resized(i+1,rKeySize(2)-j+2)));
            KeyArray(1,j)=bitxor(KeyArray(1,j),temp);
            
        end
    end
end

  