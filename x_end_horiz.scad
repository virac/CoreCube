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
	x_end_horiz_holder_top( linear_bearing_diameter, linear_bearing_inner_diameter, linear_bearing_thickness, 
			rod_diameter, rod_separation, rod_grip, rod_thickness, support_offset,
			holder_gap, holder_thickness, holder_clasp, bearing_diameter, 6);

translate([0,0,-(linear_bearing_diameter/2+holder_thickness + 1)-rod_diameter/2-holder_thickness])
	x_end_horiz_holder_bottom( linear_bearing_diameter, linear_bearing_inner_diameter, linear_bearing_thickness, 
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
					gap, h_thickness,clasp, b_diameter, bolt_rez );


module x_end_horiz_holder_top( lb_diameter,lb_inner_diameter, lb_thickness, 
									r_diameter, separation, grip, thickness, s_offset,
									gap, h_thickness,clasp,b_diameter, bolt_rez ) {
	add_additional = false;
	translate([0,0,0]) difference() {
		union() {
			translate([0,-grip/2+thickness/2,-((lb_diameter/2+h_thickness + 1)+r_diameter/2)/2]) 
				cube([lb_diameter + separation + r_diameter + thickness*2 - h_thickness,
						grip+ thickness,
						(lb_diameter/2+h_thickness + 1)+r_diameter/2],center = true);
			translate([0,-grip-5,-2]) {
				cube([19.8,10,4],center = true);
				translate([9.9-3,-5,-4]) rotate([0,90,0]) linear_extrude( height = 3) 
					polygon([[-2,10],
								[-2,0],
								[10,10]]);
				translate([-3/2,-5,-4]) rotate([0,90,0]) linear_extrude( height = 3) 
					polygon([[-2,10],
								[-2,0],
								[10,10]]);
				translate([-9.9,-5,-4]) rotate([0,90,0]) linear_extrude( height = 3) 
					polygon([[-2,10],
								[-2,0],
								[10,10]]);
			}
		}// union
		union() { //sub area
			translate([0,0,-(lb_diameter/2+h_thickness + 1)-r_diameter/2]) {
				translate([separation/2,0,0]) rotate([90,0,0])
					cylinder(r= r_diameter/2, h = grip+0.1 );
				translate([-separation/2,0,0]) rotate([90,0,0])
					cylinder(r= r_diameter/2, h = grip+0.1 );
			}
			translate([0,0,h_thickness]) rotate([0,90,0]){
				cylinder( r = lb_diameter/2+h_thickness + 1, h = lb_thickness*2+s_offset*4, center= true, $fn = 100 );
				cylinder( r = lb_diameter/2 + 1, h = (lb_thickness*2+s_offset)*2, center= true, $fn = 100 );
			}
			translate([4.5,-grip-5,0.1]) rotate([180,0,0])
				cylinder( r = m2_diameter/2, h = 3.9, $fn = 100 );
			translate([-4.5,-grip-5,0.1]) rotate([180,0,0])
				cylinder( r = m2_diameter/2, h = 3.9, $fn = 100 );
//-lb_thickness/2+r_diameter/2+r_thickness =-29/2+10/2+5
			translate([9.9,-lb_thickness-1.1,-thickness])
				cube([h_thickness,3*thickness/2+0.1,thickness+0.1]);
			translate([-9.9-h_thickness,-lb_thickness-1.1,-thickness])
				cube([h_thickness,3*thickness/2+0.1,thickness+0.1]);
		}//union sub area
	}//difference
}

module x_end_horiz_holder_bottom(lb_diameter,lb_inner_diameter, lb_thickness, 
									r_diameter, separation, grip, thickness, s_offset,
									gap, h_thickness,clasp,b_diameter, bolt_rez ) {
	translate([0,0,0]) difference() {
		union() {			
			translate([0,-grip/2+thickness/2,-thickness/2 -r_diameter/4]) 
				cube([lb_diameter + separation + r_diameter + thickness*2 - h_thickness,
						grip+ thickness,
						thickness +r_diameter/2],center = true);
		}// union
		union() { //sub area
			translate([separation/2,0,0]) rotate([90,0,0])
				cylinder(r= r_diameter/2, h = grip+0.1 );
			translate([-separation/2,0,0]) rotate([90,0,0])
				cylinder(r= r_diameter/2, h = grip+0.1 );
		}//union sub area
	}//difference
}

