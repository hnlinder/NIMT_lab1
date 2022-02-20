%main script, gets frequency and maybe logarithmic decrement (that one is weird though)
% for all data sets that aren't nonsensical


close all 
clear
cal_const = 443.6601; %calibration constant, average of 3 calibrations

% freq = zeros(11,1);
count = 1;
startsec = 1.4;
nrsecs = 4;
for i = [2,7:8]
    data = load(sprintf("DanHendata_00%d.lvm",i));
%     x = [1:length(data)]/10000;
    if i==2
        [freq(count), tops, bottoms] = findfreq(data,3,nrsecs);
    else
        [freq(count), tops, bottoms] = findfreq(data,startsec,nrsecs);
    end
    delta = log_decrement(data,tops,bottoms,startsec,nrsecs);
    arrdelta(count,1) = delta.a;
    arrdelta(count,2) = delta.b;
    count = count+1;
%     figure
%     plot(x,data)
end

% %%
% close all
for i = 10:15
    data = load(sprintf("DanHendata_0%d.lvm",i));
%     x = [1:length(data)]/10000;
    if i==10
        [freq(count), tops, bottoms] = findfreq(data,3,nrsecs);
    else
        [freq(count), tops, bottoms] = findfreq(data,startsec,nrsecs);
    end
    delta = log_decrement(data,tops,bottoms,startsec,nrsecs);
    arrdelta(count,1) = delta.a;
    arrdelta(count,2) = delta.b;
    count = count+1;
%     figure
%     plot(x,data)
end

average_freq = mean(freq)
%delta has delta.a and delta.b, for  delta(x) = a*exp(b*x)
avdelta = mean(arrdelta(:,2))
damping_coefficient = avdelta/average_freq

%% Just for testing purposes
data = load("DanHendata_009.lvm");
x = [1:length(data)]/10000;
close all
plot(x,data/cal_const-mean(data/cal_const))
xlabel("Time [s]")
ylabel("Amplitude [m]")
grid on 
findfreq(data,1,10)