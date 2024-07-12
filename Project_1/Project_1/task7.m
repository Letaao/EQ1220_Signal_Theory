k=linspace(-5,5,1000);
r=1.138.*((0.25).^abs(k)).*(abs(k)+1.133);
plot(k,r)
title('rx2(k), the acf of x2(n)')
grid on