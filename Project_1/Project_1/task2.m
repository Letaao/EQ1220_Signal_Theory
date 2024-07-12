clear;clc;
load('Gaussian2D.mat');

% s1对应相关系数0.25，s2对应相关系数0.75，重算

mean1=mean(s1,1); mean2=mean(s2,1);
var1=var(s1,1); var2=var(s2,1);
Dx=var1(1,1);%方差
Dy=var1(1,2);%方差
mx=mean1(1,1);
my=mean1(1,2);
mplus=mx+my;mminus=mx-my;
Dplus=Dx+Dy;Dminus=Dx+Dy;
r1=0.75;r2=0.25;
x=-10:0.05:10;
y=-10:0.05:10;
plus=s1(:,1)+s1(:,2);
plus=plus.';plus=sort(plus);
minus=s1(:,1)-s1(:,2);
minus=minus.';minus=sort(minus);
% x=s1(:,1);
% y=s1(:,2);
[X,Y]=meshgrid(x,y);
p1=(1/(2*pi*Dx*Dy*sqrt(1-r1^2)))*exp((-1/(2*(1-r1^2)))*((X-mx).^2/Dx^2)-(2*r1*(X-mx).*(Y-my)/(Dx*Dy)+(Y-my).^2/Dy^2));%相关系数不同
p2=(1/(2*pi*Dx*Dy*sqrt(1-r2^2)))*exp((-1/(2*(1-r2^2)))*((X-mx).^2/Dx^2)-(2*r2*(X-mx).*(Y-my)/(Dx*Dy)+(Y-my).^2/Dy^2));
% py=(1/(sqrt(2*pi)*Dy))*exp(-1*(y-my)^2/(2*Dy^2));
% ptj=p1/py;
pplus=normpdf(plus,mplus,sqrt(Dplus));
pminus=normpdf(minus,mminus,sqrt(Dminus));

figure(1)
mesh(X,Y,p1)
% view(0,0)
title('随机变量X、Y的联合概率密度')
xlabel('X')
ylabel('Y')
zlabel('联合概率密度')
figure(2)
mesh(X,Y,p2)
title('随机变量X、Y的联合概率密度')
xlabel('X')
ylabel('Y')
zlabel('联合概率密度')
figure(3)
plot(plus,pplus);
grid on;
figure(4)
plot(minus,pminus);
grid on;

