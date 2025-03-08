clear all
fcur='/Users/fyshi/OUTSIDE_Google/Users/Sahar_Jack/data/postprocessing/';
case1='CASE05';
casename='Case05';
trial={'Trial01', 'Trial02' 'Trial03' 'Trial04' 'Trial05' 'Trial06', 'Trial07' 'Trial08' 'Trial09' 'Trial10' };
WaterLevel=[2.24 2.31 2.38 2.45 2.52 2.59 2.66 2.73 2.80 2.87];
Height=[0.21 0.31 0.41 0.51 0.6 0.7 0.8 0.9 1 1.1];
T=[2.54 2.93 3.31 3.70 4.08 4.46 4.84 5.23 5.61 6.00];

fdir=['../Profiles/' case1 '/'];

fig=figure(1);
wid=10;
len=6;
set(fig,'units','inches','paperunits','inches','papersize', [wid len],'position',[2 2 wid len],'paperposition',[0 0 wid len]);
colormap jet
clf

for kk=1:length(trial)
fname=[casename '_' trial{kk} '.mat'];
load([fdir fname]);
 
A=table2array(P);

hold on

plot(A(1:end,1),A(1:end,2),'LineWidth',2)

end
xlabel('x(m)')
ylabel('z(m)')
hold on

for k=1:length(WaterLevel)
plot([A(1,1) A(end,1)],[WaterLevel(k) WaterLevel(k)],'--','LineWidth',1)
text(A(1,1)+20, (WaterLevel(k)-WaterLevel(1))*1.8+3.2, [ 'WL= ' num2str(WaterLevel(k)) ' m,   ' 'Hs= ' num2str(Height(k)) ' m, ' 'T= ' num2str(T(k)) ' s'])
end

legend(trial{1},trial{2},trial{3},trial{4},trial{5},trial{6},trial{7},trial{8},trial{9},trial{10},'Water Level','Location','NorthWest')
grid

title(case1)

pname=['plots/' case1];
print('-djpeg100',  pname)



