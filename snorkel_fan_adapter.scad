include <utils.scad>
include <fan_holder_v2.scad>

cooler_outer_diameter = 25;
cooler_grip_diameter = 24;

cooler_length = 32;
cooler_thickness = 3;

snorkel_tube_inner_diameter = toMMfromIN(3/8);
snorkel_tube_grip = 15;
snorkel_tube_angle = [0,00,0];//-90
snorkel_cone_size = 9;

snorkel_mount2( cooler_outer_diameter, cooler_grip_diameter, cooler_length, cooler_thickness,
	 snorkel_tube_inner_diameter, snorkel_tube_grip,
	 snorkel_tube_angle,snorkel_cone_size, 100 );

/*
translate([-30,20,0]){
	difference() {
		union(){ 
			cube([20,40,4]);
			hull() {
				translate([0,17,0]) cube([20,6,4]);
				translate([0,23,18]) rotate([90,0,0]) cylinder( r = 6, h =6 );	
			}
		}
		union() {
			translate([0,17.25,18]) rotate([90,0,0]) cylinder( r = 7, h =2.5 );	
			translate([0,21.25,18]) rotate([90,0,0]) cylinder( r = 7, h =2.5 );	
			translate([0,25.25,18]) rotate([90,0,0]) cylinder( r = 7, h =2.5 );	
			translate([0,26,18]) rotate([90,0,0]) cylinder( r = 3, h =15 );	
			translate([10,9,-0.1]) cylinder(r=m5_diameter/2,h = 6);
			translate([10,31,-0.1]) cylinder(r=m5_diameter/2,h = 6);
		}
	}
}
	 */
	 
	 
	 
module snorkel_mount( c_od, c_gd, c_l, c_t, 
							st_id, st_g, st_a, s_cs, mount_faces ) {
							
	_fan_mount(
			fan_size = 40,
			fan_mounting_pitch = 32,
			fan_m_hole_dia = 2.5,
			holder_thickness = 4 );
	translate([0,44,0])
		_fan_mount(
			fan_size = 40,
			fan_mounting_pitch = 32,
			fan_m_hole_dia = 2.5,
			holder_thickness = 4 );	

	snorkel_mount_half( c_od, c_gd, c_l, c_t, 
							st_id, st_g, st_a, s_cs, mount_faces );
	translate([0,44,0]) {
		snorkel_mount_half( c_od, c_gd, c_l, c_t, 
							st_id, st_g, st_a, s_cs, mount_faces );
	}
	translate([0,39,0]) cube([40,6,8]);
	difference() {
		hull() {
			translate([0,39,4]) cube([40,6,4]);
			translate([0,47,18]) rotate([90,0,0]) cylinder( r = 6, h =10 );	
		}
		translate([0,45,18]) rotate([90,0,0]) cylinder( r = 7, h =2 );	
		translate([0,41,18]) rotate([90,0,0]) cylinder( r = 7, h =2 );	
		translate([0,48,18]) rotate([90,0,0]) cylinder( r = 3, h =15 );	
	}
}
module snorkel_mount_half( c_od, c_gd, c_l, c_t, 
							st_id, st_g, st_a, s_cs, mount_faces ) {
	hole_per = 0.8;
	
	difference() {
		hull(){
			translate([0,0,4]) 
				_fan_mount(
					fan_size = 40,
					fan_mounting_pitch = 32,
					fan_m_hole_dia = 2.5,
					holder_thickness = 4 );
		
			translate([16,20,-1]) translate([c_od/4+c_t/2-4,0,c_l/2])// rotate([0,45,0]) translate([-7.5,0,-12])
				cylinder( r = c_od/2,h = 4);
			translate([16,20,-1]) translate([c_od/4+c_t/2-4,0,c_l/2])// rotate([0,90,0]) 
				cylinder( r = c_od/2,h = 4);
		}
		hull(){
			translate([2,2,3.9]) _fan_mount( fan_size = 36, fan_mounting_pitch = 32, fan_m_hole_dia = 2.5, holder_thickness = 4.1 );
		
			translate([16,20,-1]) translate([c_od/4+c_t/2-4,0,c_l/2]) //rotate([0,45,0]) translate([-7.5,0,-12])
				cylinder( r = c_od/1.8*hole_per,h = 4);
			translate([16,20,-1]) translate([c_od/4+c_t/2-4,0,c_l/2]) //rotate([0,90,0]) 
				cylinder( r = c_od/2*hole_per,h = 4.3);
		}
	}
	translate([12,20,1])
	difference() {
		translate([c_od/4+c_t/2,0,c_l/2+2])  {
			cylinder( r1 = c_od/2, r2 = st_id/2,h = s_cs);

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
			translate([c_od/4+c_t/2-0.1,0,c_l/2+1.95])   {
				cylinder( r1 = c_od/1.8*hole_per, r2 = st_id/2*hole_per,h = s_cs*hole_per+0.1);
				translate([0,0,s_cs-5]) cylinder(r = st_id/2*hole_per,h = st_id/2+5.1);
				translate([0,0,st_id/2+s_cs]) rotate(st_a) cylinder(r = st_id/2*hole_per,h = st_g+st_id );
				translate([0,0,s_cs]) intersection() {
					cylinder(r = st_id/2*hole_per,h = st_id*2);
			//		translate([st_id/2,0,st_id/2]) rotate(st_a) cylinder(r = st_id/2*hole_per,h = s_cs*2);
				}
			}
		}
	}
}


module snorkel_mount2( c_od, c_gd, c_l, c_t, 
							st_id, st_g, st_a, s_cs, mount_faces ) {
	w = 17.7 ;
	h = 12.7 ;
	union() {
		translate([w/2,-h/2,0]) difference() {
			cube([w,h,5]);
			translate([c_t/2,c_t/2,-0.1]) cube([w-c_t,h-c_t,5.2]);
		}
		/*translate([0,h+5,0])
			difference() {
				translate([25,25,0]) for( a = [45,135,225,315] ) hull() {
					translate([-25,-25,0]) cube([40,6,8]);
					cylinder( r = 22, h = 5);
					rotate([0,0,a]) translate([0,58/2,0]) cylinder( r = 4, h = 5.2, $fn = 20 );
				}
		//		cube([50,50,4]);
				translate([25,25,-0.1]) {
					cylinder( r = 16.5, h = 15.2);
					for( a = [45,135,225,315] )
						rotate([0,0,a]) translate([0,58/2,0]) cylinder( r = 3/2, h = 10.2, $fn = 20 );
				}
			}*/
			/*_fan_mount(
				fan_size = 40,
				fan_mounting_pitch = 32,
				fan_m_hole_dia = 2.5,
				holder_thickness = 4 );	*/

		translate([w/2,-h/2,0]) 	
			snorkel_mount2_half1( w,h,c_od, c_gd, c_l, c_t, 
								st_id, st_g, st_a, s_cs, mount_faces );
	/*	translate([0,h+5,0]) {
			snorkel_mount2_half2( c_od, c_gd, c_l, c_t, 
								st_id, st_g, st_a, s_cs, mount_faces );}*/
	
		difference() {
			hull() {
				translate([0,h,5]) cube([40,6,3]);
			
				translate([w/2,-h/2,5])cube([w,h,2]);
			}
			
			translate([w/2+c_t/2,-h/2+c_t/2,-0.1])
				cube([w-c_t,h-c_t,10.2]);
		}
		translate([0,h,0]) cube([40,6,8]);
		difference() {
			hull() {
				translate([0,h,4]) cube([40,6,4]);
				translate([0,h+8,18]) rotate([90,0,0]) cylinder( r = 6, h =10 );	
			}
			translate([0,h+6,18]) rotate([90,0,0]) cylinder( r = 9, h =2 );	
			translate([0,h+2,18]) rotate([90,0,0]) cylinder( r = 9, h =2 );	
			translate([0,h+9,18]) rotate([90,0,0]) cylinder( r = 3, h =15 );	
		}
	}
}

module snorkel_mount2_half1( w,h ,c_od, c_gd, c_l, c_t, 
							st_id, st_g, st_a, s_cs, mount_faces ) {
	hole_per = 0.8;
	rad = min(w,h);
	

	translate([w/8,h/2,-st_id-1.75])
	difference() {
		translate([c_od/4+c_t/2,0,c_l/2+2])  {
			hull() {
				translate(-[w/8+c_od/4+c_t/2,h/2,0])
					cube([w,h,2]);
				cylinder( r1 = rad/2, r2 = st_id/2,h = s_cs);
			}

			translate([0,0,st_id/2]) cylinder(r = st_id/2*1.1,h = st_g );
			translate([0,0,st_id/2+st_g]) cylinder(r1 = st_id/2,r2=0,h = st_id );
			translate([0,0,st_id/2+st_g-2]) 
				cylinder(r2 = st_id/2*1.2,r1 = st_id/2,h = 1 );
			translate([0,0,st_id/2+st_g-1]) 
				cylinder(r = st_id/2*1.2,h = 0.5 );
			translate([0,0,st_id/2+st_g-0.5]) 
				cylinder(r2 = st_id/2,r1 = st_id/2*1.2,h = 1 );
		}
		union() {
			translate([c_od/4+c_t/2-0.1,0,c_l/2+1.95])   {
				hull() {
					cylinder( r1 = rad/2*hole_per, r2 = st_id/2*hole_per,h = s_cs*hole_per+0.1);
					translate(-[c_od/4+2.25,h/2.7,00])
						cube([w-c_t,h-c_t,2]);
				}
				translate([0,0,s_cs-5]) cylinder(r = st_id/2*hole_per,h = st_id/2+5.1);
				translate([0,0,st_id/2+s_cs]) rotate(st_a) cylinder(r = st_id/2*hole_per,h = st_g+st_id );
				translate([0,0,s_cs]) intersection() {
					cylinder(r = st_id/2*hole_per,h = st_id*2);
			//		translate([st_id/2,0,st_id/2]) rotate(st_a) cylinder(r = st_id/2*hole_per,h = s_cs*2);
				}
			}
		}
	}
}

module snorkel_mount2_half2( c_od, c_gd, c_l, c_t, 
							st_id, st_g, st_a, s_cs, mount_faces ) {
	hole_per = 0.8;
	
	difference() {
		hull(){
			translate([25,25,4]) 
					cylinder( r = 20, h = 5.2);
			//	_fan_mount( fan_size = 50, fan_mounting_pitch = 32, fan_m_hole_dia = 2.5, holder_thickness = 4 );
		
			translate([21,25,-4]) translate([c_od/4+c_t/2-4,0,c_l/2])// rotate([0,45,0]) translate([-7.5,0,-12])
				cylinder( r = c_od/2,h = 4);
			translate([21,25,-4]) translate([c_od/4+c_t/2-4,0,c_l/2])// rotate([0,90,0]) 
				cylinder( r = c_od/2,h = 4);
		}
		hull(){
			translate([2+c_od,2+c_od,3.9])
				cylinder( r = c_od/2,h = 4);
			translate([25,25,-0.1])
				cylinder( r = 16.5, h = 5.2);
		// _fan_mount( fan_size = 46, fan_mounting_pitch = 32, fan_m_hole_dia = 2.5, holder_thickness = 4.1 );
		
			translate([21,25,-1]) translate([c_od/4+c_t/2-4,0,c_l/2]) //rotate([0,45,0]) translate([-7.5,0,-12])
				cylinder( r = c_od/1.8*hole_per,h = 4.2);
			translate([21,25,-1]) translate([c_od/4+c_t/2-4,0,c_l/2]) //rotate([0,90,0]) 
				cylinder( r = c_od/2*hole_per,h = 4.3);
		}
	}
	translate([17,25,-2])
	difference() {
		translate([c_od/4+c_t/2,0,c_l/2+2])  {
			cylinder( r1 = c_od/2, r2 = st_id/2,h = s_cs);

			translate([0,0,st_id/2]) cylinder(r = st_id/2*1.1,h = st_g );
			translate([0,0,st_id/2+st_g]) cylinder(r1 = st_id/2,r2=0,h = st_id );
			translate([0,0,st_id/2+st_g-2]) 
				cylinder(r2 = st_id/2*1.2,r1 = st_id/2,h = 1 );
			translate([0,0,st_id/2+st_g-1]) 
				cylinder(r = st_id/2*1.2,h = 0.5 );
			translate([0,0,st_id/2+st_g-0.5]) 
				cylinder(r2 = st_id/2,r1 = st_id/2*1.2,h = 1 );
		}
		union() {
			translate([c_od/4+c_t/2-0.1,0,c_l/2+1.95])   {
				cylinder( r1 = c_od/1.65*hole_per, r2 = st_id/2*hole_per,h = s_cs*hole_per+0.1);
				translate([0,0,s_cs-5]) cylinder(r = st_id/2*hole_per,h = st_id/2+5.1);
				translate([0,0,st_id/2+s_cs]) rotate(st_a) cylinder(r = st_id/2*hole_per,h = st_g+st_id );
				translate([0,0,s_cs]) intersection() {
					cylinder(r = st_id/2*hole_per,h = st_id*2);
			//		translate([st_id/2,0,st_id/2]) rotate(st_a) cylinder(r = st_id/2*hole_per,h = s_cs*2);
				}
			}
		}
	}
}