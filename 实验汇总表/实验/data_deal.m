clear all
clc
load("70_cntsm.mat");
load("70_pid.mat");
u_pid(:,1)=pid.X.Data;
u_pid(:,2)=pid.Y(1).Data;
u_cntsmc(:,1)=cntsm.X.Data;
u_cntsmc(:,2)=cntsm.Y(1).Data;