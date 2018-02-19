% Questions for Chapter 5 ? Instructor version
% 
% 5.1 Union Jack 
% 
% 
% Fill in the missing bits of code to make the series of figures
% 
% 
clear all
flagsize=15;
saltire=zeros(flagsize);

for i=1:flagsize
    saltire(i, i)=1;
    saltire((flagsize+1)-i, i)=1;
end

figure(1)
image(saltire+1)
cmap=[0 0 1; 1 1 1]
colormap(cmap)

figure(2)
image(saltire+1)
cmap= [1 0 0 ; 1 1 1]
colormap(cmap)

george=zeros(flagsize);
george(ceil(flagsize/2), :)=1;
george(:,ceil(flagsize/2))=1;


figure(3)
image(george+1)
cmap=[ 1 1 1 ; 1 0 0];


colormap(cmap)



union=(saltire+(2*george))+1;
union(union>3)=3;
figure(4)
image(union)


cmap(1, :)= [0 0 1]
cmap(2, :)= [1 0 0]
cmap(3, :)= [1 0 0]
colormap(cmap)

bars=[ceil(flagsize/2)-1 ceil(flagsize/2)+1];
union(bars, :)=union(bars, :)+3;
union(:,bars)=union(:, bars)+3;
union(union>6)=union(union>6)-3; 
% convert all values greater than 6 to 6
figure(5)
image(union)
cmap(4, :)= [1 1 1]
cmap(5, :)= [1 1 1]
cmap(6, :)= [1 0 0]
colormap(cmap)

for i=1:flagsize
    for j=1:flagsize
        if i==j-1 | j==i-1 ...
                || i==j+1 || j==i+1 
            if union(i, j)<6
                union(i, j)=5;
                union(i, flagsize-(j-1))=5;
            end
        end
    end
end

figure(6)
image(union)
colormap(cmap)
axis off; axis equal




%% 5.2 Indexing into a linear array in real world co-ordinates
% Miguel collects data for an EEG experiment.  Each session of data consists of 30 trials, each lasing 5s. The EEG machine records data every 2ms. Strangely his data looks like a perfect sinusoid, with 0 mean normally distributed noise. 
ntrials=30;
durtrial=5*1000;
timevec=0:2:durtrial*ntrials;
data=sin((2*pi* timevec)/(durtrial))+.1*randn(size(timevec));
plot(timevec, data, '-')

% a) What is the mean response during all the data points that are within the first ½ second of every trial 

% data points: from 1 to 250th... 
for n=1:ntrials
    timepoints_a = (((n-1)*((length(timevec)-1)/ntrials)+length(0:2:0)):((n-1)*((length(timevec)-1)/ntrials)+length(0:2:500)));
    mean_response=mean(data(timepoints_a));
    disp(['The mean response during the first 1/2 second of Trial ', num2str(n), ' is ', num2str(mean_response), '.']);
end

% b) What is the mean response during the interval 2-2.5s of each trial?
% rephrase: first time point is 0 ms, second timepoint is 2 ms, which timepoint
% is 2000 ms? 
for n=1:ntrials
    timepoints_b = (((n-1)*((length(timevec)-1)/ntrials)+length(0:2:2000)):((n-1)*((length(timevec)-1)/ntrials)+length(0:2:2500)));
    mean_response=mean(data(timepoints_b));
    disp(['The mean response during the interval 2-2.5s of Trial ', num2str(n), ' is ', num2str(mean_response), '.']);
end

% c) during which timepoints does the EEG response have values greater than 0.9?
find(data>0.9)
% d) during which timepoints does the EEG response have values between 0.7 and 0.8?
find(data>0.7 & data<0.8)
% (obviously you will get different answers each time because your data will vary each time).

%% 5.3 Indexing into a matrix using real world co-ordinates
% Sam Lin collects data on 70 rats. 20 of them were duds and their data were thrown away. 
vect = 1:70;
ratID=vect(randperm(length(vect)))
ratID=sort(ratID(1:50)) 
% 
% On the remaining rats he collects 10000 trials, and he calculates the % correct across each bin of 100 trials.
binsteps=1:100:10000;
[X, Y]=meshgrid(1:length(ratID), 1:length(binsteps))
per=(Y+randi(10, size(Y))-5)
per(per>100)=100; per(per<0)=0

% a) image the rats performance in a matrix with trials along the x axis and rats along the y axis using a colormap that varies between white for 100% correct and black for 0% correct (not using imagesc)

figure(1)

image(per')
newmat=reshape(per, 5000,1)
pod=repmat(newmat,3)
xlabel('Trial');
ylabel('Rat');
colormap(pod/100)

% b) change the colormap so that values above 90% are white and values below 10% are black.
per(per>90)=100; per(per<10)=0;
figure(2)

image(per')
newmat=reshape(per, 5000,1)
pod=repmat(newmat,3)

colormap(pod/100)

colorbar

% c) how many rats performed above 66% correct between trials 6001-7001?
subper=per(61:71,:)
length(find(subper>66))
% d) which rats were they?
[row, col]=find(subper>66)
% all 50 rats.
% e) How many trials would be needed for 40/50 rats to be performing above 80%.
% f) It turns out that for the rats with even ID numbers (2, 4, 6 10 etc.) the recording machine was on the blink for an interval between the 5678th trial and the 7533rd trial. Convert those numbers to NaN.
% 
