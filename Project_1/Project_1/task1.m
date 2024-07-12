clear;clc;
load('Gaussian1D.mat');

mean1=mean(s1); mean2=mean(s2); mean3=mean(s3); %mean
var1=var(s1,1); var2=var(s2,1); var3=var(s3,1); %variance
x=-3.664:0.1:6;
y=normcdf(x,0.5,2); %Generating according to N(0.5,2)

s1u=unique(s1); s2u=unique(s2); s3u=unique(s3); % Returns the same value as s1, but without duplicate elements. 
                                                % The results are sorted in ascending order.
frequency1 = tabulate(s1u); frequency2 = tabulate(s2u); frequency3 = tabulate(s3u);
cumpr1 = cumsum(frequency1(:,2)) / length(s1u);
cumpr2 = cumsum(frequency2(:,2)) / length(s2u);
cumpr3 = cumsum(frequency3(:,2)) / length(s3u);

stairs(s2u,cumpr2);
%stairs(s2u,cumpr2);
%stairs(s3u,cumpr3);
hold on;
plot(x,y);
grid on;

%cdfplot(s2);

