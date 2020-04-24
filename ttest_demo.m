clc
clear
close all

% t-test / t-test2 results:
% The result h = 0 means that we cannot reject the null hypothesis ("means are equal").
% h = 1 indicates that the null hypothesis can be rejected at the alpha level.
%
% The significance level (p-value) means that by chance we would have
% observed values of T more extreme than the one in this example in
% p_value*100 of 100 similar experiments.
%
% A 100*(1-p_value) confidence interval on the mean is ci, which includes
% the theoretical (and hypothesized) mean. ci is a 1-alpha confidence
% interval for the true mean.


%%  ttest:  Hypothesis testing for a single sample mean.

dist1_MU = 0;                 % mean of sample distribution
dist1_SIGMA = 1;              % standard deviation of sample distribution
dist1_Dimention = [1000, 1];  % dimention of sample distribution

sample_dist1 = normrnd(dist1_MU, dist1_SIGMA, dist1_Dimention);

mu1 = mean(sample_dist1);     % calculate mean of genetated sample distribution
std1 = std(sample_dist1);     % calculate standard deviation of genetated sample distribution

figure(1);
nbins = 100;
histfit(sample_dist1,nbins,'normal');

mean_to_examin = 0;
[h, p_value, ci] = ttest(sample_dist1, mean_to_examin, 'alpha', 0.05)


%% ttest2:  Hypothesis testing for difference in means of two samples.

dist1_MU = 0;                 % mean of sample distribution
dist1_SIGMA = 1;              % standard deviation of sample distribution
dist1_Dimention = [100, 1];   % dimention of sample distribution

dist2_MU = 2.5;               % mean of sample distribution
dist2_SIGMA = 1;              % standard deviation of sample distribution
dist2_Dimention = [100, 1];   % dimention of sample distribution

sample_dist1 = normrnd(dist1_MU, dist1_SIGMA, dist1_Dimention);
sample_dist2 = normrnd(dist2_MU, dist2_SIGMA, dist2_Dimention);

figure(2);
hold on;
plot(ones(size(sample_dist1)),sample_dist1,'*r');
plot(1,dist1_MU,'*k','MarkerSize',10,'LineWidth',2);
plot(2*ones(size(sample_dist2)),sample_dist2,'*b');
plot(2,dist2_MU,'*k','MarkerSize',10,'LineWidth',2);
xlim([0,3]);

[h, p_value, ci] = ttest2(sample_dist1, sample_dist2, 'alpha', 0.05)


%%  ttest:  Hypothesis testing for a paired two matched samples, come from distributions with equal means

dist1_MU = 0;                 % mean of sample distribution
dist1_SIGMA = 1;              % standard deviation of sample distribution
dist1_Dimention = [100, 1];   % dimention of sample distribution

sample_dist1 = normrnd(dist1_MU, dist1_SIGMA, dist1_Dimention);
sample_dist2 = 3+sample_dist1;

[h, p_value, ci] = ttest(sample_dist1, sample_dist2, 'alpha', 0.05)


%[r,p] = corrcoef(samples1',samples2');
