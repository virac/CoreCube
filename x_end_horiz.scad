use <utils.scad>
include <bolts.scad>

bearing_diameter = 14;
bearing_inner_diameter = 5.2;
bearing_thickness = 10.05;

linear_bearing_diameter = 19.4;
linear_bearing_inner_diameter = 10;
linear_bearing_thickness = 29;
linear_bearing_rotate = 0;

holder_gap = 10;
holder_thickness = 3;
holder_clasp = 7;

rod_diameter = 10;
rod_separation = 35;
rod_thickness = 5;
rod_grip = 30;

belt_thickness = 1.75;
linear_bearing_support_structure = false;
support_offset = 1;

assembled = true;



translate([0,0,-holder_thickness])
	x_end_horiz( linear_bearing_diameter, linear_bearing_inner_diameter, linear_bearing_thickness, 
			rod_diameter, rod_separation, rod_grip, rod_thickness, support_offset,
			holder_gap, holder_thickness, holder_clasp, bearing_diameter, 6);

translate([0,1.25*rod_grip * (assembled==true?0:1) ,30*(assembled==true?0:1)]) 
rotate([90*(assembled==true?-1:1),-90*(assembled==true?0:1),90*(assembled==true?1:0)])// this proll will need to be changed...
{
	translate([0,0,linear_bearing_thickness/2]) {
		linear_bearing_holder( linear_bearing_diameter, linear_bearing_thickness, rod_diameter, rod_thickness,
										holder_gap, holder_thickness,holder_clasp, true, 0,true, support_offset );
		if( linear_bearing_support_structure == true )
			linear_bearing_holder_support( linear_bearing_diameter, linear_bearing_thickness, 
														holder_gap, holder_thickness,holder_clasp, support_offset );
	}
	mirror([0,0,1]) translate([0,0,linear_bearing_thickness/2]) {
		linear_bearing_holder( linear_bearing_diameter, linear_bearing_thickness,  rod_diameter, rod_thickness,
										holder_gap, holder_thickness,holder_clasp, true, 0,true, support_offset );
		if( linear_bearing_support_structure == true )
			linear_bearing_holder_support( linear_bearing_diameter, linear_bearing_thickness, 
														holder_gap, holder_thickness,holder_clasp, support_offset );
	}
}

module x_end_horiz( lb_diameter, lb_inner_diameter, lb_thickness, 
					r_diameter, r_separation, r_grip, r_thickness, s_offset,
					gap, h_thickness,clasp, b_diameter, bolt_rez ) {
	union() {
		difference() {
			union() {
					x_end_horiz_holder( lb_diameter, lb_thickness, 
										r_diameter, r_separation, r_grip, r_thickness,
										gap, h_thickness,clasp,bolt_rez );
			} // union
			union() {
				translate([0,0,h_thickness]) rotate([0,90,0]){
					cylinder( r = lb_diameter/2+h_thickness + 1, h = lb_thickness*2+s_offset*4, center= true, $fn = 100 );
					cylinder( r = lb_diameter/2 + 1, h = (lb_thickness*2+s_offset)*2, center= true, $fn = 100 );
	}
			}
		} // difference
	}
}


module x_end_horiz_holder( lb_diameter, lb_thickness, r_diameter, separation, grip, thickness, gap, h_thickness,clasp, bolt_rez ) {
	add_additional = false;
	translate([0,0,0]) difference() {
		union() {
			translate([0,-grip/2,-(lb_diameter/2+r_diameter/2+thickness)/2]) 
				cube([lb_diameter + separation + r_diameter + thickness*2 - h_thickness,
						grip,
						lb_diameter/2 + r_diameter/2+thickness],center = true);
			
		}// union
	}
}


