Fs = 10000;
%HPF
ts = 1/Fs; % 100us = 0.1ms
fc2 = 300;
tau2 = 1 / (2*pi*fc2);
alpha2 = tau2 / (ts + tau2);
for data_index = 1:data_num
    y_HPF{data_index}(:, 1) = zeros(n_ch, 1);
    for n = 2:data_length{data_index}
        y_HPF{data_index}(:, n) = alpha2 * y_HPF{data_index}(:, n-1) + alpha2 * (x{data_index}(:, n) - x{data_index}(:, n-1));
    end
end

%LPF
ts = 1/Fs; % 100us = 0.1ms
fc1 = 600;
tau1 = 1 / (2*pi*fc1);
alpha1 = tau1 / (ts + tau1);
for data_index = 1:data_num
    y_LPF{data_index}(:, 1) = zeros(n_ch, 1);
    for n = 2:data_length{data_index}
        y_LPF{data_index}(:, n) = alpha1 * y_LPF{data_index}(:, n-1) + (1-alpha1) * y_HPF{data_index}(:, n);
    end
end
%%
% fig3 = figure(3);
% set(fig3, 'OuterPosition', [0 30 1700 950]); 
% plot(t, x{data_index}(1, :), 'b'); hold on;
% plot(t, smoothdata(x{data_index}(1, :)), 'm'); hold on;
% plot(t, smoothdata(y_HPF{data_index}(1, :)), 'k', 'linewidth', 2); hold on;
% plot(t, smoothdata(y_LPF{data_index}(1, :)), 'r', 'linewidth', 2); grid on;
%%
% fig3 = figure(3);
% set(fig3, 'OuterPosition', [0 30 1700 950]); 
% for ch = 1:n_ch
%     subplot(2, 1, ch);
%     if (ch == 1) str_ch = 'y';
%     else str_ch = 'x';
%     end
%     
%     plot(t, x{data_index}(ch, :), 'b'); hold on;
%     
%     plot(t, y_HPF{data_index}(ch, :), 'k'); hold on;
%     plot(t, y_LPF{data_index}(ch, :), 'r', 'linewidth', 2); grid on;
%     title(['a_{', str_ch, '}   Raw Data vs LPF'], 'FontSize', 25,'FontWeight','bold','FontName','Times New Roman');
%     xlabel('Time [sec]','FontSize',15,'FontWeight','bold','FontName','Times New Roman'); 
%     ylabel('Acceleration [g = 9.8 m/s^{2}]','FontSize',15,'FontWeight','bold','FontName','Times New Roman'); 
%     legend('Raw Data', 'HPF', 'HPF + LPF', 'FontSize', 13,'FontWeight','bold','FontName','Times New Roman'); 
%     xlim([0 t(end)]); grid on;
%     ylim([-15 15]);
% end

