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

%% 2.4
str = 'aaaaaaaaaaaaaaaaaaaa';
str([3 6 9 12 15 18])=['c'];
str([2 5 8 11 14 17 20])=['b']
str([4 5 6])= ['d' 'e' 'f']