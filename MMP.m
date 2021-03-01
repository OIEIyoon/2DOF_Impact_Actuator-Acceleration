z = z;
% z = x{data+index}
hold on;

exp_n = 6;
rep_n = 11;
exp_p = [1.392, 20.99, 38, 55.73, 70.67, 91.47];
step_gap = 2000;
rep_step_gap = 10000;
exp_p_step = exp_p.*10000;
peak_val = zeros(2, rep_n, exp_n); 
peak_t = zeros(2, rep_n, exp_n);
for  exp_index = 1:exp_n
    left_point = exp_p_step(exp_index) - step_gap;
    for rep_index = 1:rep_n
        interval_L = left_point + rep_step_gap * (rep_index - 1);
        interval_U = interval_L + 2 * step_gap;
        [peak_val(:, rep_index, exp_index), peak_t(:, rep_index, exp_index)] = max(z(:, interval_L:interval_U), [] , 2);
        peak_t(:, rep_index, exp_index) =  (peak_t(:, rep_index, exp_index) + interval_L)/10000;
    end
    mean_val(:,exp_index) = mean(peak_val(:,:,exp_index),2); hold all;
    plot(peak_t(1,:,exp_index), peak_val(1,:,exp_index));
    plot(peak_t(2,:,exp_index), peak_val(2,:,exp_index));
    plot(peak_t(1,:,exp_index), mean_val(1,exp_index)*ones(1,rep_n), 'linewidth', 2);
    plot(peak_t(2,:,exp_index), mean_val(2,exp_index)*ones(1,rep_n), 'linewidth', 2);
    mean_str = num2str(mean_val(:,exp_index));
    text(peak_t(:,6,exp_index), mean_val(:,exp_index) + 1, mean_str, 'FontName', 'Times New Roman', 'FontSize', 13);
end

% legend([a_long_plot, a_lat_plot], {'a_{long}', 'a_{lat}'});

% figure(2);
% plot([0 3:7], mean_val(1,:)./mean_val(2,:), '-o');

% exp_start_point = exp_p_step - step_gap;
% for exp_index = 1:exp_n
%     interval_L = exp_start_point(exp_index);
%     interval_R = interval_L + rep_step_gap * 11;
%     [peak_val, peak_t] = maxk( z(:, interval_L:interval_R), 11, 2 );
%     hold on;
%     plot((interval_L + peak_t(1, :))/10000, peak_val(1, :), 'o'); plot((interval_L + peak_t(2, :))/10000, peak_val(2, :), 'o');
% end