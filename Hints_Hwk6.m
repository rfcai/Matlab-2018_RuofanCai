

[X,Y]=meshgrid(-pi:.1:pi);
image(R)
colormap(gray(256))

R2=R<1.2.^2;

image(R2)
colormap(gray(256))

M=ones(size(X));
N=1+M(:, round(1:size(M,2)/2));
Q=[M N M];
imagesc(Q)

F=mod(atan2(X, Y), pi/4);
imagesc(F); colormap(gray(256))


