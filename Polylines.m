%Programmed by Mohammad Aali 40226061
clc, clear

img = imread('Screenshot 2025-07-03 at 00-46-36 ETA.pdf.png'); 
img = flipud(img);
figure; 
xRange = [0 18];
yRange = [30 65];
imagesc(xRange, yRange, img);
set(gca, 'YDir', 'normal');
axis on;   

a = drawpolyline('lineWidth',1,'color','red');
b = drawpolyline('lineWidth',1,'color','blue');
c = drawpolyline('lineWidth',1,'color','yellow');
d = drawpolyline('lineWidth',1,'color','black');
e = drawpolyline('lineWidth',1,'color','red');
f = drawpolyline('lineWidth',1,'color','yellow');
g = drawpolyline('lineWidth',1,'color','black');
h = drawpolyline('lineWidth',1,'color','red');

xa = a.Position(:,1);
ya = a.Position(:,2);

xb = b.Position(:,1);
yb = b.Position(:,2);

xc = c.Position(:,1);
yc = c.Position(:,2);

xd = d.Position(:,1);
yd = d.Position(:,2);

xe = e.Position(:,1);
ye = e.Position(:,2);

xf = f.Position(:,1);
yf = f.Position(:,2);

xg = g.Position(:,1);
yg = g.Position(:,2);

xh = h.Position(:,1);
yh = h.Position(:,2);


save('32_200n.mat','xa', 'ya', 'xb', 'yb','xc', 'yc', 'xd', 'yd','xe', 'ye', ...
    'xf', 'yf','xg', 'yg', 'xh', 'yh');