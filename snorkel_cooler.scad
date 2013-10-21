use <utils.scad>

cooler_outer_diameter = 25;
cooler_grip_diameter = 24;

cooler_length = 32;
cooler_thickness = 3;
cooler_fin_count = 10;
cooler_fin_length = 1.2;

cooler_fin_gap = (cooler_length - (cooler_fin_length * cooler_fin_count))/(cooler_fin_count-1);

snorkel_tube_inner_diameter = toMMfromIN(3/8);
snorkel_tube_grip = 20;
snorkel_tube_angle = [0,-90,0];
snorkel_cone_size = 5;

snorkel_mount_half( cooler_outer_diameter, cooler_grip_diameter, cooler_length, cooler_thickness,
				 cooler_fin_count, cooler_fin_length, cooler_fin_gap,
				 snorkel_tube_inner_diameter, snorkel_tube_grip,
				 snorkel_tube_angle,snorkel_cone_size, 100 );


translate([-cooler_outer_diameter,0,0]) mirror([1,0,0])
	snorkel_mount_half( cooler_outer_diameter, cooler_grip_diameter, cooler_length, cooler_thickness,
				 cooler_fin_count, cooler_fin_length, cooler_fin_gap,
				 snorkel_tube_inner_diameter, snorkel_tube_grip,
				 snorkel_tube_angle, snorkel_cone_size, 6 );


module snorkel_mount_half( c_od, c_gd, c_l, c_t, c_fc, c_fl, c_fg,
							st_id, st_g, st_a, s_cs, mount_faces ) {
	hole_per = 0.8;
	difference() {
		union() {
			translate([0,0,c_l/2])
				cube([c_od/2+c_t,c_od+2*c_t,c_l], center = true );
			difference() {;
				translate([c_od/4+c_t/2,0,c_l/2]) rotate([0,90,0]) {
					cylinder( r1 = c_od/2, r2 = st_id/2,h = s_cs);
					translate([0,0,s_cs]) cylinder(r = st_id/2,h = st_id/2);
					translate([0,0,st_id/2+s_cs]) rotate(st_a) cylinder(r = st_id/2,h = st_g,$fn=30);
					translate([-st_g,0,st_id/2+s_cs]) rotate(st_a) cylinder(r1 = st_id/2,r2=0,h = st_id,$fn=30);
					translate([-st_g*0.85+0.5,0,st_id/2+s_cs]) 
						rotate(st_a) cylinder(r2 = st_id/2*1.1,r1 = st_id/2,h = 1,$fn=30);
					translate([-st_g*0.85-.5,0,st_id/2+s_cs]) rotate(st_a) 
						cylinder(r2 = st_id/2,r1 = st_id/2*1.1,h = 1,$fn=30);
					translate([0,0,s_cs]) intersection() {
						cylinder(r = st_id/2,h = st_id);
						translate([st_id/2,0,st_id/2]) rotate(st_a) cylinder(r = st_id/2,h = s_cs);
					}
				}
				union() {
					translate([c_od/4+c_t/2,0,c_l/2]) rotate([0,90,0]) {
						cylinder( r1 = c_od/2*hole_per, r2 = st_id/2*hole_per,h = s_cs);
						translate([0,0,s_cs-0.1]) cylinder(r = st_id/2*hole_per,h = st_id/2+0.1);
						translate([0,0,st_id/2+s_cs]) rotate(st_a) cylinder(r = st_id/2*hole_per,h = st_g+st_id,$fn=30);
						translate([0,0,s_cs]) intersection() {
							cylinder(r = st_id/2*hole_per,h = st_id);
							translate([st_id/2,0,st_id/2]) rotate(st_a) cylinder(r = st_id/2*hole_per,h = s_cs);
						}
					}
				}
			}
		}
		union() {
			translate([-c_od/4-c_t/2,0,-0.1])
				cylinder( r = c_od/2, h = c_l+0.2 );
			translate([c_od/4+c_t/2+0.1,0,c_l/2]) rotate([0,90,0]) rotate([0,180,0]) {
				cylinder( r1 = c_od/2*hole_per,r2 = (c_od/2+c_t)*hole_per,h = c_t+0.1);
				translate([0,0,c_t]) cylinder( r= (c_od/2+c_t)*hole_per,h = c_l);
			}
		}
	}
}
