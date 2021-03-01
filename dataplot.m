
%% Path / Dir
clear all; clc; close all;
cd = 'C:\Users\oiei0\OneDrive\기계시스템설계\2학기 + 연구자료\MATLAB\acc_NI';
data_path = [cd, '\NI max_test (2ch)\Debug'];
% data_path = [cd, '\NI max_test\Debug'];
lists = dir(data_path);
disp('Path Defined');
% legend_name = [];
data_num = length(lists) - 5;
for data_index = 1:data_num
    file_name = strcat(data_path, '\', lists(data_index+2).name);
    raw_data{data_index + 2, 1} = load(file_name);
    x_temp{data_index} = (raw_data{data_index+2}');
    data_length{data_index} = length(x_temp{data_index}(1,:));
    n_ch = length(x_temp{data_index}(:,1));
    for ch = 1:n_ch
        x{data_index}(ch, :) = ((x_temp{data_index}(ch, :) - mean(x_temp{data_index}(ch, 1:2000)))./0.057 ) * (-1)^ch;
    end
end
disp('Data Loaded');

%% Ax Ay
simple_ax_ay

%% FFT
% FFT_test

%% LPF + HPF
% simple_HPF_LPF

%% interp1
% interp_HPF_LPF

%% Mean Maximum Point
% MMP

%% Smoothing 
SMT
disp('Smoothing Script');