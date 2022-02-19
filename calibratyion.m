data = load("cal_002.lvm"); 
data1= load("cal_001.lvm");
%%
%cal1 DanHendata_004
close all
% data = DanHendata_004(1:end);
%plot(data)%,"r*")
% figure
hold on
% plot(data,"r*")
%78311
%189589
cal_const1 = (data1(78311)-data1(189589))/(146*10^(-5))


%cal2 cal002 8.74 mm  ## cal_003 8.38mm
cal2 = cal_002(23000:183179);
cal3 = cal_002(183180:end);
plot(data1)
plot(78311,data1(78311),'r*')
plot(189589,data1(189589),'r*')
plot(cal2)
plot(cal3)
cal_const2 = (max(cal2) - min(cal2))/(8.74e-3)
cal_const3 = (max(cal3) - min(cal3))/(8.38e-3)

cal_const = mean([cal_const1,cal_const2, cal_const3])