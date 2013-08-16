include <utils.scad>

linear_bearing_diameter = 19.2;
linear_bearing_inner_diameter = 10;
linear_bearing_thickness = 29;
linear_bearing_separation = 20;

holder_gap = 10;
holder_thickness = 3;
holder_clasp = 8;

rod_diameter = 10;
rod_separation = 35;
rod_thickness = 5;

base_mount_width = 55;
base_mount_height = 45;
hole_offset = 5;


carriage(linear_bearing_diameter, linear_bearing_inner_diameter, 
			linear_bearing_thickness, linear_bearing_separation,
			rod_diameter, rod_separation, rod_thickness,
			holder_gap, holder_thickness, holder_clasp,
			base_mount_width, base_mount_height, hole_offset);




module carriage( lb_diameter, lb_inner_diameter, lb_thickness, lb_separation,
					r_diameter, r_separation, r_thickness, 
					gap, h_thickness,clasp,
					b_width, b_height, h_offset ) {
	lb_steps = [[-1,-1,0], [-1, 1,180], [ 1, 1,180], [ 1,-1,0]];
	mount_holes = [[ (b_width/2-h_offset), (b_height/2-h_offset)],
						[ (b_width/2-h_offset),-(b_height/2-h_offset)],
						[-(b_width/2-h_offset), (b_height/2-h_offset)],
						[-(b_width/2-h_offset),-(b_height/2-h_offset)]];
	difference() {
		union() {
			for( i = [0:3] ) {
				translate([lb_steps[i][0]*(lb_thickness+lb_separation)/2,
							  lb_steps[i][1]*r_separation/2,
							  lb_diameter/2+0.1]) 
					rotate([0,-90,lb_steps[i][2]]) 
						linear_bearing_holder( lb_diameter, lb_thickness, 
												gap, h_thickness,clasp, false );
			}
			translate([0,-7,-h_thickness/2]) scale([lb_thickness*2+lb_separation,lb_diameter+r_separation+13,h_thickness]) cube(1,center=true);
			for( i = [0:3] ) {
				translate([mount_holes[i][0],mount_holes[i][1]-(b_height/2-h_offset),0]) {
					cylinder( r = m3_diameter*1.5,h = 2);
					translate([sign(mount_holes[i][0]) * 11,0,0])
						cylinder( r = m3_diameter*1.5,h = 2);
				}
			}
		}//union
		//drill holes to mount the hot end mount and belt clamps
		translate([0,-(b_height/2-h_offset),0])
			for( i = [0:3] ) {
				through_hole( mount_holes[i][0], mount_holes[i][1],m3_diameter/2,100);
				through_hole( mount_holes[i][0] + sign(mount_holes[i][0]) * 11, mount_holes[i][1],m3_diameter/2,100);
				hole(mount_holes[i][0], mount_holes[i][1], m3_nut_diameter/2, 3,6);
				hole(mount_holes[i][0] + sign(mount_holes[i][0]) * 11, mount_holes[i][1], m3_nut_diameter/2, 3,6);
			}
	}//difference
}