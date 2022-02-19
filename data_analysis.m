data = load("DanHendata_011.lvm");
% data = DanHendata_014(1:end);
%%
close all
interval = 10000:length(data);

plot(data)%,"r*")
% figure
% hold on
% plot(data,"r*")
cal_const = 443.6601;
amp = data(interval)/(-cal_const);%+1.7*10^-5;
mn = mean(amp);
figure 
plot(amp-mn)%,"r*")
hold on
%% tops and bottoms 

average = mean(data);
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

plot(data.*tops,"r*")
plot(data.*bottoms,"k*")

%%
nrsecs = 7;
freq  = length(find(bottoms(10000:(1+nrsecs)*10000)==1))/nrsecs