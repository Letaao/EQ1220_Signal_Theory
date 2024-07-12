a=[5,6,7,8,9,10,11,12,13,14,15];
b=[0.1693,0.2411,0.2392,0.2429,0.1451,0.1651,0.1716,0.1666,0.2412,0.2122,0.2808];
plot(a,b,'o-','markerfacecolor','b')
xlim([5,15])
title('The influence of L on MSE')
xlabel('L')
ylabel('MSE')
grid on