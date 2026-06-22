
p_pre = 10;
v_pre = 1;
v_gas = 2;
v_init_liq = 0.01;
v_init_gas = v_gas - v_init_liq; %gas - initial liquid
gamma = 1.4;

p_gas = p_pre * (v_pre/v_init_gas)^gamma