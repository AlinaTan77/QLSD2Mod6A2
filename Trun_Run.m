%Assignment 2 Lydia and Alina
%Analysis
%Find the features to determine the avoidance
%Build the algorithm to explain this data
%%
%load the data
%data_h2o = importdata("JB_JAABA2/o_five_H2O_0s1x900s0s#n#n#n@40/data.mat");
%data_EA5 = importdata("JB_JAABA2/o_five_10n5EA_0s1x900s0s#n#n#n@40/data.mat");
data_GA1 = importdata("JB_JAABA1/o_five_10n1GA_0s1x900s0s#n#n#n@40/data.mat");


%% Head direction vs Turning Frequency

x = []; % vector to contain headings
y = []; % vector to contain run times

for i = 1:length(data_GA1.AN)
    x = [x; data_GA1.run_deg{i, 1}];
    y = [y; data_GA1.run_et{i, 1}];
end

Headings = -180:10:180;
plot_head = -175:10:175;
turn_freq = zeros(length(Headings)-1,1);
turn_freq_sem = zeros(length(Headings)-1,1);

for i = 1:length(Headings)-1
    if i ~= length(Headings)-1
        I = find(x>=Headings(i) & x<Headings(i+1));
        turn_freq(i) = 60./mean(y(I));
        err = std(y(I))./sqrt(length(I));
        turn_freq_sem(i) = (60*err)/(mean(y(I)).^2);
    else
        I = find(x>=Headings(i) & x<=Headings(i+1));
        turn_freq(i) = 60./mean(y(I));
        err = std(y(I))./sqrt(length(I));
        turn_freq_sem(i) = (60*err)/(mean(y(I)).^2);
    end
end

mat = [plot_head' turn_freq turn_freq_sem];
