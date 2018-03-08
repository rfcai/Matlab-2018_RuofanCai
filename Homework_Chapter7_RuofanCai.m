%% Q7.1 Structures

% create a structure, mystruct that contains 3 fields.
% mystring : which contains your name
% mychange: a double (default for any number) containing the amount of loose change in your wallet or puse
% mygender: a logical, with 1 for female and 0 for male
mystruct.mystring='Ruofan';
mystruct.mychange=1.25;
mystruct.mygender=1
% now make a second element in that structure (mystruct(2).fieldname) with
% the same information for someone else (imaginary is fine).
mystruct(2).mystring='Grace';
mystruct(2).mychange=2.5;
mystruct(2).mygender=1

%% Q 7.2 Cell arrays

% Make a 3 (fields) x 2 (individuals) cell array that contains all the
% information of the structure above
mycell={mystruct.mystring; 
        mystruct.mychange; 
        mystruct.mygender}
% pull out the name of the second individual.
mycell{1,2}
% pull out the amount of change that you had and add it to amount of change
% the other individual had.
mycell{2,1} + mycell {2,2}



