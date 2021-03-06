%% Homework Chapter 3 

%% Q 3.1: Basic calculations.
mat=[ 3 4 5 ; 6 7 8; 9 10 11];

% a) Calculate the max of mat along each row.
max(mat')
% b) Calculate the overall mean of mat.
max(max(mat)) %=11
% c) Square each element of mat, and calculate the mean along each column.
mat2=mat.^2;
mean(mat2) %= 42    55    70

%% Q 3.2: more basic calculations.
 
% a) Calculate the mean of the vector: 
vect=[ 1 4 9 16 25 225]
mean(vect) %=46.6667
% b) Calculate the mean of the even numbers of vect.
vect2=[4 16]
mean(vect2) %=10
%mod function to select the even numbers??

%% Q 3.7: Inner and Outer Products

% You are examining generosity behavior in 12 three year olds. 
% The number of times each child is observed to engage in a sharing behaviour 
% with his/her peer is described by the vector: 
num_shares=[1   1   3  19  10   3  16  14   0   1   1  29]; 

% The number of interactions each 3 year old has with a peer during the
% observation period is described by a second vector: 
num_interact = [3   2  21  31  37   5  23  19   3  13   6  32]; 

% a) Find the average (across subjects) of the number of sharing behaviours 
% (av_shares) by adding all the values in num_shares and dividing by 12
av_shares = sum(num_shares)/12 %=8.1667
% b) use Matlab�s �mean� function to get the same number 
mean(num_shares) %=8.1667

% c) Now, create the vector: 
w = ones(12,1)./12;

% Show that the inner product of w and num_shares is the same as av_shares. 
% Try to use words to explain why. 
 w'* num_shares' %=8.1667
 %this is because each value in vector w is like a scalar (=1/12) for the
 %values in num_shares. Doing inner product is like taking the 1/12 of each
 %value in num_shares and adding them all up, which is just like taking the
 %sum of the values in num_shares and divide it by 12, i.e. av_shares.
% d) Use pointwise division to get the probability of sharing on a given peer 
% interaction for each child (prob_share) 
prob_share = num_shares./num_interact %= [ 0.3333    0.5000    0.1429    0.6129    0.2703    0.6000    0.6957    0.7368         0    0.0769    0.1667    0.9062 ]

% e) Show that the inner product of prob_share and num_interact is the same 
% as the sum of num_shares using matlab code. 
prob_share * num_interact' %=98
sum(num_shares) %=98
% Use words to explain why
% It is because doing the inner product of prob_share and num_interact is
% like using the each value in prob_share as a scalar for each value in
% num_interact, e.g. 3 * 0.3333, conceptually, it's the reverse process of
% deriving the probability of sharing on a given peer. So it restores it to
% num_shares, and, summing it all up, it's the same as taking a sum of
% num_shares. 