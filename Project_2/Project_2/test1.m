clc;clear;
load('training1.mat'); %前32个b(k),即最终结果
load('spydata1.mat');
% pic = imread('kth.jpg');
% [key,cPic] = encoder(pic);
% dPic = decoder(key,cPic);
% % image(dPic)
% % axis square
% 
% % h=zeros(2*length(key)-1,1);
% h(1)=1;h(2)=0.7;h(3)=0.7;h(4)=0;
% % key(2*length(key)-1,1)=0;
% %h=[1;0.7;0.7];
% r=conv(key,h);
% r=r(1:length(key), :);

r=received(1:32, :);
ch=mldivide(training,r);





