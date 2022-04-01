%% skrypt przechowuj¹cy wymiary humanoida w postaci wektorowej

% Po³o¿enie kolejnych cz³onów w uk³adach zwi¹zanych z cz³onem
% poprzedzaj¹cym. G³ównym cz³onem s¹ biodra (W).
% r_X_Y - po³o¿enie cz³onu Y w uk³adzie cz³onu poprzedzaj¹cego X
r_W_CH  = [0 0 0]'; 

r_W_RT  = [ 0 -42.8 -100]';
r_RT_RS  = [0 0 -96.283]';
r_RS_RF  = [0 0 -95]';

r_W_LT  = [ 0 42.8 -100]';
r_LT_LS  = [0 0 -96.283]';
r_LS_LF  = [0 0 -95]';

r_CH_RA  = [0 -102 54.25]';
r_RA_RFA = [0 0 -103]';
r_RFA_RH  = [0 0 -90]';

r_CH_LA  = [0 102 54.25]';
r_LA_LFA = [0 0 -103]';
r_LFA_LH  = [0 0 -90]';

% Po³o¿enie œrodków mas cz³onów w uk³adach z nimi zwi¹zanych.
% r_com_X - po³o¿enie œrodka masy cz³onu X w zwi¹zanym z nim uk³adzie
r_com_W   = [0 0 0]';
r_com_CH  = [0 0 0]'; 
r_com_RT  = [0 0 0]';
r_com_LT  = [0 0 0]';
r_com_RS  = [0 0 0]';
r_com_LS  = [0 0 0]';
r_com_RF  = [0 0 0]';
r_com_LF  = [0 0 0]';
r_com_RA  = [0 0 0]';
r_com_LA  = [0 0 0]';
r_com_RFA = [0 0 0]';
r_com_LFA = [0 0 0]';

% Masy poszczególnych cz³onów (gramy)
mCH  = 0; 
mRT  = 0;
mLT  = 0;
mRS  = 0;
mLS  = 0;
mRF  = 0;
mLF  = 0;
mRA  = 0;
mLA  = 0;
mRFA = 0;
mLFA = 0;

% Po³o¿enie punktów charakterystycznych stóp w uk³adach zwi¹zanymi ze
% stopami
r_RF_center     = [0 0 -35]';
r_RF_right_toe  = [63 -51.5 -35]';
r_RF_left_toe   = [63 28.5 -35]';
r_RF_right_heel = [-57 -51.5 -35]';
r_RF_left_heel  = [-57 28.5 -35]';

r_LF_center     = [0 0 -35]';
r_LF_right_toe  = [63 -28.5 -35]';
r_LF_left_toe   = [63 51.5 -35]';
r_LF_right_heel = [-57 -28.5 -35]';
r_LF_left_heel  = [-57 51.5 -35]';
