clear all

%% load in data 
% [~, headers]=xlsread('Psych315W18survey.csv', 'A1:AP1'); 
% [~, ~, data]=xlsread('Psych315W18survey.csv', 'A2:AP153'); 
% Macs cannot open the csv file with the provided command even after changing 
% the csv's to xls's - there was still a warning about "basic mode"...
% so Geoff provided the matlab file named "survey.mat" which contains the
% same data. but that introduced more changes to the homework questions, so
% I just commented out the original template you provided.

load survey 

%% breakdown of computers by gender  
p.gender_class 
for i=1:4;
    for j=1:2;
        f(i,j)= sum(p.computer==i & p.gender==j);
    end
end

f=f([1,4], [1,2])
% 1= APPLE .  4=PC ; 1=FEMALE . 2=MALE
% f =
% 
%     74 (Female Mac)    17 (Male Mac)
%     45 (Female PC)     13 (Male PC)

f(1,1)=f(1,1)/sum(p.gender==1)
f(2,1)=f(2,1)/sum(p.gender==1)
f(1,2)=f(1,2)/sum(p.gender==2)
f(2,2)=f(2,2)/sum(p.gender==2)

% ans:
% f =
% 
%     0.6066    0.5667
%     0.3689    0.4333

a1=subplot(2,2,1);
bar(f)
set(gca,'XTickLabel', {'Apple', 'PC'});
legend ('Female','Male');


%%standard error=npq

sterr=sqrt([[sum(p.gender==1) * f(1,1) * f(2,1)]./sum(p.gender==1) ...
           [sum(p.gender==1) * f(1,1) * f(2,1)]./sum(p.gender==1) ; ...
           [sum(p.gender==2) * f(2,1) * f(2,2)]./sum(p.gender==1) ...
           [sum(p.gender==2) * f(2,1) * f(2,2)]./sum(p.gender==1)]);
a2 = subplot(2,2,2); title('bar plot with errorbars');
p2 = errorbar([bar(f)], sterr)
% gender_header=find(strcmp(headers,'gender'));
% pc_header=find(strcmp(headers,'computer'));
% 
% female_ind=find(strcmp(data(:, gender_header), 'Female'));
% male_ind=find(strcmp(data(:, gender_header), 'Male'));
% gender=NaN(size(data,1), 1);
% gender(female_ind)=1; % set Females to 1
% gender(male_ind)=2; % set Females to 1
% 
% n_women=length(female_ind);
% n_men=length(male_ind);
% 
% computer=NaN(size(data,1), 1);
% pc_ind=find(strcmp(data(:, pc_header), 'PC'));
% computer(pc_ind)=1;
% apple_ind=find(strcmp(data(:, pc_header), 'Apple'));
% computer(apple_ind)=2;
% 
% women_computer=computer(female_ind);
% women_pc=length(find(women_computer==1))./n_women;
% women_apple=length(find(women_computer==2))./n_women;
% men_computer=computer(male_ind);
% men_pc=length(find(men_computer==1))./n_men;
% men_apple=length(find(men_computer==2))./n_men;
% 
% % plot stuff
% f=figure(1);
% set(f, 'Name','computer by gender');

% bar graph
 % axis!
% set(a1, 'FontName', 'Geneva');
% t=title('simple bar', 'FontAngle', 'italic');
% p1=bar([women_pc women_apple men_pc men_apple]);
% set(p1, 'FaceColor', [1 .5 .5])
% labels={'women apple' '' 'men pc' 'men apple'};
% set(gca,'XTick', [1:4]);
% set(gca,'XTickLabel', {'Apple', 'PC'});
% legend
% 
% for binary options the absolute std err is sqrt(npq) where n is the number of
% trials, p is the probability of option a and q is the probability of
% option b
% because we are plotting data after dividing by the number of women and
% the number of men, we need to do that to the stderr as well
% sterr=sqrt([[sum(p.gender==1) * f(1,1) * f(2,1)]./sum(p.gender==1) ...
%            [sum(p.gender==1) * f(1,1) * f(2,1)]./sum(p.gender==1) ; ...
%            [sum(p.gender==2) * f(2,1) * f(2,2)]./sum(p.gender==1) ...
%            [sum(p.gender==2) * f(2,1) * f(2,2)]./sum(p.gender==1)]);
% 


% ================================%
% QUESTION 1. Add a stacked bar plot in this subplot. 
% use >doc bar for help or try this code as an example

a3=subplot(2,2,3)
bar(f,'stacked')

% ================================% 


%% do computers rot your brain

figure(2);
set(gcf,'Name', 'Do computers rot your brain?');
subplot(1,3,1)
plot(p.friends, p.Exam1,'ko')
xlabel('Facebook friends')
ylabel('grade')

% ================================% 
% QUESTION 2.add a subplot that is the same as the one above but
% replaces facebook friends with the number of gaming hours

subplot(1,3,2)
plot(p.games_hours, p.Exam1,'ko')
xlabel('Gaming hours')
ylabel('grade')

% ================================% 
% ================================% 
% QUESTION 3.add a subplot that is the same as the one above but
% plots  the number of gaming hours on the x-axis, and the number of hours
% of sleep on the y-axis
subplot(1,3,3)
plot(p.games_hours, p.sleep,'ko')
xlabel('Gaming hours')
ylabel('Hours of sleep')
% ================================% 
% ================================% 
% QUESTION 4. In figure 3. use plot3d to do a 3d plot comparing sleep, gaming and
% facebookfriends
figure(3);
subplot(1,2,1);
plot3d(p.sleep, p.games_hours, p.friends, 'ko')

% ================================% 
% ================================% 
% QUESTION 5. Choose anything to plot and plot it
% ================================% 

% Handedness and grades
subplot(1,2,2);
plot(p.hand, p.Exam1, 'ko')
xlabel('Handedness')
ylabel('grade')


