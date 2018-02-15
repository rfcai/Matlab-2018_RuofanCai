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


%%
clear all; close all

fram.apSize=100;
fram.backLum=128.5;
frame.apNum=2; frame.apSep=50;

% should stay fixed across apertures
frame.apSize=100; %number of pixels in aperture
frame.backLum=128.5

stim(1).amp= .5;
stim(1).sf=3;
stim(1).rad=3;
stim(1,1).type='spiral'
stim(1,1).rad=3;% remember aperture defined between +/=pi
stim(1,1).ap='circular'; %or gaussian
stim(1,1).npix=frame.apSize;


stim(1,2).amp=1;stim(2).sf=2;
stim(1,2).orient=90;stim(2).type='spokes';
stim(1,2).rad=2; stim(2).ap='circular';
stim(1,2).npix=frame.apSize;

stim(2,1).amp=3; stim(2).sf=2;
stim(2,1).orient=90;stim(2).type='radial';
stim(2,1).rad=2; stim(2).ap='circular';
stim(2,1).npix=frame.apSize;

stim().amp=.5; stim(2).sf=2;
stim(4).orient=-45;stim(2).type='grating';
stim(4).rad=2; stim(2).ap='gaussian';
stim(4).npix=frame.apSize;

%% build the array
bigMatSize = [(frame.apNum+1)*frame.apSep] + ...
    [frame.apSize * frame.apNum];
bigMat=frame.backLum * ones(bigMatSize);
stpt = [frame.apSep (frame.apSep *2)+ frame.apSize];
for i = 1:frame.apNum
    for j=1:frame.apNum
        [ sw2D ] = make2Dsinewave(stim(i,j)
        [ sw2D ] = putinaperture(sw2D, stim((i,j)