t = linspace(0, length(x{data_index})/10000, length(x{data_index}));

fig6 = figure(6);
set(fig6, 'OuterPosition', [0 30 1700 950]); 
y = smoothdata(x{1}(1,:),'gaussian');
plot(t, y, '-', 'linewidth', 1); hold on;
z = smoothdata(y,'gaussian');
plot(t, z, 'r-', 'linewidth', 2); hold on;
% w = smoothdata(z,'gaussian');
% plot(t, w, 'ko-', 'linewidth', 2); hold on;
plot(t, x{1}(1,:));
% axis([70.6700, 70.6800, -10, 12]);