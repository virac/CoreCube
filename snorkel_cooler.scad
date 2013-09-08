use <utils.scad>

cooler_outer_diameter = 25;
cooler_grip_diameter = 24;

cooler_length = 32;
cooler_fin_count = 10;
cooler_fin_length = 1.2;

cooler_fin_gap = (cooler_length - (cooler_fin_length * cooler_fin_count))/(cooler_fin_count-1);

snorkel_tube_inner_diameter = 5; //guess so far
snorkel_tube_grip = 5;
snorkel_tube_angle = [0,90,0];

snorkel_mount( cooler_outer_diameter, cooler_grip_diameter, cooler_length,
				 cooler_fin_count, cooler_fin_length, cooler_fin_gap,
				 scuba_tube_inner_diameter, scuba_tube_grip, scuba_tube_angle ) {

module snorkel_mount( c_od, c_gd, c_l, c_fc, c_fl, c_fg,
							st_id, st_g, st_a ) {




}