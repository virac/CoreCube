include <utils.scad>

linear_bearing_diameter = 19.2;
linear_bearing_inner_diameter = 10;
linear_bearing_thickness = 29;
linear_bearing_rotate = 0;
linear_bearing_separation = 10;

holder_gap = 10;
holder_thickness = 3;
holder_clasp = 8;

rod_diameter = 10;
rod_separation = 35;
rod_thickness = 5;


carriage(linear_bearing_diameter, linear_bearing_inner_diameter, 
			linear_bearing_thickness, linear_bearing_separation,
			rod_diameter, rod_separation, rod_thickness,
			holder_gap, holder_thickness, holder_clasp);




module carriage( lb_diameter, lb_inner_diameter, lb_thickness, lb_separation,
					r_diameter, r_separation, r_thickness, 
					gap, h_thickness,clasp ) {
	lb_steps = [[-1,-1,0], [-1, 1,180], [ 1, 1,180], [ 1,-1,0]];
	for( i = [0:3] ) {
		translate([lb_steps[i][0]*(lb_thickness+lb_separation)/2,
					  lb_steps[i][1]*r_separation/2,
					  lb_diameter/2+0.1]) 
			rotate([0,-90,lb_steps[i][2]]) 
				linear_bearing_holder( lb_diameter, lb_thickness, 
												gap, h_thickness,clasp, false );
	}
	translate([0,0,-h_thickness/2]) scale([lb_thickness*2+lb_separation,lb_diameter+r_separation,h_thickness]) cube(1,center=true);
}