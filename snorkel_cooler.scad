use <utils.scad>

cooler_outer_diameter = 25;
cooler_grip_diameter = 24;

cooler_length = 32;
cooler_thickness = 3;
cooler_fin_count = 10;
cooler_fin_length = 1.2;

cooler_fin_gap = (cooler_length - (cooler_fin_length * cooler_fin_count))/(cooler_fin_count-1);

snorkel_tube_inner_diameter = 5; //guess so far
snorkel_tube_grip = 5;
snorkel_tube_angle = [0,90,0];

snorkel_mount_half( cooler_outer_diameter, cooler_grip_diameter, cooler_length, cooler_thickness,
				 cooler_fin_count, cooler_fin_length, cooler_fin_gap,
				 snorkel_tube_inner_diameter, snorkel_tube_grip, snorkel_tube_angle, 100 );


translate([-cooler_outer_diameter,0,0]) mirror([1,0,0])
	snorkel_mount_half( cooler_outer_diameter, cooler_grip_diameter, cooler_length, cooler_thickness,
				 cooler_fin_count, cooler_fin_length, cooler_fin_gap,
				 snorkel_tube_inner_diameter, snorkel_tube_grip, snorkel_tube_angle, 6 );


module snorkel_mount_half( c_od, c_gd, c_l, c_t, c_fc, c_fl, c_fg,
							st_id, st_g, st_a, mount_faces ) {
	difference() {
		translate([0,0,c_l/2])
			cube([c_od/2+c_t,c_od+2*c_t,c_l], center = true );

		union() {
			translate([-c_od/4-c_t/2,0,-0.1])
				cylinder( r = c_od/2, h = c_l+0.2 );
		}
	}
}