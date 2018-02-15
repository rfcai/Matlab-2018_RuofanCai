%% 6.1
m=100
n=round(100/.618);
[X,Y] = meshgrid(linspace(-1,1,n));
X(30:40, 10:90)=.25
X(60:70, 10:90)=.75
imagesc(X);
figure(1)
colormap(gray(256))
figure(2)
colormap(autumn)
figure(3)
colormap(summer)

%% 6.2
n=100
[X,Y] = meshgrid(linspace(-1,1,n);

sqrt(X.^2+Y.^2)
% :(((