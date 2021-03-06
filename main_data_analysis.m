%main script, gets frequency and maybe logarithmic decrement (that one is weird though)
% for all data sets that aren't nonsensical


close all 
clear
cal_const = 443.6601; %calibration constant, average of 3 calibrations

% freq = zeros(11,1);
count = 1;
startsec = 1.4;
nrsecs = 6;
for i = [2,7:8]
    data = load(sprintf("DanHendata_00%d.lvm",i));
    data = data-mean(data);
%     x = [1:length(data)]/10000;
    if i==2
        [freq(count), tops, bottoms] = findfreq(data,3,nrsecs);
    else
        [freq(count), tops, bottoms] = findfreq(data,startsec,nrsecs);
    end
    [delta] = log_decrement(data,tops,bottoms,startsec,nrsecs)
%     goodness
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
    data = data-mean(data);
%     x = [1:length(data)]/10000;
    if i==10
        [freq(count), tops, bottoms] = findfreq(data,3,nrsecs);
    else
        [freq(count), tops, bottoms] = findfreq(data,startsec,nrsecs);
    end
    [delta] = log_decrement(data,tops,bottoms,startsec,nrsecs)
%     goodness

    arrdelta(count,1) = delta.a;
    arrdelta(count,2) = delta.b;
    count = count+1;
%     figure
%     plot(x,data)
end

average_freq = mean(freq)
stdav_freq = std(freq)
min95 = average_freq-2*stdav_freq;
max95 = average_freq+2*stdav_freq;
%delta has delta.a and delta.b, for  delta(x) = a*exp(b*x)
avdelta = mean(arrdelta(:,2))
damping_coefficient = avdelta/average_freq

%% Just for testing purposes and making plots
data = load("DanHendata_010.lvm");
data = data-mean(data);
% close all

x = [1:length(data)]/10000;
close all
plot(x,data/cal_const-mean(data/cal_const))
hold on
xlabel("Time [s]")
ylabel("Amplitude [m]")
grid on 
[freq(count), tops, bottoms] = findfreq(data,startsec,nrsecs);
delta = log_decrement(data,tops,bottoms,startsec,nrsecs); %delta has delta.a and delta.b, for  delta(x) = a*exp(b*x)
x = find(tops==1);
plot(x/10000, delta.a*exp(delta.b*x)/cal_const-mean(data/cal_const),"r","LineWidth",3)
legend("Experimental data",sprintf("Fit to exponential decay curve, y = %.2f*exp((%.2e)*t)",delta.a,delta.b))


% plot()

% findfreq(data,1,10)