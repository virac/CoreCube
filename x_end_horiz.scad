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

x_limit_switch = true;
y1_limit_switch = false;
y2_limit_switch = false;


assembled = true;

show_lb = true;
show_bottom = true;

translate([-(assembled==true?0:1)*2*rod_separation,0,-holder_thickness])
	x_end_horiz_holder_top( linear_bearing_diameter, linear_bearing_inner_diameter, linear_bearing_thickness, 
			rod_diameter, rod_separation, rod_grip, rod_thickness, support_offset,
			holder_gap, holder_thickness, holder_clasp, bearing_diameter, 6);

if ( show_bottom == true ) translate([(assembled==true?0:1)*2*rod_separation,0,(assembled==true?1:0)*(-(linear_bearing_diameter/2+holder_thickness + 1)-rod_diameter/2-holder_thickness)]) rotate([(assembled==true?0:1)*180,0,0])
	x_end_horiz_holder_bottom( linear_bearing_diameter, linear_bearing_inner_diameter, linear_bearing_thickness, 
			rod_diameter, rod_separation, rod_grip, rod_thickness, support_offset,
			holder_gap, holder_thickness, holder_clasp, bearing_diameter, 6);

if ( show_lb == true ) translate([0,1.25*rod_grip * (assembled==true?0:1) ,30*(assembled==true?0:1)]) 
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
			if( x_limit_switch == true ) difference() {
				translate([0,-grip-5,-2]) {
					cube([19.8,10,4],center = true);
					translate([9.9-1.5,-5,-4]) rotate([0,90,0]) linear_extrude( height = 1.5) 
						polygon([[-2,10],
									[-2,0],
									[10,10]]);
					translate([-3/2,-5,-4]) rotate([0,90,0]) linear_extrude( height = 3) 
						polygon([[-2,10],
									[-2,0],
									[10,10]]);
					translate([-9.9,-5,-4]) rotate([0,90,0]) linear_extrude( height = 1.5) 
						polygon([[-2,10],
									[-2,0],
									[10,10]]);
				}
				translate([0,-grip-5,0.1]) { // limit switch mount
					translate([4.5,0,0]) rotate([180,0,0])
						cylinder( r = m2_diameter/2, h = 3.9, $fn = 100 );
					translate([-4.5,0,0]) rotate([180,0,0])
						cylinder( r = m2_diameter/2, h = 3.9, $fn = 100 );
				}
			}

			if( y1_limit_switch == true ) rotate([0,0,90]) difference() {
				translate([-lb_diameter-0.7,-(lb_diameter+separation+r_diameter+thickness*2-h_thickness)/2-5,-2]) {
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
				translate([-lb_diameter-0.7,-(lb_diameter+separation+r_diameter+thickness*2-h_thickness)/2-5,0.1]) {
					translate([4.5,0,0]) rotate([180,0,0])
						cylinder( r = m2_diameter/2, h = 3.9, $fn = 100 );
					translate([-4.5,0,0]) rotate([180,0,0])
						cylinder( r = m2_diameter/2, h = 3.9, $fn = 100 );
				}
			}

			if( y2_limit_switch == true ) rotate([0,0,-90]) difference() {
				translate([lb_diameter+0.7,-(lb_diameter+separation+r_diameter+thickness*2-h_thickness)/2-5,-2]) {
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
				translate([lb_diameter+0.7,-(lb_diameter+separation+r_diameter+thickness*2-h_thickness)/2-5,0.1]) {
					translate([4.5,0,0]) rotate([180,0,0])
						cylinder( r = m2_diameter/2, h = 3.9, $fn = 100 );
					translate([-4.5,0,0]) rotate([180,0,0])
						cylinder( r = m2_diameter/2, h = 3.9, $fn = 100 );
				}
			}
		}// union
		union() { //sub area
			translate([0,0,-(lb_diameter/2+h_thickness + 1)-r_diameter/2]) { // rods
				translate([separation/2,0,0]) rotate([90,0,0])
					cylinder(r= r_diameter/2, h = grip+0.1 );
				translate([-separation/2,0,0]) rotate([90,0,0])
					cylinder(r= r_diameter/2, h = grip+0.1 );
			}
			translate([0,0,h_thickness]) rotate([0,90,0]){ //cut out for the linear bearing 
				cylinder( r = lb_diameter/2+h_thickness + 1, h = lb_thickness*2+s_offset*4, center= true, $fn = 100 );
				cylinder( r = lb_diameter/2 + 1, h = (lb_thickness*2+s_offset)*2, center= true, $fn = 100 );
			}
			translate([0,-grip-5,0.1]) { // limit switch mount
				translate([4.5,0,0]) rotate([180,0,0])
					cylinder( r = m2_diameter/2, h = 3.9, $fn = 100 );
				translate([-4.5,0,0]) rotate([180,0,0])
					cylinder( r = m2_diameter/2, h = 3.9, $fn = 100 );
			}
			translate([0,-lb_thickness+3.8,0.1]) { //linear bearing mount
				translate([5.4,0,0]) rotate([0,0,90])
					nut_trap_hole(m3_diameter/2,h_thickness*8,h_thickness*5,
												m3_nut_thickness,m3_nut_diameter/2,-5-h_thickness);
				translate([-5.4,0,0]) rotate([0,0,90])
					nut_trap_hole(m3_diameter/2,h_thickness*8,h_thickness*5,
												m3_nut_thickness,m3_nut_diameter/2,-5-h_thickness);
			}
//-lb_thickness/2+r_diameter/2+r_thickness =-29/2+10/2+5
			translate([0,-lb_thickness-1.1,-thickness]) { // linear bearing tab slots
				translate([9.9,0,0])
					cube([h_thickness,3*thickness/2+0.1,thickness+0.1]);
				translate([-9.9-h_thickness,0,0])
					cube([h_thickness,3*thickness/2+0.1,thickness+0.1]);
			}

			translate([0,-lb_diameter+1,0]) rotate( [180,0,0] ) { //middle hole
				translate([0,0,-0.1]) 
					cylinder( r = m5_diameter, h = ((lb_diameter/2+h_thickness + 1)+r_diameter/2)/2+0.2, $fn = 40 );
				translate([0,0,((lb_diameter/2+h_thickness + 1)+r_diameter/2)/2])
					cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
			}
			translate(-[0,3,lb_diameter/2+1+m5_diameter]) rotate( [180,0,0] ) {
				rotate([180,0,0]) 
					cylinder( r = m5_diameter, h = lb_diameter/2+1+m5_diameter, $fn = 40 );
				translate([0,0,-0.1])
					cylinder( r = m5_diameter/2, h = 10, $fn = 40 );
			}
			translate([separation/2+r_diameter/2+thickness,0,0]) rotate( [180,0,0] ) {
				translate([0,lb_diameter+2,0]) {
					translate([0,0,-0.1]) 
						cylinder( r = m5_diameter, h = ((lb_diameter/2+h_thickness + 1)+r_diameter/2)/2+0.2, $fn = 40 );
					translate([0,0,((lb_diameter/2+h_thickness + 1)+r_diameter/2)/2])
						cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
				}
				translate([0,3,lb_diameter/2+1+m5_diameter]) {
					rotate([180,0,0]) 
						cylinder( r = m5_diameter, h = lb_diameter/2+1+m5_diameter, $fn = 40 );
					translate([0,0,-0.1])
						cylinder( r = m5_diameter/2, h = 10, $fn = 40 );
				}
			}
			translate([-(separation/2+r_diameter/2+thickness),0,0]) rotate( [180,0,0] ) {
				translate([0,lb_diameter+2,0]) {
					translate([0,0,-0.1]) 
						cylinder( r = m5_diameter, h = ((lb_diameter/2+h_thickness + 1)+r_diameter/2)/2+0.2, $fn = 40 );
					translate([0,0,((lb_diameter/2+h_thickness + 1)+r_diameter/2)/2])
						cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
				}
				translate([0,3,lb_diameter/2+1+m5_diameter]) {
					rotate([180,0,0]) 
						cylinder( r = m5_diameter, h = lb_diameter/2+1+m5_diameter, $fn = 40 );
					translate([0,0,-0.1])
						cylinder( r = m5_diameter/2, h = 10, $fn = 40 );
				}
			}


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

			translate(-[0,0,thickness+r_diameter/2]) {
				translate([0,-lb_diameter+1,-0.1]) { //middle hole
						cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness+0.1, $fn = 6 );
					translate([0,0,m5_nut_thickness])
						cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
				}
				translate([0,-3,-0.1]){
						cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness*2+0.1, $fn = 6 );
					translate([0,0,m5_nut_thickness])
						cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
				}
			}


			translate(-[separation/2+r_diameter/2+thickness,0,thickness+r_diameter/2]) {
				translate([0,-lb_diameter-2,-0.1]) { //middle hole
						cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness+0.1, $fn = 6 );
					translate([0,0,m5_nut_thickness])
						cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
				}
				translate([0,-3,-0.1]){
						cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness*2+0.1, $fn = 6 );
					translate([0,0,m5_nut_thickness])
						cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
				}
			}
			translate(-[-(separation/2+r_diameter/2+thickness),0,thickness+r_diameter/2]) {
				translate([0,-lb_diameter-2,-0.1]) { //middle hole
						cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness+0.1, $fn = 6 );
					translate([0,0,m5_nut_thickness])
						cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
				}
				translate([0,-3,-0.1]){
						cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness*2+0.1, $fn = 6 );
					translate([0,0,m5_nut_thickness])
						cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
				}
			}
		}//union sub area
	}//difference
}

