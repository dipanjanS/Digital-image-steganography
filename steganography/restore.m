function [Y] =restore(Y)
%dipanjan section starts
%Final Version
avg=fspecial('average',[4,4]);
Y=filter2(avg,Y);
Y=medfilt2(Y,[3,3]);
Y=wiener2(Y,[3,3]);
psf=fspecial('gaussian',[7,7],1);
Y=imfilter(Y,psf,'replicate');
Y=edgetaper(Y,psf);
noise = 0.1*randn(size(Y));
nsr = sum(noise(:).^2)/sum(Y(:).^2);
Y=deconvwnr(Y,psf,nsr);
Y=imadjust(Y);
sf=fspecial('unsharp');
Y=imfilter(Y,sf);


%third version
% Y=histeq(Y,255);
% avg=fspecial('average',[4,4]);
% Y=filter2(avg,Y);
% Y=medfilt2(Y,[3,3]);
% Y=wiener2(Y,[3,3]);
% psf=fspecial('gaussian',[7,7],1);
% Y=imfilter(Y,psf,'replicate');
% Y=edgetaper(Y,psf);
% Y=deconvwnr(Y,psf,1);
% sf=fspecial('unsharp');
% Y=imfilter(Y,sf,'replicate');
% Y=imadjust(Y);

% second version
% Y=histeq(Y,65535);
% avg=fspecial('average',[4,4]);
% Y=filter2(avg,Y);
% Y=medfilt2(Y,[3,3]);
% Y=wiener2(Y,[3,3]);
% psf=fspecial('gaussian',[5,5],5);
% Y=imfilter(Y,psf,'replicate');
% Y=edgetaper(Y,psf);
% Y=deconvwnr(Y,psf,1);
% sf=fspecial('unsharp');
% Y=imfilter(Y,sf,'replicate');
% Y=imadjust(Y);

%first version
% Y = histeq(Y,65535);
% avg=fspecial('average',[4,4]);
% Y=filter2(avg,Y)/255;
% Y=medfilt2(Y,[3,3]);
% Y=wiener2(Y,[3,3]);
% psf=fspecial('gaussian',2,2);
% Y=deconvwnr(Y,psf,1);
% xf=fspecial('unsharp',0.5);
% Y=filter2(xf,Y);
% Y=imadjust(Y);
%dipanjan section ends