for data_index = 1:data_num
    t = linspace(0, length(x{data_index})/10000, length(x{data_index}));
    a_long_plot = plot(t, x{data_index}(1,:), '-', 'linewidth', 1); hold on;
    a_lat_plot = plot(t, x{data_index}(2,:), '-', 'linewidth', 1); hold on;
%     new_name = erase(lists(data_index+2).name, ".txt");
end

xlim([0 t(end)]); grid on;
ylim([-15 15]);

xlabel('Time [sec]','FontSize',15,'FontWeight','bold','FontName','Times New Roman'); 
ylabel('Acceleration [g = 9.8 m/s^{2}]','FontSize',15,'FontWeight','bold','FontName','Times New Roman'); 
