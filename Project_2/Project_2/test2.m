clc;clear;
load('training1.mat'); %前32个b(k),即最终结果
load('spydata1.mat');
mu=0.01;
L=4;
w=zeros(1,L+1);

mse_history=[];

for k=L+1:length(received)
    x=received(k:-1:k-L);
    y=w.*x';
    error=training(k)-y;
    w=w+mu*error*x;
    mse=mean((training(1:k)-w.*received(k:-1:k-L)').^2);
    mse_history=[mse_history,mse];
end

