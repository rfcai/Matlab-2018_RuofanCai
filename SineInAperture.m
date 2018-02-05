%SineInAperture

%one-dimensional sine wave
clear all
close all
x=linspace(-pi, pi, 100)
sf=6; %spatial frequency
sinewave=sin(x * sf)
plot(x, sinewave)

oneM=ones(size(sinewave)); %create 1 by 100 matrix, fill it with ones.
sinewave2D=oneM' * sinewave;
imagesc(sinewave2D); colormap(gray)

whos

max(sinwave2D(:))
min(sinwave2D(:))

% to manually achieve the imagesc
sinewave2D_scaled=((sinewave2D+1)*127.5)+1;
image(sinewave2D_scaled); colormap(gray(256))

amp=.5
sincewave2D=amp * (oneM'*sinewave);


rad=1.7
for r=1:length(x)
    for c=1:length(x)
        if x(r)^2 +x(c)^2 > rad^2
            sinewave2D_scaled(r,c)=128.5;
        end
    end
end

image(sinewave2D_scaled); 
colormap(gray(256))



%% mesh grid
[X, Y]=meshgrid(linspace(-pi, pi, 100);
ind=find(X.^2+Y.^2 <rad^2)
imagesc(X)

%% example of controlling color map
kid10=2:7+randn(5,1);
kid5=2:7+randn(5,1)+3;


clear all

for k=1:10
    kid10(k,:)=[2:7]+randn(1,6);
    kid5(k,:)=[2:7]+randn(1, 6)+3';
end

imagesc(kid10); colormap(gray)

subplot(1,2, 1)
imagesc(kid5);colormap(gray)
subplot(1,2,2)
imagesc(kid10);colormap(gray)
%instead of using imagesc which erases the +3 difference after scaling
subplot(1,2,1)
image(kid5+1); colormap(gray(14))
subplot (1,2,2)
image(kid10+1);colormap(gray(14))


