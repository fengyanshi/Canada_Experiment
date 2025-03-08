clear all
fcur='/Users/fyshi/OUTSIDE_Google/Users/Sahar_Jack/data/postprocessing/';
case1='CASE06';
casename='Case06';
trial={'Trial01', 'Trial02' 'Trial03' 'Trial04' 'Trial05'};
WaterLevel=[2.23 2.4 2.55 2.71 2.87];
Height=[0.6 0.6 0.6 0.6 0.6];
T=[8.00 9.00 10.00 11.00 12.00];

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
text(A(1,1)+5, WaterLevel(k)+0.05,[ 'WL= ' num2str(WaterLevel(k)) ' m,   ' 'Hs= ' num2str(Height(k)) ' m, ' 'T= ' num2str(T(k)) ' s'])
end

legend(trial{1},trial{2},trial{3},trial{4},trial{5},'Water Level','Location','NorthWest')

grid

title(case1)

pname=['plots/' case1];
print('-djpeg100',  pname)



