%written RC 1/8/18 for P538 Matlab 2018
frosted='FROSTED FLAKES'
cheerios= 'CHEERIOS';
frosted_scrambled=frosted;
frosted_scrabled(9)='E';
frosted_scrambled([6 13])=['F' 'F']
disp(frosted_scrambled);

ff=find('FROSTED FLAKES' == 'F') %single "=" means "sets". double "==" is to check whether these are teh same things or not. ie. which values in "frosted flakes" equals "f", and find the 1's

%%
notavect='1 2 3 4 5'
vect2=linspace (2, 9, 8) %linspace: 2 to 9, evenly spaced, 8 numbers output
vect3=2:1:9 % 2 to 9 in steps of 1
vect4=2:2:9
vect5=9:-1:-3
linspace (9, -10, 20)
vect6=4:.5:10
vect6(3) %can index vectors as strings
vect6(2:4) %use vector to index a vector
vect6([2 6 8]) %the 2nd, 6th, 8th values in vect6
%%
%written RC 1/8/18 for P538 Matlab 2018
frosted='FROSTED FLAKES'
cheerios= 'CHEERIOS';
frosted_scrambled=frosted;
frosted_scrabled(9)='E';
frosted_scrambled([6 13])=['F' 'F']
disp(frosted_scrambled);

ff=find('FROSTED FLAKES' == 'F') %single "=" means "sets". double "==" is to check whether these are teh same things or not. ie. which values in "frosted flakes" equals "f", and find the 1's
%%
mat2=[4 5 6; 5 6 7; 4 5 6; 5 6 7]
[r, c]=find(mat2==5)
[i]=find(mat2==5)

%%
str = 'MACARONI AND CHEESE'
id1 = [1 2 7 13 14 15 16 17 18 19]
str (id1)
%%
id2 = [15 16 5 9 1 8 11 12 9 8 18 9 14 15 8 7 19 18 19]
str(id2)
%% 2.3 

A = 1:10
a=linspace(1, 10, 10)

B=10:2:18
b=linspace (10, 18, 5)

C = 19:-1:15
c-linspace(19, 15, 5)

D= 10:-2:-4
d=linspace(10, -4, 8)

E=0:3.1416:15:7080
e=linspace(0, 15.7080, 6)

F=0:pi:5*pi
f=linspace(0, 5*pi, 6)


%% 2.4
str = 'aaaaaaaaaaaaaaaaaaaa';
str([3 6 9 12 15 18])=['c'];
%str(3:3:end)='c';

str([2 5 8 11 14 17 20])=['b']
%str(2:3:end)='b';

str([4 5 6])= ['d' 'e' 'f']
str([6 12 18])

%str([3+(1:3) 7+(1:3) 15+(1:3)]) = 'defdefdef'

%% 2.5

measurement=linspace(12, 12+1.23*39, 40)
measurement(end)

%% 2.6
resp='rerekerererererererererererererererere'
disp(resp(5))
resp(5)='r'
resp(5);
disp(resp(2:2:end))
%% 2.7
vect=3:10
vect(5:-1:2)


%%
mat2 =[4 5 6; 5 6 7; 4 5 6; 5 6 7]
size (mat2)
mat2' % transpose 
mat2 + 1
mat2-[3 3 3] %error!
mat2 = [3 3 3; 3 3 3; 3 3 3; 3 3 3] %same thing as substracting a scalar 3
whos
mat2 + mat2' %MAtrix dimensions must agree
% can multiply and divide 
mat2/2
mat2*2
%vectors multiplied by matrices

%%
score=[1 .3 0 0 1 .5 1];
weights=[1 2 2 1 1 2 1];
whos
score * weights % there will be an error bc needs ".*"
score .* weights % point by point multiplication
%but if we want to multiply the vectors, we need to transpose 
score' * weights 
score * weights' %inner product
% frequency profile of sound envelope
2.^[1 2 3 4 5]
9^.5
sqrt(9)
log(10)
log10(10)
log(exp(1))
exp(1)
log10([5 6 7])
exp(1:3)
round(exp(1:3))
round(exp(1:3),1)
min(exp(1:3))
max(exp(1:3))
v1=rand(5,1) % 5 random numbers from 0 to 1
v2=rand(5,1)
mod(12, 10) %remainder when divide 12 by 10
mod(pi, 3) % good for making periodic functions
y=0:9
mod(y, 6)
mod(1000, 6)

%%
mat=rand(3, 4, 5)
mat(1, 1, :)
mat(end, :, 1) %bottom, all the columns, first time point
mat=rand(5,6)
mat(:, 3)%all the rows in the third column
mat(end, :) %all the columns in the last row
mat=rand(10, 5)
mat([1 6], :)
mat(1:5, end)
%%
fakefmri=rand(64, 64, 28, 80);
64 * 64 * 28 % number of voxels
fakefmri=randn(64, 64, 28, 80); %normal distributed fake data
span_pts =[ 1:10, 21:30, 41:50, 61:70]
% assume a cube-like brain for simplicity of 3d visualization
fakefmri(5:10, 7:17, 5:8, span_pts) = fakefmri(5:10, 7:17, 5:8, span_pts)+1;
size(fakefmri)
fakefmri(7, 10, 4, :)
plot(squeeze(fakefmir(7, 10, 4, :)))
imagesc(squeeze(fakefmri(:, :, 4,5)))
imagesc(squeeze(fakefmri(:, :, 7, 5)))
%% Lecture Notes 1/17/18
mat1=[1 2; 3 4];
mat2=[2 4; 4 5];
mat1.*mat2 %point-by-point multiplication
mat1 * mat2 % cl of 1 by row of 2
%% fakeBrain
TR=2;%how long it takes to do an image. 2 sec/image
t=1:TR:239;
brain=randn(64, 64, 28, 120);
% happy=repmat(0, 20, 1);
% size(happy)
% sad=repmat(1, 10, 1);
% %happysad=[happy sad];%alternating
% happysad' %transpose
% happysad=[happy; sad];
% % OR! happysad=[happy sad]; happysad=happysad(:)
% %DIVERSION: colon can create a vector out of a matrix e.g.
% mat=[1 2 3
%     4 5 6]
% vect=mat(:)
% vect
% 
% design = repmat(happysad, 6, 1);

design=repmat([repmat(0, 10, 1); repmat(1, 10 ,1)], 6, 1);
ROI = [20:30, 12:40, 18:23];

brain(20:30, 12:40, 18:23, find(design))=...
    brain(20:30, 12:40, 18:23, find(design))-1;
imagesc(brain(:, :, 20,13));
sad=mean(brain(:, :, 20, find(design)), 4);
subplot (1, 2, 1)
imagesc(squeeze(sad))
axis equal

%%
mat(:, :, 1)=[1 2 3; 4 5 6];
mat(:, :, 2)=[7 8 9; 10 11 12];
mat(2, 2:3, 1)


