%% Processing Times Bar Chart

close all
clear all

TimeForCalc = [0.801115152	3.433545455	14.83839394	19.07305455;0.815364167	1.020872833	15.64777817	17.48401517;0.238275417	6.060484417	5.2805145 12.34589233;0.202103167	2.341257	4.716347167	7.941652333];
StdTimeForCalc = [0.145116084	0.210596827	2.746366091	2.584513119;0.140489384	0.183726085	3.356171111	3.197697997 ;0.022566953	0.541804203	0.578652228	0.676649094;0.021952161	0.423910239	0.878200676	0.966727954];

temp = TimeForCalc;
TimeForCalc(2,:) = temp(3,:);
TimeForCalc(3,:) = temp(2,:); 

temp = StdTimeForCalc;
StdTimeForCalc(2,:) = temp(3,:);
StdTimeForCalc(3,:) = temp(2,:);

TimeForCalc = TimeForCalc(1:2,:);
StdTimeForCalc = StdTimeForCalc(1:2,:);

barplotData = TimeForCalc;
stdplotData = StdTimeForCalc;

figure;
set(gcf,'color','w')
ctrs = 1:4;
data = barplotData;

ColorM = [0.8588    0.6863    0.6941;0.7725    0.0196    0.0471; .8 .8 .8; 1 1 1 ]; % CHANGE THAM RGB'S DEM RGB'S BETTER LOOK AMAZING LIKE BLOW YOUR MIND AMAZING AS IN ANOTHER DEMENSION THAT I CANT EVEN UNDERSTAND HOW CRAZY DEM COLORS ARE THAT MY EYES EXPLODE AND TURN INTO A ROCKET AND FLY TO A NEW UNIVERSE THAT IS EVEN MORE AMAZING THAN YOU GRAPH COLORS SO YEAH JUST AN EASY 6 NUMBERS TO PICK BUT NO PRESURE NO PRESSURE

hBar = bar(ctrs, data','EdgeColor','k','LineWidth',1);
for k1 = 1:size(barplotData,1)
    ctr(k1,:) = bsxfun(@plus, hBar(1).XData, [hBar(k1).XOffset]');
    ydt(k1,:) = hBar(k1).YData;
    hBar(k1).FaceColor = ColorM(k1,:);

end
hold on
er = errorbar(ctr, ydt, stdplotData, '.r');

for n = 1:4 % Change display of error bars
er(n).Color = [0 0 0];                            
er(n).LineStyle = 'none'; 
er(n).LineWidth = 2;
end
hold off
ylabel('Time (min)')


legend('CPS 16GB','QVT 16GB','Location','northwest')
legend boxoff 

names = {'Angiogram'; 'Load Data'; 'Processing'; 'Total Case'};
set(gca,'xtick',[1:4],'xticklabel',names)
title('Post Processing Times ')
ylim([0 22])
set(gca,'box','on','LineWidth',2)
set(findall(gcf,'-property','FontSize'),'FontSize',28)