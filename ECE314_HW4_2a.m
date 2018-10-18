clear variables 

k = 10;
e = 0.1;
w = 2*pi*10^6;
s = linspace(0, 200000*20, 20);
H = 20*log10(k./abs(((s.*1i).^2./w^2+2.*e.*s.*1i./w+1)));
stem(H)
grid on; % add grid
set(gca, 'fontsize', 16); % increase font size
xlabel('t (µsec)', 'fontsize', 16); % x label
ylabel('x_{N}(t)', 'fontsize', 16); % y label
title('Problem 1, part c, N = 3'); % title