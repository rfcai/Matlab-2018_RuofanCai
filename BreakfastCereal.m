%written RC 1/8/18 for P538 Matlab 2018
frosted='FROSTED FLAKES'
cheerios= 'CHEERIOS';
frosted_scrambled=frosted;
frosted_scrabled(9)='E';
frosted_scrambled([6 13])=['F' 'F']
disp(frosted_scrambled);

ff=find('FROSTED FLAKES' == 'F') %single "=" means "sets". double "==" is to check whether these are teh same things or not. ie. which values in "frosted flakes" equals "f", and find the 1's

