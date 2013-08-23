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
			jhead_body_dia, jhead_body_height, jhead_body_size, hole_offset, added_cap_width );
}
if( extruder == 2 ) {
	mount( base_mount_width, base_mount_height, base_mount_thickness, filament_size, slot_style,
			linear_bearing_diameter, linear_bearing_inner_diameter, 
			linear_bearing_thickness, linear_bearing_separation, rod_separation,
			jhead_mount_width, jhead_mount_height, jhead_mount_thickness, jhead_mount_vertical_offset,
			e3d_body_dia, e3d_body_height, e3d_body_size, hole_offset, added_cap_width );
}


module mount( b_width, b_height, b_thickness, f_size, s_style,
					lb_diameter, lb_inner_diameter, lb_thickness, lb_separation, r_separation,
					e_width, e_height, e_thickness, e_vert_offset,
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
	union() {
		difference() {
			union() { //add section
				translate([0,0,b_thickness/2])
					scale([b_width,b_height,b_thickness])
						cube(1,center=true);


				translate([	-(b_width/2+(brace_width-b_width)/4),
								-b_height/2+brace_height/2,
								 b_thickness/2])
					scale([(brace_width-b_width)/2,brace_height,b_thickness])
						cube(1,center=true);
				translate([	(b_width/2+(brace_width-b_width)/4),
								-b_height/2+brace_height/2,
								 b_thickness/2])
					scale([(brace_width-b_width)/2,brace_height,b_thickness])
						cube(1,center=true);

//lb_thickness*2+lb_separation,lb_diameter+r_separation+28
				translate([0,e_vert_offset,b_thickness+max(e_thickness,f_size+2)/2])
					scale([e_width,e_height,max(e_thickness,f_size+2)])
						cube(1,center=true);
				for( i = [0:3] ) {
					translate([mount_holes[i][0],mount_holes[i][1],b_thickness])
						cylinder( r = m3_diameter,h = 1);
				}

				/*translate([0,-b_height/2+brace_height/2,0]) for( i = [0:3] ) {
					translate([	brace_holes[i][0], brace_holes[i][1],b_thickness])
						cylinder( r = m3_diameter,h = 1);
				}*/
			}//union add section
			union() {//removal section
				translate([0,e_vert_offset+e_height/2+.1,b_thickness+max(body_size,f_size+2)/2]) rotate([90,0,0]) {
					jhead_hull(body_dia, body_height, f_size, b_thickness, [0,8,0] );
					if( slot_style == false ) {
						translate( [-body_dia[0]/2-c_width/2,0,4] )
							scale([body_size+c_width,body_size,body_height[3]]) cube(1);
					}
				}
				if( slot_style == false ) translate( [0,e_vert_offset+e_height/2,0]) { 
					translate([0,0,b_thickness+e_thickness]) mirror([0,0,1]) {
						hole(	-(e_width/4+(body_size+c_width)/4),
								-(body_height[0]+body_height[1])/2-b_thickness,
									m3_diameter/2,e_thickness-m3_nut_thickness-0.1 );
						hole(	 (e_width/4+(body_size+c_width)/4),
								-(body_height[0]+body_height[1])/2-b_thickness,
									m3_diameter/2,e_thickness-m3_nut_thickness-0.1 );
					}
					//nut traps
					translate([	-(e_width/4+(body_dia[0]+c_width)/4),
									-(body_height[0]+body_height[1])/2-b_thickness,
									b_thickness+0.1])
						hull(){
							cylinder( r = m3_nut_diameter/2, h = m3_nut_thickness, $fn = 6 );
							translate([-5,0,0]) cylinder( r = m3_nut_diameter/2, h = m3_nut_thickness, $fn = 6 );
						}
					translate([  (e_width/4+(body_dia[0]+c_width)/4),
									-(body_height[0]+body_height[1])/2-b_thickness,
									b_thickness+0.1])
						hull(){
							cylinder( r = m3_nut_diameter/2, h = m3_nut_thickness, $fn = 6 );
							translate([5,0,0]) cylinder( r = m3_nut_diameter/2, h = m3_nut_thickness, $fn = 6 );
						}
					//end nut traps
				}
				for( i = [0:3] ) {
					through_hole( mount_holes[i][0], mount_holes[i][1],m3_diameter/2,100);
				}
				translate([0,-b_height/2+brace_height/2,0]) for( i = [0:3] ) {
					through_hole( brace_holes[i][0], brace_holes[i][1],m3_diameter/2,100);
				}
			}// union removal section
		}//difference
		if( s_style == false ) {
			translate([0,b_width,2*b_thickness+e_thickness]) rotate([0,180,0])
			{
				difference() {
					union() {
						translate([0,e_vert_offset,1.5*b_thickness+max(e_thickness,f_size+2)])
							scale([e_width*1.05,e_height,b_thickness])
								cube(1,center=true);
						intersection() {
							translate([0,e_vert_offset,b_thickness+max(e_thickness,f_size+2)/2])
								scale([e_width,e_height,max(e_thickness,f_size+2)])
									cube(1,center=true);
							intersection() {
							translate([0,e_vert_offset+e_height/2+0.1,b_thickness+max(body_size,f_size+2)/2-0.1])
								rotate([90,0,0])
									difference() {
										union() {
											jhead_hull(body_dia, body_height, f_size, b_thickness, [0,0,0] );
											translate( [-body_dia[0]/2-c_width/2,0,4] )
												scale([body_dia[0]+c_width,body_dia[0],body_height[3]]) cube(1);
										} //union
										jhead_hull(body_dia, body_height, f_size, b_thickness );
									}//difference
			
							translate([0,e_vert_offset+e_height/2+0.1,b_thickness+max(body_size,f_size+2)/2-0.1])
								rotate([90,0,0])
									translate( [-body_dia[0]/2-c_width/2,0,4] )
									scale([body_dia[0]+c_width,body_dia[0],body_height[3]]) cube(1);
							}//intersection
						}//intersection
					}//union
					translate([0,e_vert_offset+e_height/2,b_thickness*2+e_thickness]) mirror([0,0,1]) {
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