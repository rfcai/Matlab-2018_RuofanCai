%excitingcolormaps
vect = 1:70;
ratID=vect(randperm(length(vect)))
ratID=sort(ratID(1:50)) 
% 
% On the remaining rats he collects 10000 trials, and he calculates the % correct across each bin of 100 trials.
binsteps=1:100:10000;
[X, Y]=meshgrid(1:length(ratID), 1:length(binsteps))
per=(Y+randi(10, size(Y))-5)
per(per>100)=100; per(per<0)=0;

img=[X,Y]

image(img); 
colormap(gray(5000));


for i=1:100
    for j=1:50
        pp=[per(i,j) per(i,j) per(i,j)]
        colormap(pp)
    end
end

