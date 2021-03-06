clear
data = load("DanHendata_002.lvm");
data = data-mean(data);
%%
hold on 
% close all
% plot(data)
startsec= 3;
nrsecs = 4;


[freq,tops,bottoms] = findfreq(data,startsec,nrsecs);
delta = log_decrement(data,tops,bottoms,startsec,nrsecs); %delta has delta.a and delta.b, for  delta(x) = a*exp(b*x)

x = find(tops==1);
delta
%%
close all 
plot(data-mean(data))
hold on 
plot(x, delta.a*exp(delta.b*x),"r","LineWidth",3)
grid on 
xlabel("Time [s]")
ylabel("Amplitude [m]")



% mean(delta(~isnan(delta)))
% a = [1,2,3,0/0, 5]
% 
% a = a()

% 002 --   -2.6216e-07
% 007   -3.1063e-06
% 008   -1.3757e-04
