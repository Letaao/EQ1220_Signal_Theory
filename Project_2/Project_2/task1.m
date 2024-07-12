clc;clear;
load('training1.mat'); %前32个b(k),即最终结果
load('spydata1.mat');
% image(cPic)
L=10;
b_pilot=training(L+1:32);
errornumber=700;
b_pre=training(1:L);

r=received;  %前32个r(k)
R=zeros(32-L,L+1);
for i=1:32-L
    for j=1:L+1
        R(i,j)=r(L+1+i-j);
    end
end
% C=R'*R;
% c=mean(C);
% D=R'*b_pilot;
% d=mean(D);
% Ry=xcorr(R,'biased');
% Ry=Ry(1:32-L,1:32-L);
% rxy=xcorr(b_pilot,R(:));
% rxy=rxy(1:32-L,:);
% w=Ry\rxy;
% % w=Ry.'.*rxy;
w=mldivide(R'*R,R'*b_pilot); %拟合

rq=r(L+1:32,:);
bk2=conv(rq,w);
bk2=bk2(1:length(rq), :);
% bk2=sign(bk2);
% different_count = sum(b_pre ~= bk2);
mse=mse(b_pilot,bk2);

bk1=conv(received,w);
bk=sign(bk1);
bk=bk(1:length(received), :);

errorlocation=randperm(length(bk), errornumber);
bk(errorlocation) = -bk(errorlocation);

dPic = decoder(bk,cPic);

% subplot(1,2,1)
% image(cPic)
% subplot(1,2,2)
image(dPic)
axis square
% title('L=12')
title('Number of errors=700')

