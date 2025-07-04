%Programmed by Mohammad Aali 40226061
clc, clear

load('models.mat', 'regions')

for i = 1:numel(regions)
    regions(i).Shape = polyshape(regions(i).X, regions(i).Y);
end

x = input('Enter Q in [m3/h]: ');
y = input('Enter H in [m]: ');

flag = 0;
for i= 1:numel(regions)
    if isinterior(regions(i).Shape, log(x), log(y))
        disp(['Ideal model: ', regions(i).Name]);
        flag = 1;
        break;
    end
end

if flag == 0
    disp('Invalid input (no model)');
end

if isinterior(regions(1).Shape, log(x), log(y))
    load('32_125d.mat');
    Q_all = [xa; xb; xc; xd; xe; xf];
    H_all = [ya; yb; yc; yd; ye; yf];
    d110 = 110*ones(size(xa));
    d115 = 115*ones(size(xb));
    d120 = 120*ones(size(xc));
    d125 = 125*ones(size(xd));
    d130 = 130*ones(size(xe));
    d139 = 139*ones(size(xf));
    d_all = [d110; d115; d120; d125; d130; d139];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 130
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 5;
        end
    end

    load('32_125n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1; xj];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1; yj];
    n50 = 50*ones(size([xa; xb]));
    n55 = 55*ones(size([xc; xd]));
    n59 = 59*ones(size([xe; xf]));
    n60 = 60*ones(size(xg));
    n62 = 62*ones(size(xh));
    n63 = 63*ones(size(xi1));
    n63_5 = 63.5*ones(size(xj));
    n_all = [n50; n55; n59; n60; n62; n63; n63_5];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

    load('32_125p.mat');
    if Parvaneh_diameter_up == 110
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 115
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 120
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 125
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 130
        p = interp1(xe, ye, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 139
        p = interp1(xf, yf, x, 'linear', 'extrap');
    end



elseif isinterior(regions(2).Shape, log(x), log(y))
    load('32_160d.mat');
    Q_all = [xa; xb; xc; xd; xe];
    H_all = [ya; yb; yc; yd; ye];
    d130 = 130*ones(size(xa));
    d140 = 140*ones(size(xb));
    d150 = 150*ones(size(xc));
    d160 = 160*ones(size(xd));
    d169 = 169*ones(size(xe));
    d_all = [d130; d140; d150; d160; d169];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 160
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end
    

    load('32_160n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1; xj; xk];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1; yj; yk];
    n45 = 45*ones(size([xa; xb]));
    n50 = 50*ones(size([xc; xd]));
    n55 = 55*ones(size([xe; xf]));
    n58 = 58*ones(size([xg; xh]));
    n60 = 60*ones(size(xi1));
    n62 = 62*ones(size(xj));
    n63_6 = 63.6*ones(size(xk));
    n_all = [n45; n50; n55; n58; n60; n62; n63_6];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'nearest');

    load('32_160p.mat');
    if Parvaneh_diameter_up == 130
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 140
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 150
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 160
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 169
        p = interp1(xe, ye, x, 'linear', 'extrap');
    end

elseif isinterior(regions(3).Shape, log(x), log(y))
    load('32_200d.mat');
    Q_all = [xa; xb; xc; xd; xe];
    H_all = [ya; yb; yc; yd; ye];
    d170 = 170*ones(size(xa));
    d180 = 180*ones(size(xb));
    d190 = 190*ones(size(xc));
    d200 = 200*ones(size(xd));
    d209 = 209*ones(size(xe));
    d_all = [d170; d180; d190; d200; d209];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 200
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('32_200n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh];
    n20 = 20*ones(size(xa));
    n25 = 25*ones(size(xb));
    n30 = 30*ones(size(xc));
    n35 = 35*ones(size(xd));
    n40 = 40*ones(size(xe));
    n42 = 42*ones(size(xf));
    n44 = 44*ones(size(xg));
    n45 = 45*ones(size(xh));
    n_all = [n20; n25; n30; n35; n40; n42; n44; n45];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

    load('32_200p.mat');
    if Parvaneh_diameter_up == 170
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 180
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 190
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 200
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 209
        p = interp1(xe, ye, x, 'linear', 'extrap');
    end




elseif isinterior(regions(4).Shape, log(x), log(y))
    load('32_250d.mat');
    Q_all = [xa; xb; xc; xd; xe; xf];
    H_all = [ya; yb; yc; yd; ye; yf];
    d210 = 210*ones(size(xa));
    d220 = 220*ones(size(xb));
    d230 = 230*ones(size(xc));
    d240 = 240*ones(size(xd));
    d250 = 250*ones(size(xe));
    d259 = 259*ones(size(xf));
    d_all = [d210; d220; d230; d240; d250; d259];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 250
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('32_250n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh];
    n25 = 20*ones(size([xa; xb]));
    n28 = 25*ones(size([xc;xd]));
    n30 = 30*ones(size(xe));
    n32 = 32*ones(size(xf));
    n35 = 35*ones(size(xg));
    n36_5 = 36.5*ones(size(xh));
    n_all = [n25; n28; n30; n32; n35; n36_5];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

    load('32_250p.mat');
    if Parvaneh_diameter_up == 210
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 220
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 230
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 240
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 250
        p = interp1(xe, ye, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 259
        p = interp1(xf, yf, x, 'linear', 'extrap');
    end


elseif isinterior(regions(5).Shape, log(x), log(y))
    load('40_125d.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg];
    H_all = [ya; yb; yc; yd; ye; yf; yg];
    d110 = 110*ones(size(xa));
    d115 = 115*ones(size(xb));
    d120 = 120*ones(size(xc));
    d125 = 125*ones(size(xd));
    d130 = 130*ones(size(xe));
    d135 = 135*ones(size(xf));
    d139 = 139*ones(size(xg));
    d_all = [d110; d115; d120; d125; d130; d135; d139];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 135
        Parvaneh_diameter_up = Parvaneh_diameter_up + 4;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 5;
        end
    end

    load('40_125n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1; xj];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1; yj];
    n50 = 50*ones(size([xa; xb]));
    n55 = 55*ones(size([xc; xd]));
    n60 = 60*ones(size([xe; xf]));
    n65 = 65*ones(size([xg; xh]));
    n68 = 68*ones(size(xi1));
    n70 = 70*ones(size(xj));
    n_all = [n50; n55; n60; n65; n68; n70];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

    load('40_125p.mat');
    if Parvaneh_diameter_up == 110
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 115
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 120
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 125
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 130
        p = interp1(xe, ye, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 139
        p = interp1(xf, yf, x, 'linear', 'extrap');
    end


elseif isinterior(regions(6).Shape, log(x), log(y))
    load('40_160d.mat');
    Q_all = [xa; xb; xc; xd; xe];
    H_all = [ya; yb; yc; yd; ye];
    d130 = 130*ones(size(xa));
    d140 = 140*ones(size(xb));
    d150 = 150*ones(size(xc));
    d160 = 160*ones(size(xd));
    d169 = 169*ones(size(xe));
    d_all = [d130; d140; d150; d160; d169];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 160
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('40_160n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh];
    n45 = 45*ones(size(xa));
    n50 = 50*ones(size(xb));
    n55 = 55*ones(size([xc; xd]));
    n60 = 60*ones(size(xe));
    n64 = 64*ones(size(xf));
    n66 = 66*ones(size(xg));
    n67_5 = 67.5*ones(size(xh));
    n_all = [n45; n50; n55; n60; n64; n66; n67_5];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

    load('40_160p.mat');
    if Parvaneh_diameter_up == 130
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 140
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 150
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 160
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 169
        p = interp1(xe, ye, x, 'linear', 'extrap');
    end


elseif isinterior(regions(7).Shape, log(x), log(y))
    load('40_200d.mat');
    Q_all = [xa; xb; xc; xd; xe];
    H_all = [ya; yb; yc; yd; ye];
    d170 = 170*ones(size(xa));
    d180 = 180*ones(size(xb));
    d190 = 190*ones(size(xc));
    d200 = 200*ones(size(xd));
    d209 = 209*ones(size(xe));
    d_all = [d170; d180; d190; d200; d209];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 200
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('40_200n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1; xj];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1; yj];
    n35 = 35*ones(size(xa));
    n40 = 40*ones(size(xb));
    n45 = 45*ones(size([xc; xd]));
    n50 = 50*ones(size([xe; xf]));
    n54 = 54*ones(size(xg));
    n57 = 57*ones(size(xh));
    n59 = 59*ones(size(xi1));
    n60 = 60*ones(size(xj));
    n_all = [n35; n40; n45; n50; n54; n57; n59; n60];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

     load('40_200p.mat');
    if Parvaneh_diameter_up == 170
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 180
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 190
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 200
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 209
        p = interp1(xe, ye, x, 'linear', 'extrap');
    end

elseif isinterior(regions(8).Shape, log(x), log(y))
    load('40_250d.mat');
    Q_all = [xa; xb; xc; xd; xe; xf];
    H_all = [ya; yb; yc; yd; ye; yf];
    d210 = 210*ones(size(xa));
    d220 = 220*ones(size(xb));
    d230 = 230*ones(size(xc));
    d240 = 240*ones(size(xd));
    d250 = 250*ones(size(xe));
    d259 = 259*ones(size(xf));
    d_all = [d210; d220; d230; d240; d250; d259];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 250
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('40_250n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1];
    n30 = 30*ones(size(xa));
    n40 = 40*ones(size(xb));
    n50 = 50*ones(size(xc));
    n52 = 52*ones(size(xd));
    n55 = 55*ones(size([xe; xf]));
    n57 = 57*ones(size(xg));
    n58 = 58*ones(size(xh));
    n59 = 59*ones(size(xi1));
    n_all = [n30; n40; n50; n52; n55; n57; n58; n59];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

     load('40_250p.mat');
    if Parvaneh_diameter_up == 210
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 220
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 230
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 240
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 250
        p = interp1(xe, ye, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 259
        p = interp1(xf, yf, x, 'linear', 'extrap');
    end


elseif isinterior(regions(9).Shape, log(x), log(y))
    load('50_125d.mat');
    Q_all = [xa; xb; xc; xd; xe; xf];
    H_all = [ya; yb; yc; yd; ye; yf];
    d110 = 110*ones(size(xa));
    d115 = 115*ones(size(xb));
    d120 = 120*ones(size(xc));
    d125 = 125*ones(size(xd));
    d130 = 130*ones(size(xe));
    d139 = 139*ones(size(xf));
    d_all = [d110; d115; d120; d125; d130; d139];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 130
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 5;
        end
    end

    load('50_125n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg];
    H_all = [ya; yb; yc; yd; ye; yf; yg];
    n60 = 60*ones(size([xa; xb]));
    n70 = 70*ones(size([xc; xd]));
    n75 = 75*ones(size(xe));
    n77 = 77*ones(size(xf));
    n78 = 78*ones(size(xg));
    n_all = [n60; n70; n75; n77; n78];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

     load('50_125p.mat');
    if Parvaneh_diameter_up == 110
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 115
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 120
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 125
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 130
        p = interp1(xe, ye, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 139
        p = interp1(xf, yf, x, 'linear', 'extrap');
    end

elseif isinterior(regions(10).Shape, log(x), log(y))
    load('50_160d.mat');
    Q_all = [xa; xb; xc; xd; xe];
    H_all = [ya; yb; yc; yd; ye];
    d130 = 130*ones(size(xa));
    d140 = 140*ones(size(xb));
    d150 = 150*ones(size(xc));
    d160 = 160*ones(size(xd));
    d169 = 169*ones(size(xe));
    d_all = [d130; d140; d150; d160; d169];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 160
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('50_160n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg];
    H_all = [ya; yb; yc; yd; ye; yf; yg];
    n55 = 55*ones(size(xa));
    n60 = 60*ones(size(xb));
    n65 = 65*ones(size(xc));
    n70 = 70*ones(size(xd));
    n73 = 73*ones(size(xe));
    n75 = 75*ones(size(xf));
    n76 = 76*ones(size(xg));
    n_all = [n55; n60; n65; n70; n73; n75; n76];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

     load('50_160p.mat');
    if Parvaneh_diameter_up == 130
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 140
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 150
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 160
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 169
        p = interp1(xe, ye, x, 'linear', 'extrap');
    end


elseif isinterior(regions(11).Shape, log(x), log(y))
    load('50_200d.mat');
    Q_all = [xa; xb; xc; xd; xe];
    H_all = [ya; yb; yc; yd; ye];
    d170 = 170*ones(size(xa));
    d180 = 180*ones(size(xb));
    d190 = 190*ones(size(xc));
    d200 = 200*ones(size(xd));
    d209 = 209*ones(size(xe));
    d_all = [d170; d180; d190; d200; d209];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 200
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('50_200n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1; xj];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1; yj];
    n50 = 50*ones(size(xa));
    n55 = 55*ones(size(xb));
    n60 = 60*ones(size(xc));
    n65 = 65*ones(size([xd; xe]));
    n68 = 68*ones(size([xf; xg]));
    n70 = 70*ones(size(xh));
    n72 = 72*ones(size(xi1));
    n73 = 73*ones(size(xj));
    n_all = [n50; n55; n60; n65; n68; n70; n72; n73];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

     load('50_200p.mat');
    if Parvaneh_diameter_up == 170
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 180
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 190
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 200
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 209
        p = interp1(xe, ye, x, 'linear', 'extrap');
    end

elseif isinterior(regions(12).Shape, log(x), log(y))
    load('50_250d.mat');
    Q_all = [xa; xb; xc; xd; xe];
    H_all = [ya; yb; yc; yd; ye];
    d220 = 220*ones(size(xa));
    d230 = 230*ones(size(xb));
    d240 = 240*ones(size(xc));
    d250 = 250*ones(size(xd));
    d259 = 259*ones(size(xe));
    d_all = [d220; d230; d240; d250; d259];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 250
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('50_250n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1; xj; xk; xl; xm];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1; yj; yk; yl; ym];
    n30 = 30*ones(size(xa));
    n40 = 40*ones(size(xb));
    n45 = 45*ones(size(xc));
    n50 = 50*ones(size(xd));
    n55 = 55*ones(size(xe));
    n60 = 60*ones(size([xf; xg]));
    n63 = 63*ones(size([xh; xi1]));
    n65 = 65*ones(size([xj; xk]));
    n67 = 67*ones(size(xl));
    n68 = 68*ones(size(xm));
    n_all = [n30; n40; n45; n50; n55; n60; n63; n65; n67; n68];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

     load('50_250p.mat');
    if Parvaneh_diameter_up == 220
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 230
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 240
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 250
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 259
        p = interp1(xe, ye, x, 'linear', 'extrap');
    end

elseif isinterior(regions(13).Shape, log(x), log(y))
    load('65_125d.mat');
    Q_all = [xa; xb; xc; xd];
    H_all = [ya; yb; yc; yd];
    d110 = 110*ones(size(xa));
    d120 = 120*ones(size(xb));
    d130 = 130*ones(size(xc));
    d139 = 139*ones(size(xd));
    d_all = [d110; d120; d130; d139];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 130
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('65_125n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1; xj; xk; xl; xm];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1; yj; yk; yl; ym];
    n50 = 50*ones(size([xa; xb]));
    n55 = 55*ones(size([xc; xd]));
    n60 = 60*ones(size([xe; xf]));
    n65 = 65*ones(size([xg; xh]));
    n70 = 70*ones(size([xi1; xj]));
    n75 = 75*ones(size(xk));
    n78 = 78*ones(size(xl));
    n79 = 79*ones(size(xm));
    n_all = [n50; n55; n60; n65; n70; n75; n78; n79];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

     load('65_125p.mat');
    if Parvaneh_diameter_up == 110
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 120
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 130
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 139
        p = interp1(xd, yd, x, 'linear', 'extrap');
    end


elseif isinterior(regions(14).Shape, log(x), log(y))
    load('65_160d.mat');
    Q_all = [xa; xb; xc; xd; xe];
    H_all = [ya; yb; yc; yd; ye];
    d130 = 130*ones(size(xa));
    d140 = 140*ones(size(xb));
    d150 = 150*ones(size(xc));
    d160 = 160*ones(size(xd));
    d169 = 169*ones(size(xe));
    d_all = [d130; d140; d150; d160; d169];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 160
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('65_160n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1; xj; xk];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1; yj; yk];
    n40 = 40*ones(size(xa));
    n50 = 50*ones(size(xb));
    n60 = 60*ones(size([xc; xd]));
    n70 = 70*ones(size([xe; xf]));
    n75 = 75*ones(size([xg; xh]));
    n78 = 78*ones(size(xi1));
    n80 = 80*ones(size(xj));
    n82 = 82*ones(size(xk));
    n_all = [n40; n50; n60; n70; n75; n78; n80; n82];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

     load('65_160p.mat');
    if Parvaneh_diameter_up == 130
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 140
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 150
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 160
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 169
        p = interp1(xe, ye, x, 'linear', 'extrap');
    end

elseif isinterior(regions(15).Shape, log(x), log(y))
    load('65_200d.mat');
    Q_all = [xa; xb; xc; xd; xe];
    H_all = [ya; yb; yc; yd; ye];
    d170 = 170*ones(size(xa));
    d180 = 180*ones(size(xb));
    d190 = 190*ones(size(xc));
    d200 = 200*ones(size(xd));
    d209 = 209*ones(size(xe));
    d_all = [d170; d180; d190; d200; d209];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 200
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('65_200n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1; xj];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1; yj];
    n30 = 30*ones(size(xa));
    n40 = 40*ones(size(xb));
    n50 = 50*ones(size(xc));
    n60 = 60*ones(size([xd; xe]));
    n70 = 70*ones(size([xf; xg]));
    n73 = 73*ones(size(xh));
    n75 = 75*ones(size(xi1));
    n76 = 76*ones(size(xj));
    n_all = [n30; n40; n50; n60; n70; n73; n75; n76];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

     load('65_200p.mat');
    if Parvaneh_diameter_up == 170
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 180
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 190
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 200
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 209
        p = interp1(xe, ye, x, 'linear', 'extrap');
    end

elseif isinterior(regions(16).Shape, log(x), log(y))
    load('65_250d.mat');
    Q_all = [xa; xb; xc; xd; xe; xf];
    H_all = [ya; yb; yc; yd; ye; yf];
    d210 = 210*ones(size(xa));
    d220 = 220*ones(size(xb));
    d230 = 230*ones(size(xc));
    d240 = 240*ones(size(xd));
    d250 = 250*ones(size(xe));
    d259 = 259*ones(size(xf));
    d_all = [d210; d220; d230; d240; d250; d259];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 250
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('65_250n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1; xj; xk];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1; yj; yk];
    n50 = 50*ones(size([xa; xb]));
    n60 = 60*ones(size([xc; xd]));
    n65 = 65*ones(size([xe; xf]));
    n68 = 68*ones(size([xg; xh]));
    n70 = 70*ones(size([xi1; xj]));
    n71 = 71*ones(size(xk));
    n_all = [n50; n60; n65; n68; n70; n71];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

    load('65_250p.mat');
    if Parvaneh_diameter_up == 210
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 220
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 230
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 240
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 250
        p = interp1(xe, ye, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 259
        p = interp1(xf, yf, x, 'linear', 'extrap');
    end

elseif isinterior(regions(17).Shape, log(x), log(y))
    load('80_160d.mat');
    Q_all = [xa; xb; xc; xd; xe];
    H_all = [ya; yb; yc; yd; ye];
    d130 = 130*ones(size(xa));
    d140 = 140*ones(size(xb));
    d150 = 150*ones(size(xc));
    d160 = 160*ones(size(xd));
    d169 = 169*ones(size(xe));
    d_all = [d130; d140; d150; d160; d169];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 160
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('80_160n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1; xj; xk; xl; xm; xn];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1; yj; yk; yl; ym; yn];
    n30 = 30*ones(size(xa));
    n40 = 40*ones(size(xb));
    n50 = 50*ones(size(xc));
    n60 = 60*ones(size([xd; xe]));
    n70 = 70*ones(size([xf; xg]));
    n75 = 75*ones(size([xh; xi1]));
    n80 = 80*ones(size(xj));
    n82 = 82*ones(size(xk));
    n84 = 84*ones(size(xl));
    n85 = 85*ones(size(xm));
    n86 = 86*ones(size(xn));
    n_all = [n30; n40; n50; n60; n70; n75; n80; n82; n84; n85; n86];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

     load('80_160p.mat');
    if Parvaneh_diameter_up == 130
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 140
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 150
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 160
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 169
        p = interp1(xe, ye, x, 'linear', 'extrap');
    end

elseif isinterior(regions(18).Shape, log(x), log(y))
    load('80_200d.mat');
    Q_all = [xa; xb; xc; xd; xe];
    H_all = [ya; yb; yc; yd; ye];
    d170 = 170*ones(size(xa));
    d180 = 180*ones(size(xb));
    d190 = 190*ones(size(xc));
    d200 = 200*ones(size(xd));
    d209 = 209*ones(size(xe));
    d_all = [d170; d180; d190; d200; d209];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 200
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('80_200n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1];
    n50 = 50*ones(size(xa));
    n60 = 60*ones(size([xb; xc]));
    n70 = 70*ones(size([xd; xe]));
    n75 = 75*ones(size([xf; xg]));
    n78 = 78*ones(size(xh));
    n80 = 80*ones(size(xi1));
    n_all = [n50; n60; n70; n75; n78; n80];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

     load('80_200p.mat');
    if Parvaneh_diameter_up == 170
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 180
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 190
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 200
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 209
        p = interp1(xe, ye, x, 'linear', 'extrap');
    end

elseif isinterior(regions(19).Shape, log(x), log(y))
    load('80_250d.mat');
    Q_all = [xa; xb; xc; xd; xe; xf];
    H_all = [ya; yb; yc; yd; ye; yf];
    d210 = 210*ones(size(xa));
    d220 = 220*ones(size(xb));
    d230 = 230*ones(size(xc));
    d240 = 240*ones(size(xd));
    d250 = 250*ones(size(xe));
    d259 = 259*ones(size(xf));
    d_all = [d210; d220; d230; d240; d250; d259];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 250
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('80_250n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1; xj; xk];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1; yj; yk];
    n30 = 30*ones(size(xa));
    n40 = 40*ones(size(xb));
    n50 = 50*ones(size(xc));
    n60 = 60*ones(size([xd; xe]));
    n70 = 70*ones(size([xf; xg]));
    n74 = 74*ones(size([xh; xi1]));
    n77 = 77*ones(size(xj));
    n78_5 = 78.5*ones(size(xk));
    n_all = [n30; n40; n50; n60; n70; n74; n77; n78_5];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

     load('80_250p.mat');
    if Parvaneh_diameter_up == 210
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 220
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 230
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 240
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 250
        p = interp1(xe, ye, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 259
        p = interp1(xf, yf, x, 'linear', 'extrap');
    end

elseif isinterior(regions(20).Shape, log(x), log(y))
    load('100_160d.mat');
    Q_all = [xa; xb; xc; xd; xe];
    H_all = [ya; yb; yc; yd; ye];
    d150 = 150*ones(size(xa));
    d160 = 160*ones(size(xb));
    d169 = 169*ones(size(xc));
    d169_2 = 169*ones(size(xd));
    d169_3 = 169*ones(size(xe));
    d_all = [d150; d160; d169; d169_2; d169_3];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if 169 < Parvaneh_diameter_mianyabi < 169
            Parvaneh_diameter_up = 169;
        elseif 150 < Parvaneh_diameter_mianyabi < 160
            Parvaneh_diameter_up = 160;
        end
    end

    load('100_160n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1; xj; xk; xl; xm];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1; yj; yk; yl; ym];
    n30 = 30*ones(size(xa));
    n40 = 40*ones(size(xb));
    n50 = 50*ones(size(xc));
    n60 = 60*ones(size(xd));
    n65 = 65*ones(size(xe));
    n70 = 70*ones(size([xf; xg]));
    n73 = 73*ones(size(xh));
    n76 = 76*ones(size(xi1));
    n78 = 78*ones(size(xj));
    n80 = 80*ones(size([xk; xl]));
    n81_5 = 81.5*ones(size(xm));
    n_all = [n30; n40; n50; n60; n65; n70; n73; n76; n78; n80; n81_5];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

     load('100_160p.mat');
    if Parvaneh_diameter_up == 150
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 160
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 169
        p = interp1(xe, ye, x, 'linear', 'extrap');
    end

elseif isinterior(regions(21).Shape, log(x), log(y))
    load('100_200d.mat');
    Q_all = [xa; xb; xc; xd; xe];
    H_all = [ya; yb; yc; yd; ye];
    d170 = 170*ones(size(xa));
    d180 = 180*ones(size(xb));
    d190 = 190*ones(size(xc));
    d200 = 200*ones(size(xd));
    d209 = 209*ones(size(xe));
    d_all = [d170; d180; d190; d200; d209];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 200
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('100_200n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1; xj; xk; xl];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1; yj; yk; yl];
    n30 = 30*ones(size(xa));
    n40 = 40*ones(size(xb));
    n50 = 50*ones(size(xc));
    n60 = 60*ones(size([xd; xe]));
    n70 = 70*ones(size([xf; xg]));
    n75 = 75*ones(size([xh; xi1]));
    n80 = 80*ones(size(xj));
    n82 = 82*ones(size(xk));
    n84_5 = 84.5*ones(size(xl));
    n_all = [n30; n40; n50; n60; n70; n75; n80; n82; n84_5];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

     load('100_200p.mat');
    if Parvaneh_diameter_up == 170
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 180
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 190
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 200
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 209
        p = interp1(xe, ye, x, 'linear', 'extrap');
    end

elseif isinterior(regions(22).Shape, log(x), log(y))
    load('100_250d.mat');
    Q_all = [xa; xb; xc; xd; xe];
    H_all = [ya; yb; yc; yd; ye];
    d220 = 220*ones(size(xa));
    d230 = 230*ones(size(xb));
    d240 = 240*ones(size(xc));
    d250 = 250*ones(size(xd));
    d259 = 259*ones(size(xe));
    d_all = [d220; d230; d240; d250; d259];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 250
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('100_250n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1; xj; xk; xl];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1; yj; yk; yl];
    n50 = 50*ones(size(xa));
    n60 = 60*ones(size([xb; xc]));
    n65 = 65*ones(size([xd; xe]));
    n70 = 70*ones(size([xf; xg]));
    n75 = 75*ones(size([xh; xi1]));
    n78 = 78*ones(size(xj));
    n80 = 80*ones(size(xk));
    n81 = 81*ones(size(xl));
    n_all = [n50; n60; n65; n70; n75; n78; n80; n81];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'nearest');

     load('100_250p.mat');
    if Parvaneh_diameter_up == 220
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 230
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 240
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 250
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 259
        p = interp1(xe, ye, x, 'linear', 'extrap');
    end

elseif isinterior(regions(23).Shape, log(x), log(y))
    load('125_200d.mat');
    Q_all = [xa; xb; xc; xd; xe];
    H_all = [ya; yb; yc; yd; ye];
    d170 = 170*ones(size(xa));
    d180 = 180*ones(size(xb));
    d190 = 190*ones(size(xc));
    d200 = 200*ones(size(xd));
    d209 = 209*ones(size(xe));
    d_all = [d170; d180; d190; d200; d209];
    Parvaneh_diameter_mianyabi = griddata(Q_all, H_all, d_all, x, y, 'linear');
    Parvaneh_diameter_up = griddata(Q_all, H_all, d_all, x, y, 'nearest');
    if Parvaneh_diameter_up < Parvaneh_diameter_mianyabi
        if Parvaneh_diameter_up == 200
        Parvaneh_diameter_up = Parvaneh_diameter_up + 9;
        else
        Parvaneh_diameter_up = Parvaneh_diameter_up + 10;
        end
    end

    load('125_200n.mat');
    Q_all = [xa; xb; xc; xd; xe; xf; xg; xh; xi1; xj; xk; xl];
    H_all = [ya; yb; yc; yd; ye; yf; yg; yh; yi1; yj; yk; yl];
    n40 = 40*ones(size(xa));
    n50 = 50*ones(size(xb));
    n60 = 60*ones(size(xc));
    n65 = 65*ones(size(xd));
    n70 = 70*ones(size([xe; xf]));
    n75 = 75*ones(size([xg; xh]));
    n78 = 78*ones(size(xi1));
    n80 = 80*ones(size(xj));
    n82 = 82*ones(size(xk));
    n83_5 = 83.5*ones(size(xl));
    n_all = [n40; n50; n60; n65; n70; n75; n78; n80; n82; n83_5];
    efficiency = griddata(Q_all, H_all, n_all, x, y, 'linear');

     load('125_200p.mat');
    if Parvaneh_diameter_up == 170
        p = interp1(xa, ya, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 180
        p = interp1(xb, yb, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 190
        p = interp1(xc, yc, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 200
        p = interp1(xd, yd, x, 'linear', 'extrap');
    elseif Parvaneh_diameter_up == 209
        p = interp1(xe, ye, x, 'linear', 'extrap');
    end


end

if flag == 1  
    disp(['Ideal Parvaneh diameter (up) [mm]: ', num2str(Parvaneh_diameter_up)]);
    disp(['Parvaneh diameter (mianyabi) [mm]: ', num2str(Parvaneh_diameter_mianyabi)]);
    disp(['Efficiency [percent]: ', num2str(efficiency)]);
    disp(['Required power [kW]: ', num2str(p)]);
end











    