%Assignment 2 Lydia and Alina
%Analysis
%Find the features to determine the avoidance
%Build the algorithm to explain this data
%%
%load the data
%data_h2o = importdata("JB_JAABA2/o_five_H2O_0s1x900s0s#n#n#n@40/data.mat");
data_EA5 = importdata("JB_JAABA2/o_five_10n5EA_0s1x900s0s#n#n#n@40/data.mat");
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

mat1 = [plot_head' turn_freq turn_freq_sem];
writematrix(mat1, 'head_turn_freq.csv')

%% Turn direction vs Turning Frequency

x = []; % vector to contain positions
y = []; % vector to contain run times

for i = 1:length(data_GA1.AN)
    x = [x; data_GA1.r0x{i, 1}];
    y = [y; data_GA1.run_et{i, 1}];
end

Pos = 0:10:200;
plot_pos = 5:10:195;
turn_freq = zeros(length(Pos)-1,1);
turn_freq_sem = zeros(length(Pos)-1,1);

for i = 1:length(Pos)-1
    if i ~= length(Pos)-1
        I = find(x>=Pos(i) & x<Pos(i+1));
        turn_freq(i) = 60./mean(y(I));
        err = std(y(I))./sqrt(length(I));
        turn_freq_sem(i) = (60*err)/(mean(y(I)).^2);
    else
        I = find(x>=Pos(i) & x<=Pos(i+1));
        turn_freq(i) = 60./mean(y(I));
        err = std(y(I))./sqrt(length(I));
        turn_freq_sem(i) = (60*err)/(mean(y(I)).^2);
    end
end

mat2 = [plot_pos' turn_freq turn_freq_sem];
writematrix(mat2, 'pos_turn_freq.csv')

%% Head direction vs Turning direction

x = []; % vector to contain pre heading
y= []; % vector to contain abs heading change

for i = 1:length(data_GA1.AN)
    x = [x; data_GA1.pre_deg{i, 1}];
    y = [y; data_GA1.reorient_deg_abs{i,1}];
end

Headings = -180:5:180;
plot_head = -177.5:5:177.5;
head_change = zeros(length(Headings)-1,1);
head_change_sem = zeros(length(Headings)-1,1);

for i = 1:length(Headings)-1
    if i ~= length(Headings)-1
        I = find(x>=Headings(i) & x<Headings(i+1));
        head_change(i) = mean(y(I));
        head_change_sem(i) = std(y(I))./sqrt(length(I));
    else
        I = find(x>=Headings(i) & x<Headings(i+1));
        head_change(i) = mean(y(I));
        head_change_sem(i) = std(y(I))./sqrt(length(I));
    end
end

mat3 = [plot_head' head_change head_change_sem];
writematrix(mat3, 'head_change.csv')
