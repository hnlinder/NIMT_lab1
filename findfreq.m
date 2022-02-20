function [freq, tops, bottoms] = findfreq(data,startsec,nrsecs)

% tops and bottoms 
average = mean(data);
% data = data;
len = length(data);
tops = zeros(len,1);
bottoms = zeros(len,1);
for ind = 2:len-1
    if data(ind)>data(ind-1)&& data(ind)> data(ind+1)&&data(ind)>average
        tops(ind) = 1;
    elseif data(ind)<data(ind-1)&& data(ind)<data(ind+1)&&data(ind)<average
        bottoms(ind) = 1;
    end
end


% uncomment to plot during execution
% tops = tops(tops~=0);
% bottoms = bottoms(bottoms~=0);
x = [1:length(tops)]/10000;
cal_const = 443.6601; %calibration constant, average of 3 calibrations

figure 
plot(x,data/cal_const)
hold on 
plot(x,data/cal_const.*tops,"r*")
hold on 
plot(x,data.*bottoms/cal_const,"k*")
legend("Experimental Data", "Peak (top)","Peak (bottom)")
grid on 
xlabel("Time [s]")
ylabel("Amplitude [m]")

% nrsecs = 7;
freq  = length(find(bottoms(10000*startsec:(startsec+nrsecs)*10000)==1))/nrsecs



end