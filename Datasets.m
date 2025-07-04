%Programmed by Mohammad Aali 40226061
clear, clc

density = 1000;          
g = 9.81;         
powerfactor = 0.875;          
V= 460;            
n_motor = 0.9;  

%dataset 1
N_1 = 1750;
Q_1 = [0, 500, 800, 1000, 1100, 1200, 1400, 1500];
P1_1= [0.65, 0.25, -0.35, -0.92, -1.24, -1.62, -2.42, -2.89];
P2_1= [53.3, 48.3, 42.3, 36.9, 33, 27.8, 15.3, 7.3];    
I_1 = [18, 26.2, 31, 33.9, 35.2, 36.3, 38, 39];     
z1_1= 1*0.3048;    
z2_1= 3*0.3048;    
Q1_si = Q_1*0.0000630902; 
P1_1_si = P1_1*6894.76;  
P2_1_si = P2_1*6894.76;          
       
h_pump_1 = ((P2_1_si - P1_1_si)./(density*g)) + (z2_1 - z1_1);
P_hydro_1 = density.*g.*Q1_si.*h_pump_1;
P_in_1 = sqrt(3) * V .* I_1 * powerfactor * n_motor;
n_total_1 = ((P_hydro_1)./(P_in_1))*100;
Ns_1 = ((N_1).*sqrt(Q1_si))./(h_pump_1.^(3/4));

figure; 
plot(Q_1, h_pump_1, 'o-', 'MarkerFaceColor','b');
xlabel('Q (gpm)'); 
ylabel('h-pump_1 (m)'); 
grid on;

figure; 
plot(Q_1, P_hydro_1, 'o-', 'MarkerFaceColor','b');
xlabel('Q (gpm)'); 
ylabel('hydraulic power_1 (W)'); 
grid on;

figure; 
plot(Q_1, n_total_1, 'o-', 'MarkerFaceColor','b');
xlabel('Q (gpm)'); 
ylabel('total efficiency_1 (percent)'); 
grid on;

figure; 
plot(Q_1, Ns_1, 'o-', 'MarkerFaceColor','b');
xlabel('Q (gpm)'); 
ylabel('specific speed_1'); 
grid on;




%dataset 2
N_2 = 1100;
T_2 = [2.1, 2, 1.9, 1.7, 1.8, 1.7, 1.5, 1.5, 1.4, 1.2, 1.1, 1, 0.9];  
Q_2= [254, 228, 197, 163, 177, 155, 127, 129, 99, 75, 50, 27, 2];
P1_2= [-0.08, -0.07, -0.05, -0.04, -0.05, -0.04, -0.03, -0.03, -0.02, -0.02, -0.02, -0.01, -0.01];
P2_2= [0.06, 0.11, 0.18, 0.25, 0.21, 0.25, 0.29, 0.29, 0.32, 0.34, 0.35, 0.36, 0.36];  
P_motor= [0.52, 0.5, 0.48, 0.46, 0.47, 0.45, 0.42, 0.42, 0.4, 0.38, 0.36, 0.33, 0.31];                  
Q2_si= Q_2*(0.001/60);
P1_2_si= P1_2*100000; 
P2_2_si = P2_2*100000;               
P_motor_si = P_motor*1000;           

h_pump_2 = ((P2_2_si - P1_2_si))./(density*g);
P_hydro_2 = density.*g .*Q2_si.*h_pump_2;
w_2 = N_2*2*pi/60;          
P_mechanical_2 = T_2.*w_2;
n_total_2 = ((P_hydro_2)./(P_motor_si))*100;
n_hydro_2 = ((P_hydro_2)./(P_mechanical_2))*100;
Ns_2 = ((N_2).*sqrt(Q2_si))./(h_pump_2.^(3/4));

figure; 
plot(Q_2, h_pump_2, 'o-', 'MarkerFaceColor','b');
xlabel('Q (L/min)'); 
ylabel('h-pump_2 (m)'); 
grid on;

figure; 
plot(Q_2, P_hydro_2, 'o-', 'MarkerFaceColor','b');
xlabel('Q (L/min)'); 
ylabel('hydraulic power_2 (W)'); 
grid on;

figure; 
plot(Q_2, n_total_2,'o-', 'MarkerFaceColor','b');
xlabel('Q (L/min)'); 
ylabel('total efficiency_2 (%)'); 
grid on;

figure; 
plot(Q_2, n_hydro_2, 'o-', 'MarkerFaceColor','b');
xlabel('Q (L/min)'); 
ylabel('hydraulic efficiency_2 (percent)'); 
grid on;

figure; 
plot(Q_2, P_mechanical_2, 'o-', 'MarkerFaceColor','b');
xlabel('Q (L/min)'); 
ylabel('mechanical power_2 (W)'); 
grid on;

figure; 
plot(Q_2, Ns_2, 'o-', 'MarkerFaceColor','b');
xlabel('Q (L/min)'); 
ylabel('specific speed_2'); 
grid on;

