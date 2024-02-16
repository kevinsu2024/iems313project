minimize Total_Cost:
	7.92095*p[1,1] + 23.2695*p[2,1];

subject to Power_Demand[1]:
	p[1,1] + 21.384*d[1] - 16.9005*d[2] - 4.4835*d[5] = 0;

subject to Power_Demand[2]:
	p[2,1] - 16.9005*d[1] + 33.3743*d[2] - 5.05127*d[3] - 5.6715*d[4] - 
	5.75109*d[5] = 21.7;

subject to Power_Demand[3]:
	-5.05127*d[2] + 10.8982*d[3] - 5.84692*d[4] = 94.2;

subject to Power_Demand[4]:
	-5.6715*d[2] - 5.84692*d[3] + 41.8457*d[4] - 23.7473*d[5] - 
	4.78194*d[7] - 1.79797*d[9] = 47.8;

subject to Power_Demand[5]:
	-4.4835*d[1] - 5.75109*d[2] - 23.7473*d[4] + 37.9499*d[5] - 
	3.96794*d[6] = 7.6;

subject to Power_Demand[6]:
	-3.96794*d[5] + 20.5811*d[6] - 5.02765*d[11] - 3.90915*d[12] - 
	7.67636*d[13] = 11.2;

subject to Power_Demand[7]:
	-4.78194*d[4] + 19.549*d[7] - 5.67697*d[8] - 9.09008*d[9] = 0;

subject to Power_Demand[8]:
	-5.67697*d[7] + 5.67697*d[8] = 0;

subject to Power_Demand[9]:
	-1.79797*d[4] - 9.09008*d[7] + 26.4209*d[9] - 11.8343*d[10] - 
	3.6985*d[14] = 29.5;

subject to Power_Demand[10]:
	-11.8343*d[9] + 17.0408*d[10] - 5.20644*d[11] = 9;

subject to Power_Demand[11]:
	-5.02765*d[6] - 5.20644*d[10] + 10.2341*d[11] = 3.5;

subject to Power_Demand[12]:
	-3.90915*d[6] + 8.91215*d[12] - 5.003*d[13] = 6.1;

subject to Power_Demand[13]:
	-7.67636*d[6] - 5.003*d[12] + 15.5528*d[13] - 2.8734*d[14] = 13.5;

subject to Power_Demand[14]:
	-3.6985*d[9] - 2.8734*d[13] + 6.5719*d[14] = 14.9;

subject to line_limit[1,2,1]:
	-472 <= 1690040*d[1] - 1690040*d[2] <= 472;

subject to line_limit[2,1,1]:
	-472 <= -1690040*d[1] + 1690040*d[2] <= 472;

subject to line_limit[1,5,1]:
	-128 <= 448350*d[1] - 448350*d[5] <= 128;

subject to line_limit[5,1,1]:
	-128 <= -448350*d[1] + 448350*d[5] <= 128;

subject to line_limit[2,3,1]:
	-145 <= 505127*d[2] - 505127*d[3] <= 145;

subject to line_limit[3,2,1]:
	-145 <= -505127*d[2] + 505127*d[3] <= 145;

subject to line_limit[2,4,1]:
	-158 <= 567150*d[2] - 567150*d[4] <= 158;

subject to line_limit[4,2,1]:
	-158 <= -567150*d[2] + 567150*d[4] <= 158;

subject to line_limit[2,5,1]:
	-161 <= 575109*d[2] - 575109*d[5] <= 161;

subject to line_limit[5,2,1]:
	-161 <= -575109*d[2] + 575109*d[5] <= 161;

subject to line_limit[3,4,1]:
	-160 <= 584692*d[3] - 584692*d[4] <= 160;

subject to line_limit[4,3,1]:
	-160 <= -584692*d[3] + 584692*d[4] <= 160;

subject to line_limit[4,5,1]:
	-664 <= 2374730*d[4] - 2374730*d[5] <= 664;

subject to line_limit[5,4,1]:
	-664 <= -2374730*d[4] + 2374730*d[5] <= 664;

subject to line_limit[4,7,1]:
	-141 <= 478194*d[4] - 478194*d[7] <= 141;

subject to line_limit[7,4,1]:
	-141 <= -478194*d[4] + 478194*d[7] <= 141;

subject to line_limit[4,9,1]:
	-53 <= 179797*d[4] - 179797*d[9] <= 53;

subject to line_limit[9,4,1]:
	-53 <= -179797*d[4] + 179797*d[9] <= 53;

subject to line_limit[5,6,1]:
	-117 <= 396794*d[5] - 396794*d[6] <= 117;

subject to line_limit[6,5,1]:
	-117 <= -396794*d[5] + 396794*d[6] <= 117;

subject to line_limit[6,11,1]:
	-134 <= 502765*d[6] - 502765*d[11] <= 134;

subject to line_limit[11,6,1]:
	-134 <= -502765*d[6] + 502765*d[11] <= 134;

subject to line_limit[6,12,1]:
	-104 <= 390915*d[6] - 390915*d[12] <= 104;

subject to line_limit[12,6,1]:
	-104 <= -390915*d[6] + 390915*d[12] <= 104;

subject to line_limit[6,13,1]:
	-201 <= 767636*d[6] - 767636*d[13] <= 201;

subject to line_limit[13,6,1]:
	-201 <= -767636*d[6] + 767636*d[13] <= 201;

subject to line_limit[7,8,1]:
	-167 <= 567697*d[7] - 567697*d[8] <= 167;

subject to line_limit[8,7,1]:
	-167 <= -567697*d[7] + 567697*d[8] <= 167;

subject to line_limit[7,9,1]:
	-267 <= 909008*d[7] - 909008*d[9] <= 267;

subject to line_limit[9,7,1]:
	-267 <= -909008*d[7] + 909008*d[9] <= 267;

subject to line_limit[9,10,1]:
	-325 <= 1183430*d[9] - 1183430*d[10] <= 325;

subject to line_limit[10,9,1]:
	-325 <= -1183430*d[9] + 1183430*d[10] <= 325;

subject to line_limit[9,14,1]:
	-99 <= 369850*d[9] - 369850*d[14] <= 99;

subject to line_limit[14,9,1]:
	-99 <= -369850*d[9] + 369850*d[14] <= 99;

subject to line_limit[10,11,1]:
	-141 <= 520644*d[10] - 520644*d[11] <= 141;

subject to line_limit[11,10,1]:
	-141 <= -520644*d[10] + 520644*d[11] <= 141;

subject to line_limit[12,13,1]:
	-99 <= 500300*d[12] - 500300*d[13] <= 99;

subject to line_limit[13,12,1]:
	-99 <= -500300*d[12] + 500300*d[13] <= 99;

subject to line_limit[13,14,1]:
	-76 <= 287340*d[13] - 287340*d[14] <= 76;

subject to line_limit[14,13,1]:
	-76 <= -287340*d[13] + 287340*d[14] <= 76;

subject to generator_limit[1,1]:
	0 <= p[1,1] <= 340;

subject to generator_limit[2,1]:
	0 <= p[2,1] <= 59;

