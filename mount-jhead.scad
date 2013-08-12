include <utils.scad>

smaller_dia = 12;
larger_dia = 16;
jhead_body_dia = [larger_dia,smaller_dia,larger_dia,smaller_dia];
jhead_body_height = [5,9.4,11.6,27];
base_mount_width = 50;
base_mount_height = 40;
base_mount_thickness = 4;
jhead_mount_width = 30;
jhead_mount_height = 20;
jhead_mount_thickness = 16;
jhead_mount_vertical_offset = -5;
hole_offset = 5;
added_cap_width = 4;

mount( base_mount_width, base_mount_height, base_mount_thickness,
			jhead_mount_width, jhead_mount_height, jhead_mount_thickness, jhead_mount_vertical_offset,
			jhead_body_dia, jhead_body_height, hole_offset, added_cap_width );


module mount( b_width, b_height, b_thickness,
					e_width, e_height, e_thickness, e_vert_offset,
					body_dia, body_height, h_offset,c_width ) {
	mount_holes = [[ (b_width/2-h_offset), (b_height/2-h_offset)],
						[ (b_width/2-h_offset),-(b_height/2-h_offset)],
						[-(b_width/2-h_offset), (b_height/2-h_offset)],
						[-(b_width/2-h_offset),-(b_height/2-h_offset)]];
	union() {
		difference() {
			union() { //add section
				translate([0,0,b_thickness/2])
					scale([b_width,b_height,b_thickness])
						cube(1,center=true);
				translate([0,e_vert_offset,b_thickness+e_thickness/2])
					scale([e_width,e_height,e_thickness])
						cube(1,center=true);
			}//union add section
			union() {//removal section
				translate([0,e_vert_offset+e_height/2+.1,b_thickness+body_dia[0]/2])
					rotate([90,0,0]) {
						jhead_hull(body_dia, body_height, 2, [0,8,0] );
						translate( [-body_dia[0]/2-c_width/2,0,4] )
							scale([body_dia[0]+c_width,body_dia[0],body_height[0]+body_height[1]+body_height[2]+body_height[3]]) cube(1);
					}
				for( i = [0:3] ) {
					through_hole( mount_holes[i][0], mount_holes[i][1],m5_diameter/2,100);
				
				}
			}// union removal section
		}//difference
		translate([0,b_width,2*b_thickness+e_thickness]) rotate([0,180,0]) {
			translate([0,e_vert_offset,1.5*b_thickness+e_thickness])
				scale([e_width,e_height,b_thickness])
					cube(1,center=true);
			intersection() {
				translate([0,e_vert_offset,b_thickness+e_thickness/2])
					scale([e_width,e_height,e_thickness])
						cube(1,center=true);
				intersection() {
				translate([0,e_vert_offset+e_height/2+.1,b_thickness+body_dia[0]/2])
					rotate([90,0,0])
						difference() {
							union() {
								jhead_hull(body_dia, body_height, 2, [0,8,0] );
								translate( [-body_dia[0]/2-c_width/2,0,4] )
									scale([body_dia[0]+c_width,body_dia[0],body_height[0]+body_height[1]+body_height[2]+body_height[3]]) cube(1);
							} //union
							jhead_hull(body_dia, body_height, 2 );
						}//difference

				translate([0,e_vert_offset+e_height/2+.1,b_thickness+body_dia[0]/2])
					rotate([90,0,0])
						translate( [-body_dia[0]/2-c_width/2,0,4] )
						scale([body_dia[0]+c_width,body_dia[0],body_height[0]+body_height[1]+body_height[2]+body_height[3]]) cube(1);
				}//intersection
			}//intersection
		}//translate
	}//union
}

module jhead_hull( body_dia, body_height, f_size, hull_length = [0,0,0] ) {
	cylinder( r = f_size/2, h = 5, $fn = 100 );
	translate([0,0,4]) {
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
			cylinder( r = body_dia[3]/2, h = body_height[0]+body_height[1]+body_height[2]+body_height[3], $fn = 100 );
			translate( hull_length ) cylinder( r = body_dia[3]/2, h = body_height[0]+body_height[1]+body_height[2]+body_height[3], $fn = 100 );
		}
	}
}