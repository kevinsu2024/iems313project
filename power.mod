# Data-independent model for power problem
#
# Name: Kevin Su, Frank Xin, Andre Tsai
# Date: Feb 16, 2024

set BUSES;
set LINE_IDS;
set GENERATOR_IDS;
set LINES within (BUSES cross BUSES cross LINE_IDS);
set GENERATORS within (BUSES cross GENERATOR_IDS);

param bus_susceptance {LINES}; 
param upper_line_limit {LINES};
param demand {BUSES};
param min_generation{GENERATORS};
param max_generation{GENERATORS};
param linear_cost_coeff {GENERATORS};


var p {(i,h) in GENERATORS};
var d {i in BUSES};

minimize Total_Cost: sum {(i,h) in GENERATORS} 0.00001*linear_cost_coeff[i,h]* p[i,h];

subject to Power_Demand {i in BUSES} : 
	sum{(i,j,k) in LINES} 0.00001* bus_susceptance[i,j,k] * (d[i] - d[j]) + sum{(i,h) in GENERATORS} p[i,h] = 0.00001* demand[i] ;

subject to line_limit {(i,j,k) in LINES}:
	 -0.00001*upper_line_limit[i,j,k] <= 0.00001*bus_susceptance[i,j,k] * (d[i] - d[j]) <= 0.00001*upper_line_limit[i,j,k];
 
subject to generator_limit {(i,h) in GENERATORS}:
	0.00001*min_generation[i,h] <= p[i,h] <= 0.00001*max_generation[i,h];


