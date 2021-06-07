clc
close all

%sampling frequency = 1MHz
fs = 1000000;

%sample period
Ts = 1/fs;

%creating an array to hold the times of samples from 0 to 0.0001 seconds
t  = 0:1/fs:(10e-4);

%this signal, is the signal that is desired
sig = sin(2*pi*5000*t);

%creating noise to add to the original signal
sig3 = sin(2*pi*100000*t);
noise = 0.1 * randn(size(sig));

%adding noise to the original signal
sigNoisy = sig + noise + sig3;
sigNoisy = sigNoisy';

%converting the noisy signal array to a timetable with sample rate fs
sigNoisy_table = array2timetable(sigNoisy,"SampleRate",fs);

%graphing noisy signal in frequency domain
[p,f] = pspectrum(sigNoisy_table);
%semilogx(f,db(p,"power"))

%lowpass filtering the noisy signal to recover the 5000Hz signal and
%storing the digital filter in the 'd' variable
[lowSIG, d] = lowpass(sigNoisy_table(:,"sigNoisy"),9000,"Steepness",.8,...
"ImpulseResponse", "fir");

%analysis of filter performance
sigNoisy_table.FiltSig = lowSIG.sigNoisy;
%figure()
%stackedplot(sigNoisy_table)
%figure()
[p,f] = pspectrum(sigNoisy_table.FiltSig);
%semilogx(f,db(p,"power"))
%fvtool(d)

%floating point difference equation implementation of lowpass digital
%filter 'd'
lopass_fir_coefficients = d.Coefficients;
z = zeros(40,1);
x = sigNoisy';
y = zeros(size(x));

%for analysis of dynamic range of input, output, and states to decide fixed
%point bitwidths
%hscope1 = NumericTypeScope;
%hscope2 = NumericTypeScope;
%hscope3 = NumericTypeScope;

%floating point difference equation
for k = 1:length(x)
    y(k) = lopass_fir_coefficients(1)*x(k) + z(1);
    for index = 1:(length(z)-1)
        z(index) = lopass_fir_coefficients(index+1) * x(k) + z(index+1);
    end
    z(40) = lopass_fir_coefficients(41) * x(k);
    %step(hscope1,z);
end
ydouble = y;
%step(hscope2,y);
%step(hscope3,x);

%fixed point difference equation implementation
lopass_fir_coefficients = fi(lopass_fir_coefficients,1,17,14);
z = fi(zeros(40,1),1,17,14);
x = fi(sigNoisy',1,17,14);
y = fi(zeros(size(x)),1,17,14);

for k = 1:length(x)
    y(k) = lopass_fir_coefficients(1)*x(k) + z(1);
    for index = 1:(length(z)-1)
        z(index) = lopass_fir_coefficients(index+1) * x(k) + z(index+1);
    end
    z(40) = lopass_fir_coefficients(41) * x(k);
end

%comparison of floating point and fixed point implementations
plot(t,ydouble)
title("Floating point implementation")
figure()
plot(t,y)
title("Fixed point implementation")

%storing signal input 'x' to a file to be used as input for HDL simulation
h = fopen('hdl_ref_x.txt', 'w');
for k = 1:length(x)
    fprintf(h, '%s\n', hex(x(k)));
end
fclose(h);

%storing ouptut 'y' to a file to be used as reference for HDL simulation
h = fopen('hdl_ref_y.txt', 'w');
for k = 1:length(y)
    fprintf(h, '%s\n', hex(y(k)));
end
fclose(h);

%storing fixed point filter coefficients
h = fopen('hdl_ref_coefficients.txt', 'w');
for k = 1:length(lopass_fir_coefficients)
    fprintf(h, '%s\n', hex(lopass_fir_coefficients(k)));
end
fclose(h);