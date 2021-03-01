Fs = 10000;
%% total_fft
fft_y_tot = fft(x{1}(1, :));
L_tot = length(x{1});
P2 = abs(fft_y_tot/L_tot);
P1 = P2(1:L_tot/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f1 = Fs*(0:(L_tot/2))/L_tot;
figure(2);


%% peak_fft
fft_y_peak = fft(x{1}(51000:52000-1));
L_peak = length(x{1}(51000:52000-1));
P4 = abs(fft_y_peak/L_peak);
P3 = P4(1:L_peak/2+1);
f3 = Fs*(0:(L_peak/2))/L_peak;

%%
plot(f1,P1); hold on;
plot(f3,P3);
for i = 0:length(f3)-1
    P5(i+1) = P1(1+202*i);
end
P_diff = P3 - P5;
title('Single-Sided Amplitude Spectrum of x(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')