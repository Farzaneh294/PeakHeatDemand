%This script calculate the maximum heating power demand for each m2 of a
%greenhouse in each place in Switzerland
clc
clear all

%Latitude
for i=1:62
    yy(i)=48-(i+1).*0.04 ;
end
%Longitude
for j=1:130
    xx(j)=5.5+(j-1).*0.04 ;
end

PD_tomato=zeros(62,130);
PD_cucumber=zeros(62,130);
PD_lettuce=zeros(62,130);
LD_tomato=zeros(62,130);
LD_cucumber=zeros(62,130);
LD_lettuce=zeros(62,130);

Data1=xlsread('ALL LANDS.xlsx');

for i=1:length(Data1)
 X(i)=Data1(i,2);%Longitude
 Y(i)=Data1(i,3);%Latitude   
 n=round((X(i)-5.5)./0.04);
 m=round((48-Y(i))./0.04);
 PD_tomato(m,n)=Data1(i,7);
 PD_cucumber(m,n)=Data1(i,8);
 PD_lettuce(m,n)=Data1(i,9);
 LD_tomato(m,n)=Data1(i,10);
 LD_cucumber(m,n)=Data1(i,11);
 LD_lettuce(m,n)=Data1(i,12);
end

PD_tomato(PD_tomato==0)=NaN;
PD_cucumber(PD_cucumber==0)=NaN;
PD_lettuce(PD_lettuce==0)=NaN;
LD_tomato(LD_tomato==0)=NaN;
LD_cucumber(LD_cucumber==0)=NaN;
LD_lettuce(LD_lettuce==0)=NaN;


figure(1)
subplot(3,1,1)
surface(xx,yy,PD_tomato)
shading interp;
caxis manual
caxis([0.5 3]);
%colormap(flipud(turbo))

subplot(3,1,2)
surface(xx,yy,PD_cucumber)
shading interp;
caxis manual
caxis([0.5 3]);
%colormap(flipud(turbo))

subplot(3,1,3)
surface(xx,yy,PD_lettuce)
shading interp;
caxis manual
caxis([0.5 3]);
%colormap(flipud(turbo))

figure(2)
subplot(3,1,1)
surface(xx,yy,LD_tomato)
shading interp;
caxis manual
caxis([30 135]);
%colormap((parula))


subplot(3,1,2)
surface(xx,yy,LD_cucumber)
shading interp;
caxis manual
caxis([30 135]);
%colormap((parula))

subplot(3,1,3)
surface(xx,yy,LD_lettuce)
shading interp;
caxis manual
caxis([30 135]);
%colormap((parula))


Data2=xlsread('SELECTED LANDS.xlsx');


for i=1:length(Data2)
X_cord(i)=Data2(i,2);%Longitude
Y_cord(i)=Data2(i,3);%Latitude
% Matching coordinations
 n=round((X_cord(i)-5.5)./0.04);
 m=round((48-Y_cord(i))./0.04);
 PD_tomato_SELECTED_LANDS(i)=PD_tomato(m,n);
 PD_cucumber_SELECTED_LANDS(i)=PD_cucumber(m,n);
 PD_lettuce_SELECTED_LANDS(i)=PD_lettuce(m,n);
 LD_tomato_SELECTED_LANDS(i)=LD_tomato(m,n);
 LD_cucumber_SELECTED_LANDS(i)=LD_cucumber(m,n);
 LD_lettuce_SELECTED_LANDS(i)=LD_lettuce(m,n);

 RESULT(i,:)=[i;X_cord(i);Y_cord(i);PD_tomato_SELECTED_LANDS(i);PD_cucumber_SELECTED_LANDS(i)...
         ;PD_lettuce_SELECTED_LANDS(i);LD_tomato_SELECTED_LANDS(i);LD_cucumber_SELECTED_LANDS(i)...
         ;LD_lettuce_SELECTED_LANDS(i)].';
end





