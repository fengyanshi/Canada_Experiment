clear all
fcur='/Users/fyshi/OUTSIDE_Google/Users/Sahar_Jack/data/preprocessing/';
case1='CASE01';
casename='Case01';
trial={'Pretrial', 'Trial01', 'Trial02' 'Trial03' 'Trial04' 'Trial05'};
WaterLevel=[2.1 2.1 2.1 2.1 2.1 2.1];
Height=[0.0 0.6 0.5 0.7 0.6 0.6];
T=[0.0 7.11 7.11 7.11 7.11 7.11 ];

dx=0.25;

fdir=['../Smoothed_Profiles/' case1 '/'];


fig=figure(1);
wid=10;
len=12;
set(fig,'units','inches','paperunits','inches','papersize', [wid len],'position',[2 2 wid len],'paperposition',[0 0 wid len]);
colormap jet
clf

for kk=1:length(trial)
fname_x=['smoothed_' casename '_' trial{kk} '_x.mat'];
fname_z=['smoothed_' casename '_' trial{kk} '_z.mat'];
load([fdir fname_x]);

sm_x=eval(['smoothed_x1_Pretrial']);
sm_z=eval(['smoothed_z1_Pretrial']);

subplot(211)
plot(sm_x,sm_z,'-','LineWidth',1)
hold on

% construct model profile
x=[30:dx:107]';
z=interp1(sm_x,sm_z,x);
X=[0:dx:107]';
Z=ones(size(X))*0.5;
Z(length(Z)+1-length(z):length(Z))=z(:);
ZZ=WaterLevel(kk)-Z;

eval(['mkdir model_grid/' case1]);

fname=['model_grid/' case1 '/' case1 '_' trial{kk} '_dx_' num2str(dx) '.txt'];
save('-ASCII', fname, 'ZZ');

subplot(212)
plot(X,-ZZ)
hold on
plot([X(1) X(end)],[0 0],'b--','LineWidth',1)

end



subplot(211)
for k=2:length(WaterLevel)
plot([sm_x(1) sm_x(end)],[WaterLevel(k) WaterLevel(k)],'b--','LineWidth',1)
text(50, 4.5-k*0.2,[ 'WL= ' num2str(WaterLevel(k)) ' m,   ' 'Hs= ' num2str(Height(k)) ' m, ' 'T= ' num2str(T(k)) ' s'])
end

xlabel('x(m)')
ylabel('z(m)')
legend(trial{1},trial{2},trial{3},trial{4},trial{5},trial{6},'Water Level','Location','NorthWest')
grid

title(case1)
axis([0 107 0 5])

subplot(212)
xlabel('x(m)')
ylabel('z(m)')
%legend(trial{1},trial{2},trial{3},trial{4},trial{5},trial{6},'Water Level','Location','NorthWest')

for k=2:length(WaterLevel)
plot([X(1) X(end)],[0 0],'b--','LineWidth',1)
text(50, 2-k*0.2, [ 'Depth= ' num2str(0.5-WaterLevel(k))])
end
title(['Grid length = ' num2str(length(X))]);


grid
axis([0 107 -2 2.5])


pname=['plots/' case1];
print('-djpeg100',  pname)



