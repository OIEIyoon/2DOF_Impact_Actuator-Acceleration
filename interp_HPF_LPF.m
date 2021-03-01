tq = 0:1.0000e-05:t(end); tq(end) = [];
xq = {};
for data_index = 1:data_num
    for ch = 1:n_ch
        xq{data_index}(ch, :) = interp1(t, x{data_index}(ch, :), tq, 'spline');
    end
end

Fs2 = 100000;
%HPF
ts2 = 1/Fs2; % 100us = 0.1ms
fc2 = 200;
tau2 = 1 / (2*pi*fc2);
alpha2 = tau2 / (ts2 + tau2);
for data_index = 1:data_num
    yq_HPF{data_index}(:, 1) = zeros(n_ch, 1);
    for n = 2:length(xq{data_index}(1,:))
        yq_HPF{data_index}(:, n) = alpha2 * yq_HPF{data_index}(:, n-1) + alpha2 * (xq{data_index}(:, n) - xq{data_index}(:, n-1));
    end
end

% LPF
ts2 = 1/Fs2; % 100us = 0.1ms
fc1 = 700;
tau1 = 1 / (2*pi*fc1);
alpha1 = tau1 / (ts2 + tau1);
for data_index = 1:data_num
    yq_LPF{data_index}(:, 1) = zeros(n_ch, 1);
    for n = 2:length(xq{data_index}(1,:))
        yq_LPF{data_index}(:, n) = alpha1 * yq_LPF{data_index}(:, n-1) + (1-alpha1) * yq_HPF{data_index}(:, n);
    end
end



figure(5);
for ch = 1:n_ch
    subplot(2, 1, ch);
    if (ch == 1) str_ch = 'y';
    else str_ch = 'x';
    end
    
    plot(tq, xq{data_index}(ch, :),'o-'); hold on;
    plot(tq, yq_LPF{data_index}(ch, :),'o-', 'linewidth' ,2); grid on;
    
    title(['a_{', str_ch, '}   Raw Data vs LPF'], 'FontSize', 20,'FontWeight','bold','FontName','Times New Roman');
    xlabel('Time [sec]','FontSize',15,'FontWeight','bold','FontName','Times New Roman'); 
    ylabel('Acceleration [g = 9.8 m/s^{2}]','FontSize',15,'FontWeight','bold','FontName','Times New Roman'); 
    legend('Interp Raw Data', 'Interp BPF', 'FontSize', 13,'FontWeight','bold','FontName','Times New Roman'); 
    xlim([0 t(end)]);
    ylim([-10 10]);
end