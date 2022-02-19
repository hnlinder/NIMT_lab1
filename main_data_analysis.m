cal_const = 443.6601;


close all 
clear
% freq = zeros(11,1);
count = 1;
startsec = 1.4;
nrsecs = 4;
for i = [2,7:8]
    data = load(sprintf("DanHendata_00%d.lvm",i));
    x = [1:length(data)]/10000;
    if i==2
        freq(count) = findfreq(data,3,nrsecs)
    else
        freq(count) = findfreq(data,startsec,nrsecs)
    end
    count = count+1;

%     figure
%     plot(x,data)
end

% %%
% close all
for i = 10:15
    data = load(sprintf("DanHendata_0%d.lvm",i));
    x = [1:length(data)]/10000;
    if i==10
        freq(count) = findfreq(data,3,nrsecs)
    else
        freq(count) = findfreq(data,startsec,nrsecs)
    end
    count = count+1;
    figure
    plot(x,data)
end

average_freq = mean(freq)

%% 
data = load("DanHendata_009.lvm");
x = [1:length(data)]/10000;
close all
plot(x,data/cal_const-mean(data/cal_const))
xlabel("Time [s]")
ylabel("Amplitude [m]")
grid on 
findfreq(data,1,10)