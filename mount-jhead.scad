include <utils.scad>


// Extruder
//		1 = MG plus jhead
//		2 = E3D-v5 All metal
extruder = 2;

micro_dia = 9.1;
smaller_dia = 12.1;
larger_dia = 16.1;
base_mount_width = 55;
base_mount_height = 45;
base_mount_thickness = 4;

linear_bearing_diameter = 19.2;
linear_bearing_inner_diameter = 10;
linear_bearing_thickness = 29;
linear_bearing_separation = 20;
rod_separation = 35;

jhead_mount_width = 30;
jhead_mount_height = 18;
jhead_mount_thickness = 16;
jhead_mount_vertical_offset = -10;

slot_style = false;
filament_size = 17.5;//m5_tap_dia;
hole_offset = 5;
added_cap_width = 3;

grip_offset = 0;
grip_width = 10;
grip_height = m5_nut_diameter + 8; //6.4+8=14.8
grip_thickness = 8;
grip_extra = 10;
grip_hole = 4;

jhead_body_height = [5,9.4,11.6,27];
jhead_body_size = larger_dia;
jhead_body_dia = [larger_dia,smaller_dia,larger_dia,smaller_dia];
e3d_body_height = [3.8,9.5,12.4,15];
e3d_body_size = larger_dia;
e3d_body_dia = [larger_dia,smaller_dia,larger_dia,micro_dia];

if( extruder == 1 ) {
	mount( base_mount_width, base_mount_height, base_mount_thickness, filament_size, slot_style,
			linear_bearing_diameter, linear_bearing_inner_diameter, 
			linear_bearing_thickness, linear_bearing_separation, rod_separation,
			jhead_mount_width, jhead_mount_height, jhead_mount_thickness, jhead_mount_vertical_offset,
			grip_offset, grip_width, grip_height, grip_thickness, grip_extra, grip_hole,
			jhead_body_dia, jhead_body_height, jhead_body_size, hole_offset, added_cap_width );
}
if( extruder == 2 ) {
	mount( base_mount_width, base_mount_height, base_mount_thickness, filament_size, slot_style,
			linear_bearing_diameter, linear_bearing_inner_diameter, 
			linear_bearing_thickness, linear_bearing_separation, rod_separation,
			jhead_mount_width, jhead_mount_height, jhead_mount_thickness, jhead_mount_vertical_offset,
			grip_offset, grip_width, grip_height, grip_thickness, grip_extra, grip_hole,
			e3d_body_dia, e3d_body_height, e3d_body_size, hole_offset, added_cap_width );
}


module mount( b_width, b_height, b_thickness, f_size, s_style,
					lb_diameter, lb_inner_diameter, lb_thickness, lb_separation, r_separation,
					e_width, e_height, e_thickness, e_vert_offset,
					g_offset, g_width, g_height, g_thickness, g_extra, g_hole,
					body_dia, body_height, body_size, h_offset,c_width ) {
	mount_holes = [[ (b_width/2-h_offset), (b_height/2-h_offset)],
						[ (b_width/2-h_offset),-(b_height/2-h_offset)],
						[-(b_width/2-h_offset), (b_height/2-h_offset)],
						[-(b_width/2-h_offset),-(b_height/2-h_offset)]];
	brace_width = lb_thickness*2+lb_separation;
	brace_height= lb_diameter+r_separation+28;
	brace_holes = [[ (brace_width/2-h_offset), (brace_height/2-h_offset)],
						[ (brace_width/2-h_offset),-(brace_height/2-h_offset)],
						[-(brace_width/2-h_offset), (brace_height/2-h_offset)],
						[-(brace_width/2-h_offset),-(brace_height/2-h_offset)]];
	box_thickness = max(e_thickness,f_size+2);
	union() {
		difference() {
			union() { //add section
				translate([0,0,b_thickness/2])
					cube([b_width,b_height,b_thickness],center=true);

				translate([0,e_vert_offset,b_thickness+box_thickness/2])
						cube([e_width,e_height,box_thickness],center=true);
				for( i = [0:3] ) {
					translate([mount_holes[i][0],mount_holes[i][1],b_thickness])
						cylinder( r = m3_diameter*1.5,h = 1);
				}
			}//union add section
			union() {//removal section
				translate([0,e_vert_offset+e_height/2+.1,b_thickness+box_thickness/2]) rotate([90,0,0]) {
					jhead_hull(body_dia, body_height, f_size, b_thickness, [0,8,0] );
					if( slot_style == false ) {
						translate( [-body_dia[0]/2-c_width/2,0,4] )
							cube([body_size+c_width,body_size,body_height[3]]);
					}
				}
				if( slot_style == false ) translate( [0,e_vert_offset+e_height/2,0]) { 
					//nut traps
					translate([-(e_width/4+(body_size+c_width)/4),
									-(body_height[0]+body_height[1])/2-b_thickness,
									 b_thickness+box_thickness+0.1])
						nut_trap_hole(m3_diameter/2,box_thickness,box_thickness,
											m3_nut_thickness,m3_nut_diameter/2,-5);
					translate([ (e_width/4+(body_size+c_width)/4),
									-(body_height[0]+body_height[1])/2-b_thickness,
									 b_thickness+box_thickness+0.1])
						nut_trap_hole(m3_diameter/2,box_thickness,box_thickness,
											m3_nut_thickness,m3_nut_diameter/2,5);
					//end nut traps
				}
				for( i = [0:3] ) {
					through_hole( mount_holes[i][0], mount_holes[i][1],m3_diameter/2,100);
				}

			}// union removal section
		}//end difference
		if( s_style == false ) {
			translate([0,b_width,2*b_thickness+box_thickness]) rotate([0,180,0])
			{
				difference() {
					union() {
						translate([0,e_vert_offset,1.5*b_thickness+box_thickness])
							cube([e_width*1.05,e_height,b_thickness],center=true);
						intersection() {
							translate([0,e_vert_offset,b_thickness+box_thickness/2])
								cube([e_width,e_height,box_thickness],center=true);
							intersection() {
							translate([0,e_vert_offset+e_height/2+0.1,b_thickness+box_thickness/2-0.1])
								rotate([90,0,0])
									difference() {
										union() {
											jhead_hull(body_dia, body_height, f_size, b_thickness, [0,0,0] );
											translate( [-body_dia[0]/2-c_width/2,0,4] )
												cube([body_dia[0]+c_width,body_dia[0],body_height[3]]);
										} //union
										jhead_hull(body_dia, body_height, f_size, b_thickness );
									}//difference
			
							translate([0,e_vert_offset+e_height/2+0.1,b_thickness+box_thickness/2-0.1])
								rotate([90,0,0])
									translate( [-body_dia[0]/2-c_width/2,0,4] )
									cube([body_dia[0]+c_width,body_dia[0],body_height[3]]);
							}//intersection
						}//intersection
					}//union
					translate([0,e_vert_offset+e_height/2,box_thickness+b_thickness*2]) mirror([0,0,1]) {
							hole(	-(e_width/4+(body_dia[0]+c_width)/4),
									-(body_height[0]+body_height[1])/2-b_thickness,
									m3_diameter/2,e_thickness );
							hole(  (e_width/4+(body_dia[0]+c_width)/4),
									-(body_height[0]+body_height[1])/2-b_thickness,
									m3_diameter/2,e_thickness );
					}
				}//difference
			}//translate
		}// if s_style

		//wire guide
		translate([e_width/2,-(body_height[0]+body_height[1])/2-b_thickness+m3_nut_diameter/2,b_thickness]) rotate([-90,0,0]) difference() {
			intersection(){ 
				cylinder( r = m5_diameter+2, h = e_height/2 -((body_height[0]+body_height[1])/2-b_thickness+m3_nut_diameter/2)/2, $fn = 100 );
				translate([0,-3,0]) cube([50,10,50],center=true);
			}
			translate([0,0,-0.1]) union() {
				cylinder( r = m5_diameter, h = e_height -((body_height[0]+body_height[1])/2-b_thickness+m3_nut_diameter/2), $fn = 100 );
				translate([0,0,3]) rotate([0,0,8]) cube([1.5,20,e_height -((body_height[0]+body_height[1])/2-b_thickness+m3_nut_diameter/2)], center=true);
			}
		}
		translate([-e_width/2,-(body_height[0]+body_height[1])/2-b_thickness+m3_nut_diameter/2,b_thickness]) rotate([-90,0,0]) difference() {
			intersection(){ 
				cylinder( r = m5_diameter+2, h = e_height/2 -((body_height[0]+body_height[1])/2-b_thickness+m3_nut_diameter/2)/2, $fn = 100 );
				translate([0,-3,0]) cube([50,10,50],center=true);
			}
			translate([0,0,-0.1]) union() {
				cylinder( r = m5_diameter, h = e_height -((body_height[0]+body_height[1])/2-b_thickness+m3_nut_diameter/2), $fn = 100 );
				translate([0,0,3]) rotate([0,0,-8]) cube([1.5,20,e_height -((body_height[0]+body_height[1])/2-b_thickness+m3_nut_diameter/2)], center=true);
			}
		}
	}//union
}


module jhead_hull( body_dia, body_height, f_size, b_thickness, hull_length = [0,0,0] ) {
	cylinder( r = f_size/2, h = b_thickness+0.1, $fn = 100 );
	translate([0,0,b_thickness]) {
		hull() {
			cylinder( r = body_dia[0]/2, h = body_height[0], $fn = 100 );
			translate( hull_length ) cylinder( r = body_dia[0]/2, h = body_height[0], $fn = 100 );
		}
		translate([0,0,body_height[0]]) {
			hull() {
				cylinder( r = body_dia[1]/2, h = body_height[1]-body_height[0], $fn = 100 );
				translate( hull_length ) cylinder( r = body_dia[1]/2, h = body_height[1]-body_height[0], $fn = 100 );
			}
		}
		translate([0,0,body_height[1]]) {
			hull() {
				cylinder( r = body_dia[2]/2, h = body_height[2]-body_height[1], $fn = 100 );
				translate( hull_length ) cylinder( r = body_dia[2]/2, h = body_height[2]-body_height[1], $fn = 100 );
			}
		}
		translate([0,0,body_height[2]]) {
			hull() {
				cylinder( r = body_dia[3]/2, h = body_height[3]-body_height[2], $fn = 100 );
				translate( hull_length ) cylinder( r = body_dia[3]/2, h = body_height[3]-body_height[2], $fn = 100 );
			}
		}
		hull() {
			cylinder( r = body_dia[3]/2, h = body_height[3], $fn = 100 );
			translate( hull_length ) cylinder( r = body_dia[3]/2, h = body_height[3], $fn = 100 );
		}
	}
}