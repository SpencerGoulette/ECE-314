%% Problem 2, part c
k = 10; %DC gain
w = 2 * pi * 10^6;  %Wn
e = .3; % Epsilon
pw = 1e-9; % Rectangular input pulse width (seconds)
a = k*(w)^2;    % Gain values
b = 2*e*w;
c = w^2;
amp = a * 10^9; % Amplitude with a
per = 1;    % Period
offset = -.5*pw; % Offset

%matlab "publish" include the simulation
open_system('ECE314HW5_2c');

%Simulate
simout = sim('ECE314HW5_2c',...
             'StartTime', '-1e-7',...
             'StopTime', '1e-5',...
             'MaxStep', '0.01e-9');
yout = get(simout,'yout');  % Get the input time-series structure
t = yout.Time;
x = yout.Data;

t2 = linspace(0, 10e-6, 51);
h = (k*w/sqrt(1-e^2)).*exp(-e.*w.*t2).*sin(w.*sqrt(1-e^2).*t2); % h(t)

figure(1); clf;
plot(t,x);  % Plots simulation
hold on;
plot(t2,h,'o'); % Plots theoretical
xlim([-.1e-6 10e-6])    % X axis range
xlabel('Time (sec)');   % Labels
ylabel('Impulse Response (Volts)');
title('Problem 2, part c');
grid on;

%% Problem 2, part d

figure(2); clf;
i = 0;
while i < 3 % Iterates through all wanted values of Epsilon
    k = 10; %DC gain
    w = 2 * pi * 10^6;  %Wn
    e = 0.2+i*0.3; % Epsilon
    pw = 2e-6;   % Rectangular input pulse width (seconds)
    a = k*(w)^2;    % Gain values
    b = 2*e*w;
    c = w^2;
    amp = a;    % Amplitude with a
    per = 5e-6; % Period
    offset = 1e-6;  % Offset
    
    %Simulate
    simout = sim('ECE314HW5_2c',...
                 'StartTime', '0',...
                 'StopTime', '1e-5',...
                 'MaxStep', '1e-9');
    yout = get(simout,'yout');  % Get the input time-series structure
    t = yout.Time;
    x = yout.Data;

    plot(t,x);  % Plots
    hold on;
    i = i + 1;  % Increments
end

xlim([0 10e-6]) % X axis range
xlabel('Time (sec)');   % Labels
ylabel('System Output (Volts)');
title('Problem 2, part d');
legend('E = 0.2','E = 0.5','E = 0.8')
grid on;

%% Problem 3, part b

figure(3); clf;
k = 10; %DC gain
w = 2 * pi * 10^6;  %Wn
e = 2;  % Epsilon
pw = 2e-6; % Rectangular input pulse width (seconds)
a = k*(w)^2;    % Gain values
b = 2*e*w;
c = w^2;
amp = a;    % Amplitude with a
per = 5e-6; % Period
offset = 1e-6;  %Offset

%Simulate
simout = sim('ECE314HW5_2c',...
             'StartTime', '0',...
             'StopTime', '1e-5',...
             'MaxStep', '1e-9');
yout = get(simout,'yout'); % Get the input time-series structure
t = yout.Time;
x = yout.Data;

plot(t,x);  % Plots
xlim([0 1e-5])  % X axis range
xlabel('Time (sec)'); % Labels
ylabel('System Output (Volts)');
title('Problem 3, part b');
grid on;
