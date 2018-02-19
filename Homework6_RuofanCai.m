%% 6.1
[X,Y]=meshgrid(-pi:.01:pi);
R=X.^2+Y.^2;

R2=R<1.2.^2;
R3=R<
image(R2)
cmap= [.25 .25 .25; 1 1 1];
colormap(cmap)
axis equal

M=ones(size(X));
N=1+M(:, round(1:size(M,2)/2));
Q=[M N M];
imagesc(Q)

%% 6.2
n=701
nseg=6
radius=.7;

[X,Y] = meshgrid(linspace(-1,1,n));

image([X,Y]); colormap(gray(256))
F=mod(atan2(X, Y), pi/6);
imagesc(F); colormap(gray(256))
axis equal

radiusimage=sqrt(X.^2+Y.^2);
aperture=F;
aperture(radiusimage<radius)=1;

illusion=mod(atan2(Y,X)./pi*nseg,1).*aperture;
imagesc(illusion);
axis square
axis off
colormap(gray(256))
