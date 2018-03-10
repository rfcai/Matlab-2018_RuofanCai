clear all
%% Background:
% This experiment examines subjects performance in a four-syllable word repetition task. 
% The excel sheet contains the errors types for each syllable of every word produced by 
% the subjects, i.e. patients with speech disorders. And I will plot the
% speech error types by syllable as well as another plot that compares the
% different error type occurences in different syllable positions. 

%%
[num,txt,raw] = xlsread('syllable_error.xlsx');
% error types "errTypes" have the following categories: correct, syllable
% deletion, vowel deletion, consonant deletion, syllable addition, vowel
% addition, consonant addition, syllable substitution, vowel substitution,
% and consonant substitution. 
errTypes = {'correct','sdel','vdel','cdel','sadd','vadd','cadd','ssub','vsub','csub'};

syls = {'1','2','3','4'};%syllable position

%%

dat = txt(2:end,2:end);

subjs = unique(txt(2:end,1));

for i = 1:size(dat,2) %four syllables
    for j = 1:length(errTypes)
        %how many of each error type (starting from 'correct' to 'csub')
        %are in each column, i.e. syllable position? *learned cellfun,
        %regexpi recently!
        errs.raw(i,j) = length(find(~cellfun(@isempty,regexpi(dat(:,i),errTypes{j},'match'))));
        for k = 1:length(subjs) %for all the subjects
            errs.sub(i,j,k) = length(find(~cellfun(@isempty,regexpi(dat(:,i),errTypes{j},'match')) & strcmpi(subjs{k},txt(2:end,1))));
        end
    end
    errs.pct(i,:) = errs.raw(i,:)/sum(errs.raw(i,:));
    for k = 1:length(subjs)
        errs.subpct(i,:,k) = errs.sub(i,:,k) / sum(errs.sub(i,:,k));
    end
end


figure(1);
a1=subplot(2,1,1); 
bar(nanmean(errs.subpct,3));
xlabel('Syllable Position');
ylabel('Percent Responses');
legend(errTypes);

a2=subplot(2,1,2); 
bar(nanmean(errs.subpct,3)');
xlabel('Error Type');
ylabel('Percent Responses');
set(gca,'XTickLabel',errTypes);
legend({'Syllable 1','Syllable 2','Syllable 3','Syllable 4'});


