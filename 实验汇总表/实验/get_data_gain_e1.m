clear all
close all
clc
time=0:0.05:56;
t=time';
rail_posi=xlsread('工况1.xlsx',1,'B1:B57294');
u_pid=xlsread('工况1.xlsx',1,'B1:B57294');
g_ntsm=xlsread('工况1.xlsx',2,'B1:B57294');
g_ntsmmi=xlsread('工况1.xlsx',3,'B1:B57294');
g_ntsmxie=xlsread('工况1.xlsx',4,'B1:B57294');
g_ntsmpower=xlsread('工况1.xlsx',5,'B1:B57294');
u_pid=u_pid(1:50:end);
rail_posi=rail_posi(1:50:end);
n=find(rail_posi>70,1,'first')-8/0.05;
g_ntsm=g_ntsm(1:50:end);
g_ntsmmi=g_ntsmmi(1:50:end);
g_ntsmxie=g_ntsmxie(1:50:end);
g_ntsmpower=g_ntsmpower(1:50:end);
u_pid=u_pid(n:end);
g_ntsm=g_ntsm(n:end);
g_ntsmmi=g_ntsmmi(n:end);
g_ntsmxie=g_ntsmxie(n:end);
g_ntsmpower=g_ntsmpower(n:end);
% plot(t,rail_pid,t,rail_ntsm,t,rail_ntsmmi,t,rail_ntsmxie,t,rail_ntsmpower);
% tsmN=find(tsm(:,1)>60,1,'first');
g_e1=[t(1:end-3),u_pid,g_ntsm,g_ntsmxie];
g=g_ntsmxie*0.45;