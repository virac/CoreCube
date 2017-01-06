include <utils.scad>

cooler_outer_diameter = 25;
cooler_grip_diameter = 24;

cooler_length = 32;
cooler_thickness = 3;
cooler_fin_count = 10;
cooler_fin_length = 1.2;

cooler_fin_gap = (cooler_length - (cooler_fin_length * cooler_fin_count))/(cooler_fin_count-1);

snorkel_tube_inner_diameter = toMMfromIN(3/8);
snorkel_tube_grip = 15;
snorkel_tube_angle = [0,00,0];//-90
snorkel_cone_size = 9;

snorkel_mount_half( cooler_outer_diameter, cooler_grip_diameter, cooler_length, cooler_thickness,
				 cooler_fin_count, cooler_fin_length, cooler_fin_gap,
				 snorkel_tube_inner_diameter, snorkel_tube_grip,
				 snorkel_tube_angle,snorkel_cone_size, 100 );
/* 
translate([-20,-12.5,-19])
	import("E3D_Hot_end.stl"); 
translate([-25,0,0]) rotate([0,0,180])
	snorkel_mount_half(cooler_outer_diameter, cooler_grip_diameter, cooler_length, cooler_thickness,
				 cooler_fin_count, cooler_fin_length, cooler_fin_gap,
				 snorkel_tube_inner_diameter, snorkel_tube_grip,
				 snorkel_tube_angle,snorkel_cone_size, 100 );*/

/*	cooler_outer_diameter, cooler_grip_diameter, cooler_length, cooler_thickness,
				 cooler_fin_count, cooler_fin_length, cooler_fin_gap,
				 snorkel_tube_inner_diameter, snorkel_tube_grip,
				 snorkel_tube_angle, snorkel_cone_size, 6 );*/

module snorkel_mount_half( c_od, c_gd, c_l, c_t, c_fc, c_fl, c_fg,
							st_id, st_g, st_a, s_cs, mount_faces ) {
	hole_per = 0.8;
	difference() {
		union() {
			translate([0,0,c_l/2])
				cube([c_od/2+c_t,c_od+2*c_t,c_l], center = true );
			rotate([90,90,-90])translate([-c_l/2,-(c_od+2*c_t)/2-5,(c_od/2+c_t)/2-1.5]) difference() {
				union() {
					cube([15,10,3],center = true);
					hull() translate([7.5-3,-5,-3.5]) {
						rotate([0,90,0]) linear_extrude( height = 3) 
							polygon([[-2,10],
										[-2,0],
										[5,10]]);
						translate([5,0,2]) linear_extrude( height = 3) 
							polygon([[-2,10],
										[-2,0],
										[6.5,10]]);
					}
					hull() translate([-7.5,-5,-3.5]) {
						rotate([0,90,0]) linear_extrude( height = 3) 
							polygon([[-2,10],
										[-2,0],
										[5,10]]);
						mirror([1,0,0]) translate([2,0,2]) linear_extrude( height = 3) 
							polygon([[-2,10],
										[-2,0],
										[6.5,10]]);
					}
				}
				translate([0,0,1.6]) rotate([180,0,0])
					cylinder( r = m3_diameter/2, h = 4, $fn = 100 );
			}
			translate([-(c_od/2+c_t)/2,(c_od)/2+c_t/3,c_l/2]) {
					rotate([-90,0,0]) linear_extrude( height = c_t/2-0.1) 
							polygon([[0.1,c_l/2-0.5],
										[-c_t/2,c_l/2-c_t],
										[-c_t/2,-c_l/2+c_t],
										[0.1,-c_l/2+0.5]]);
			}
			rotate([90,90,90]) mirror([0,0,1]) translate([-c_l/2,-(c_od+2*c_t)/2-5,(c_od/2+c_t)/2-1.5]) difference() {
				union() {
					cube([15,10,3],center = true);
					hull() translate([7.5-3,-5,-3.5]) {
						rotate([0,90,0]) linear_extrude( height = 3) 
							polygon([[-2,10],
										[-2,0],
										[5,10]]);
						translate([5,0,2]) linear_extrude( height = 3) 
							polygon([[-2,10],
										[-2,0],
										[6.5,10]]);
					}
					hull() translate([-7.5,-5,-3.5]) {
						rotate([0,90,0]) linear_extrude( height = 3) 
							polygon([[-2,10],
										[-2,0],
										[5,10]]);
						mirror([1,0,0]) translate([2,0,2]) linear_extrude( height = 3) 
							polygon([[-2,10],
										[-2,0],
										[6.5,10]]);
					}
				}
				translate([0,0,1.6]) rotate([180,0,0])
					cylinder( r = m3_diameter/2, h = 4, $fn = 100 );
				rotate([180,0,0])
					cylinder( r = m3_nut_diameter/2, h = 4, $fn = 6 );
			}
			difference() {
				translate([c_od/4+c_t/2,0,c_l/2]) rotate([0,90,0]) {
					cylinder( r1 = c_od/2, r2 = st_id/2,h = s_cs);
			/*		hull() {
						translate([0,0,s_cs]) cylinder(r = st_id/2,h = st_id/2);

						intersection() {
							translate([2,0,st_id/2+s_cs*1.25]) rotate([0,143,0]) translate([0,0,-1])
								cylinder(r2 = st_id/2,r1 = st_id/2*0.85,h = st_g );
							translate([0,0,c_l/4-1])
								cube([c_l,c_od+2*c_t,c_od/2+c_t], center = true );
						}
						translate([0,0,s_cs]) intersection() {
							cylinder(r = st_id/2,h = st_id);
							translate([st_id/2,0,st_id/2]) rotate(st_a) cylinder(r = st_id/2,h = s_cs);
						}
					}
					#translate([0,0,st_id/2+s_cs]) rotate(st_a) cylinder(r = st_id/2,h = st_g );
					translate([-st_g,0,st_id/2+s_cs]) rotate(st_a) cylinder(r1 = st_id/2,r2=0,h = st_id );
					translate([-st_g*0.85+0.5,0,st_id/2+s_cs]) 
						rotate(st_a) cylinder(r2 = st_id/2*1.1,r1 = st_id/2,h = 1 );
					translate([-st_g*0.85-.5,0,st_id/2+s_cs]) rotate(st_a) 
						cylinder(r2 = st_id/2,r1 = st_id/2*1.1,h = 1 );*/
					translate([0,0,st_id/2]) cylinder(r = st_id/2,h = st_g );
					translate([0,0,st_id/2+st_g]) cylinder(r1 = st_id/2,r2=0,h = st_id );
					translate([0,0,st_id/2+st_g-2]) 
						cylinder(r2 = st_id/2*1.2,r1 = st_id/2,h = 1 );
					translate([0,0,st_id/2+st_g-1]) 
						cylinder(r = st_id/2*1.2,h = 0.5 );
					translate([0,0,st_id/2+st_g-0.5]) 
						cylinder(r2 = st_id/2,r1 = st_id/2*1.2,h = 1 );
				}
				union() {
					translate([c_od/4+c_t/2,0,c_l/2]) rotate([0,90,0]) {
						cylinder( r1 = c_od/2*hole_per, r2 = st_id/2*hole_per,h = s_cs*hole_per);
						translate([0,0,s_cs-5]) cylinder(r = st_id/2*hole_per,h = st_id/2+5.1);
						translate([0,0,st_id/2+s_cs]) rotate(st_a) cylinder(r = st_id/2*hole_per,h = st_g+st_id );
						translate([0,0,s_cs]) intersection() {
							cylinder(r = st_id/2*hole_per,h = st_id*2);
							translate([st_id/2,0,st_id/2]) rotate(st_a) cylinder(r = st_id/2*hole_per,h = s_cs*2);
						}
					}
				}
			}
		}
		union() {
			difference() {
				translate([-c_od/4-c_t/2,0,-0.1])
					cylinder( r = c_od/2, h = c_l+0.2 );
				translate([-c_od/4-c_t/2,0,c_l-c_fl]) mirror([0,0,1]) difference() {
					cylinder( r = c_od/2, h = c_fg );
					union() {
						translate([0,0,-0.1]) 
							cylinder( r1 = c_od/2, r2 = c_od/2-0.5, h = c_fg/6+0.2 );
						translate([0,0,c_fg/6])
							cylinder( r = c_od/2-0.5, h = c_fg/8*6 );
						translate([0,0,c_fg/6*5])
							cylinder( r2 = c_od/2, r1 = c_od/2-0.5, h = c_fg/6+0.1 );
					}
				}

				translate([-c_od/4-c_t/2,0,c_fl]) difference() {
					cylinder( r = c_od/2, h = c_fg );
					union() {
						cylinder( r1 = c_od/2, r2 = c_od/2-0.5, h = c_fg/6+0.2 );
						translate([0,0,c_fg/6])
							cylinder( r = c_od/2-0.5, h = c_fg/8*6 );
						translate([0,0,c_fg/6*5])
							cylinder( r2 = c_od/2, r1 = c_od/2-0.5, h = c_fg/6+0.1 );
					}
				}
			}
			translate([c_od/4+c_t/2+0.1,0,c_l/2]) rotate([0,90,0]) rotate([0,180,0]) {
				cylinder( r1 = c_od/2*hole_per,r2 = (c_od/2+c_t)*hole_per,h = c_t+0.1);
				translate([0,0,c_t]) cylinder( r= (c_od/2+c_t)*hole_per,h = c_l);
			}
			translate([-(c_od/2+c_t)/2,-(c_od)/2-c_t/3-c_t/2+0.1,c_l/2]) mirror([1,0,0]) {
					rotate([-90,0,0]) linear_extrude( height = c_t/2-0.1) 
							polygon([[0.1,c_l/2-0.5],
										[-c_t/2,c_l/2-c_t],
										[-c_t/2,-c_l/2+c_t],
										[0.1,-c_l/2+0.5]]);
			}
		}
	}
}
