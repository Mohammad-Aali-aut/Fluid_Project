%Programmed by Mohammad Aali 40226061
clc, clear

img = imread('QHgraph.png'); 
img = flipud(img);
figure; 
xRange = [log(3) log(600)];
yRange = [log(10) log(100)];
imagesc(xRange, yRange, img);
set(gca, 'YDir', 'normal');
axis on;   

a = drawpolygon('lineWidth',1,'color','red');
b = drawpolygon('lineWidth',1,'color','blue');
c = drawpolygon('lineWidth',1,'color','yellow');
d = drawpolygon('lineWidth',1,'color','black');
e = drawpolygon('lineWidth',1,'color','red');
f = drawpolygon('lineWidth',1,'color','blue');
g = drawpolygon('lineWidth',1,'color','green');
h = drawpolygon('lineWidth',1,'color','red');
i1 = drawpolygon('lineWidth',1,'color','cyan');
j = drawpolygon('lineWidth',1,'color','red');
k = drawpolygon('lineWidth',1,'color','blue');
l = drawpolygon('lineWidth',1,'color','black');
m = drawpolygon('lineWidth',1,'color','yellow');
n = drawpolygon('lineWidth',1,'color','cyan');
o = drawpolygon('lineWidth',1,'color','red');
p = drawpolygon('lineWidth',1,'color','green');
q = drawpolygon('lineWidth',1,'color','blue');
r = drawpolygon('lineWidth',1,'color','yellow');
s = drawpolygon('lineWidth',1,'color','cyan');
t = drawpolygon('lineWidth',1,'color','red');
u = drawpolygon('lineWidth',1,'color','green');
v = drawpolygon('lineWidth',1,'color','red');
w = drawpolygon('lineWidth',1,'color','black');

regions(1).X = a.Position(:,1).'; 
regions(1).Y = a.Position(:,2).';     
regions(1).Name = 'centrifugal pump 32-125 ';
  
regions(2).X = b.Position(:,1).'; 
regions(2).Y = b.Position(:,2).';     
regions(2).Name = 'centrifugal pump 32-160';
  
regions(3).X = c.Position(:,1).'; 
regions(3).Y = c.Position(:,2).';     
regions(3).Name = 'centrifugal pump 32-200';

regions(4).X = d.Position(:,1).'; 
regions(4).Y = d.Position(:,2).';     
regions(4).Name = 'centrifugal pump 32-250';

regions(5).X = e.Position(:,1).'; 
regions(5).Y = e.Position(:,2).';     
regions(5).Name = 'centrifugal pump 40-125';
  
regions(6).X = f.Position(:,1).'; 
regions(6).Y = f.Position(:,2).';     
regions(6).Name = 'centrifugal pump 40-160';
 
regions(7).X = g.Position(:,1).'; 
regions(7).Y = g.Position(:,2).';     
regions(7).Name = 'centrifugal pump 40-200';

regions(8).X = h.Position(:,1).'; 
regions(8).Y = h.Position(:,2).';     
regions(8).Name = 'centrifugal pump 40-250';

regions(9).X = i1.Position(:,1).'; 
regions(9).Y = i1.Position(:,2).';     
regions(9).Name = 'centrifugal pump 50-125';

regions(10).X = j.Position(:,1).'; 
regions(10).Y = j.Position(:,2).';     
regions(10).Name = 'centrifugal pump 50-160';

regions(11).X = k.Position(:,1).'; 
regions(11).Y = k.Position(:,2).';     
regions(11).Name = 'centrifugal pump 50-200';
   
regions(12).X = l.Position(:,1).'; 
regions(12).Y = l.Position(:,2).';     
regions(12).Name = 'centrifugal pump 50-250';

pos = m.Position;   
regions(13).X = m.Position(:,1).'; 
regions(13).Y = m.Position(:,2).';     
regions(13).Name = 'centrifugal pump 65-125';

regions(14).X = n.Position(:,1).'; 
regions(14).Y = n.Position(:,2).';     
regions(14).Name = 'centrifugal pump 65-160';
 
regions(15).X = o.Position(:,1).'; 
regions(15).Y = o.Position(:,2).';     
regions(15).Name = 'centrifugal pump 65-200';

regions(16).X = p.Position(:,1).'; 
regions(16).Y = p.Position(:,2).';     
regions(16).Name = 'centrifugal pump 65-250';
  
regions(17).X = q.Position(:,1).'; 
regions(17).Y = q.Position(:,2).';     
regions(17).Name = 'centrifugal pump 80-160';
  
regions(18).X = r.Position(:,1).'; 
regions(18).Y = r.Position(:,2).';     
regions(18).Name = 'centrifugal pump 80-200';
   
regions(19).X = s.Position(:,1).'; 
regions(19).Y = s.Position(:,2).';     
regions(19).Name = 'centrifugal pump 80-250';
  
regions(20).X = t.Position(:,1).'; 
regions(20).Y = t.Position(:,2).';     
regions(20).Name = 'centrifugal pump 100-160';

regions(21).X = u.Position(:,1).'; 
regions(21).Y = u.Position(:,2).';     
regions(21).Name = 'centrifugal pump 100-200';

regions(22).X = v.Position(:,1).'; 
regions(22).Y = v.Position(:,2).';     
regions(22).Name = 'centrifugal pump 100-250';
   
regions(23).X = w.Position(:,1).'; 
regions(23).Y = w.Position(:,2).';     
regions(23).Name = 'centrifugal pump 125-200';

save('models.mat','regions');


