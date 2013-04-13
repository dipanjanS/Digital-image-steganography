function [Key] = createKey(PrivateKey)

PublicKey =keyimpl('This Is the Public Key Change This As Required');
publicKeySize=size(PublicKey);
privateKeySize=size(PrivateKey);
Key=zeros(publicKeySize(2),privateKeySize(2));
for i=1:publicKeySize(2)
    for j=1:privateKeySize(2)
        if(i==1||j==1)
            Key(i,j)=bitxor(PublicKey(i),PrivateKey(j));
        else
            temp=bitxor(bitxor(PublicKey(publicKeySize(2)-i+1),PrivateKey(j)),bitxor(PublicKey(i),PrivateKey(privateKeySize(2)-j+1)));
            Key(i,j)=bitxor(Key(i-1,j-1),temp);
        end
    end
end
disp(Key);