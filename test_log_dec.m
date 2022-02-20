clear
data = load("DanHendata_008.lvm");
%%

% close all
% plot(data)
startsec= 1;
nrsecs = 4;


[freq,tops,bottoms] = findfreq(data,startsec,nrsecs);
delta = log_decrement(data,tops,bottoms,startsec,nrsecs);
mean(delta(~isnan(delta)))
% a = [1,2,3,0/0, 5]
% 
% a = a()

% 002 --   -2.6216e-07
% 007   -3.1063e-06
% 008   -1.3757e-04
