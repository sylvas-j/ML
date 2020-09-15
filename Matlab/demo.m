f =1000;
fs = 8000;
t = 0:1/fs:1;
x = sin(2*pi*f*t);
plot(t,x);
grid on;
axis([0 6e-3 -1.2 1.2]);
sound(x,fs);

%% just ending that section
f =2000;
fs = 1500;
t = 0:1/fs:1;
x = sin(2*pi*f*t);
plot(t,x);
grid on;
axis([0 6e-3 -1.2 1.2]);
sound(x,fs);

%%
% IIR butterworth band pass and band stop filter design
fs=1000;
kp = 3;
ks = 60;
fp1 = 200;
fp2 = 300;
fs1 = 100;
fs2 = 400;
wp1 = fp1/(fs/2);
wp2 = fp2/(fs/2);
ws1 =  fs1/(fs/2);
ws2 =  fs2/(fs/2);
[N, wc] = buttord([wp1 wp2], [ws1 ws2], kp, ks);
u=[0:.2:4];
v=[0:.4:8];
[x, y] = butter(N, wc, 'bandpass');

freqz(x,y,1000, fs);
%%
% to design FIR filters (band pass /band stop)

N = 30;
fs = 8000;
fc1 = 2000;
fc2 = 3000;

wc1 = fc1/(fs/2);
wc2 = fc2/(fs/2);
h = fir1(N, [wc1, wc2], 'bandpass', hamming(N+1));
freqz(h, 1, 1000, fs);

%%
% how to read value from command line

a = input('Enter a number x(t):');


%%



