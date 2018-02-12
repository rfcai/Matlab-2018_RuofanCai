%paintpots.m

img=1:5

pp1=[0 0 0; .25 .25 .25; .5 .5 .5; .75 .75 .75; 1 1 1 ];
%pp1=repmat([0:.25:1]', 1, 3);


pp2 = [ 0 0 1; 1 0 0; 0 1 0; .5 0 1; 1 0 1]

figure(1)

image(img)

colormap(pp1)
colormap(pp2)

%set of indices, paint these indices
colormap(hot(5)) %red and white

image (1:40)
colormap(hot(40))
colormap(hsv(40))
colormap(jet(40))
colormap(spring(40))
doc graph3d
doc colormap

pp2(5, :)=[ 1 1 1] %always three columns (ie three guns)
image(img); colormap(pp2)


