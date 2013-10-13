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

linear_bearing_center = -2.5; //the linear bearing is centered this amount from the end of the s_rod
dist_from_rod_y = -36.5;
dist_from_rod_x = -12.5;

belt_thickness = 1.75;
linear_bearing_support_structure = false;
support_offset = 1;

x_limit_switch = true;
y1_limit_switch = false;
y2_limit_switch = true;

belt_grab1 = false;
belt_grab2 = true;

assembled = false;

show_lb = true;
show_bottom = true;
show_belt_grab = true;

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

if( show_belt_grab == true ) {
	translate([(assembled==true?0:1)*2*rod_separation,
					(assembled==true?0:1)*-20,
					(assembled==true?1:0)*(-(linear_bearing_diameter/2+holder_thickness + 1)-rod_diameter/2-holder_thickness)]) 
		x_end_horiz_belt_grab( linear_bearing_diameter, linear_bearing_inner_diameter, linear_bearing_thickness, 
				rod_diameter, rod_separation, rod_grip, rod_thickness, support_offset,
				holder_gap, holder_thickness, holder_clasp, bearing_diameter, 6);
}	

module x_end_horiz( lb_diameter, lb_inner_diameter, lb_thickness, 
					r_diameter, r_separation, r_grip, r_thickness, s_offset,
					gap, h_thickness,clasp, b_diameter, bolt_rez ) {


}

module x_end_horiz_holder_top( lb_diameter,lb_inner_diameter, lb_thickness, 
									r_diameter, separation, grip, thickness, s_offset,
									gap, h_thickness,clasp,b_diameter, bolt_rez ) {
	add_additional = false;
	top_width = 2*(m5_diameter*1.5) + separation + r_diameter + thickness*2;
	top_length= grip+ thickness;
	top_height= (lb_diameter/2+h_thickness + 1)+r_diameter/2;
	belt_position = belt_thickness+ b_diameter+dist_from_rod_x;
	translate([0,0,0]) difference() {
		union() {
			translate([0,-top_length/2+thickness,-(top_height)/2]) 
				cube([top_width, top_length, top_height],center = true);
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
				translate([-lb_diameter-0.7,-(top_width)/2-5,-2]) {
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
				translate([-lb_diameter-0.7,-(top_width)/2-5,0.1]) {
					translate([4.5,0,0]) rotate([180,0,0])
						cylinder( r = m2_diameter/2, h = 3.9, $fn = 100 );
					translate([-4.5,0,0]) rotate([180,0,0])
						cylinder( r = m2_diameter/2, h = 3.9, $fn = 100 );
				}
			}

			if( y2_limit_switch == true ) rotate([0,0,-90]) difference() {
				translate([lb_diameter+0.7,-(top_width)/2-5,-2]) {
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
				translate([lb_diameter+0.7,-(top_width)/2-5,0.1]) {
					translate([4.5,0,0]) rotate([180,0,0])
						cylinder( r = m2_diameter/2, h = 3.9, $fn = 100 );
					translate([-4.5,0,0]) rotate([180,0,0])
						cylinder( r = m2_diameter/2, h = 3.9, $fn = 100 );
				}
			}
		}// union
		union() { //sub area
			translate([0,0,-top_height]) { // rods
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
					cylinder( r = m5_diameter, h = (top_height)/2+0.2, $fn = 40 );
				translate([0,0,((lb_diameter/2+h_thickness + 1)+r_diameter/2)/2])
					cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
			}
			translate(-[0,belt_position,lb_diameter/2+1+m5_diameter]) rotate( [180,0,0] ) {
				rotate([180,0,0]) 
					cylinder( r = m5_diameter, h = lb_diameter/2+1+m5_diameter, $fn = 40 );
				translate([0,0,-0.1])
					cylinder( r = m5_diameter/2, h = 30, $fn = 40 );
			}
			translate([separation/2+r_diameter/2+thickness,0,0]) rotate( [180,0,0] ) {
				translate([0,lb_diameter+2,0]) {
					translate([0,0,-0.1]) 
						cylinder( r = m5_diameter, h = (top_height)/2+0.2, $fn = 40 );
					translate([0,0,((lb_diameter/2+h_thickness + 1)+r_diameter/2)/2])
						cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
				}
				translate([0,belt_position,lb_diameter/2+1+m5_diameter]) {
					rotate([180,0,0]) 
						cylinder( r = m5_diameter, h = lb_diameter/2+1+m5_diameter, $fn = 40 );
					translate([0,0,-0.1])
						cylinder( r = m5_diameter/2, h = 10, $fn = 40 );
				}
			}
			translate([-(separation/2+r_diameter/2+thickness),0,0]) rotate( [180,0,0] ) {
				translate([0,lb_diameter+2,0]) {
					translate([0,0,-0.1]) 
						cylinder( r = m5_diameter, h = (top_height)/2+0.2, $fn = 40 );
					translate([0,0,((lb_diameter/2+h_thickness + 1)+r_diameter/2)/2])
						cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
				}
				translate([0,belt_position,lb_diameter/2+1+m5_diameter]) {
					rotate([180,0,0]) 
						cylinder( r = m5_diameter, h = lb_diameter/2+1+m5_diameter, $fn = 40 );
					translate([0,0,-0.1])
						cylinder( r = m5_diameter/2, h = 30, $fn = 40 );
				}
			}


		}//union sub area
	}//difference
}
module x_end_horiz_belt_grab(lb_diameter,lb_inner_diameter, lb_thickness, 
									r_diameter, separation, grip, thickness, s_offset,
									gap, h_thickness,clasp,b_diameter, bolt_rez ) {
	bottom_width = 2*(m5_diameter*1.5) + separation + r_diameter + thickness*2;
	bottom_length= grip+ thickness;
	bottom_height= thickness+r_diameter/2;
	top_height= (lb_diameter/2+h_thickness + 1)+r_diameter/2;
	belt_position = belt_thickness+ b_diameter+dist_from_rod_x;
	difference() { 
		union() { //add area
			rotate([90,0,-90]) 
				translate([	belt_position,
							dist_from_rod_y+top_height+h_thickness-bearing_thickness+2.4,
							(bottom_width/2-0.1+bearing_diameter/2+3)/2])
					cube([bearing_diameter,thickness*5,(bottom_width/2-(bearing_diameter/2+3))],center = true );
	
			rotate([90,0,-90]) 
				translate([	belt_position,
								dist_from_rod_y+top_height+h_thickness,
								bottom_width/2-0.1]) mirror([0,1,0])
					belt_bearing_support_side( bottom_height-1.325,
													bearing_diameter/2 +3,
													bearing_inner_diameter ,8, 0,[true,false]  );
			rotate([90,0,-90]) 
				translate([	belt_position,
								dist_from_rod_y+top_height+h_thickness,
								bearing_diameter/2+3]) mirror([0,1,0])rotate([0,180,0])
					belt_bearing_support_side( bottom_height-1.325,
													bearing_diameter/2 +3,
													bearing_inner_diameter ,8, 0,[true,false] );
			translate(-[separation/2+r_diameter/2+thickness,belt_position,0.1+bottom_height])
				cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness*2+0.1, $fn = 6 );
		}//union add area
		union() {//sub area
			
			translate(-[separation/2+r_diameter/2+thickness,
							belt_position,
							-(dist_from_rod_y+top_height+h_thickness-bearing_thickness)]) {
				rotate([180,0,0]) 
					cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness*4+0.1, $fn = 6 );
				translate([0,0,-20])
					cylinder( r = m5_diameter/2, h = 60, $fn = 40 );
			}
		}//union sub area
	}
}
module x_end_horiz_holder_bottom(lb_diameter,lb_inner_diameter, lb_thickness, 
									r_diameter, separation, grip, thickness, s_offset,
									gap, h_thickness,clasp,b_diameter, bolt_rez ) {
	bottom_width = 2*(m5_diameter*1.5) + separation + r_diameter + thickness*2;
	bottom_length= grip+ thickness;
	bottom_height= thickness+r_diameter/2;
	top_height= (lb_diameter/2+h_thickness + 1)+r_diameter/2;
	belt_position = belt_thickness+ b_diameter+dist_from_rod_x;

	translate([0,0,0]) difference() {
		union() {			
			translate([0,-bottom_length/2+thickness,-bottom_height/2]) 
				cube([bottom_width, bottom_length, bottom_height],center = true);
			if( belt_grab1 == true ) {
				rotate([90,0,-90]) 
					translate([	belt_position,
									dist_from_rod_y+top_height+h_thickness,
									-bottom_width/2-0.1]) mirror([0,1,0]) rotate([0,180,0])
						belt_bearing_support_side( bottom_height-(15-bearing_thickness)/2-0.225,
														bearing_diameter/2 +3,
														bearing_inner_diameter ,8, 0,[false,true] );
			}
			if( belt_grab2 == true ) {
				rotate([90,0,-90]) 
					translate([	belt_position,
									dist_from_rod_y+top_height+h_thickness,
									bottom_width/2-0.1]) mirror([0,1,0])
						belt_bearing_support_side( bottom_height-(15-bearing_thickness)/2-0.225,
														bearing_diameter/2 +3,
														bearing_inner_diameter ,8, thickness/2.2,[false,true] );
			}
		}// union
		union() { //sub area
			translate([separation/2,0,0]) rotate([90,0,0])
				cylinder(r= r_diameter/2, h = grip+0.1 );
			translate([-separation/2,0,0]) rotate([90,0,0])
				cylinder(r= r_diameter/2, h = grip+0.1 );

			translate(-[0,0,bottom_height]) {
				translate([0,-lb_diameter+1,-0.1]) { //middle hole
					cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness+0.1, $fn = 6 );
					translate([0,0,m5_nut_thickness])
						cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
				}
				translate([0,-belt_position,-0.1]){
					cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness*2+0.1, $fn = 6 );
					translate([0,0,m5_nut_thickness])
						cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
				}
			}

			translate(-[separation/2+r_diameter/2+thickness,0,bottom_height]) {
				translate([0,-lb_diameter-2,-0.1]) {
					cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness+0.1, $fn = 6 );
					translate([0,0,m5_nut_thickness])
						cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
				}
				translate([0,-belt_position,-0.1]){
					cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness*2+0.1, $fn = 6 );
					translate([0,0,m5_nut_thickness])
						cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
				}
			}
			translate(-[-(separation/2+r_diameter/2+thickness),0,bottom_height]) {
				translate([0,-lb_diameter-2,-0.1]) {
					cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness+0.1, $fn = 6 );
					translate([0,0,m5_nut_thickness])
						cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
				}
				translate([0,-belt_position,-0.1]){
					cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness*2+0.1, $fn = 6 );
					translate([0,0,m5_nut_thickness])
						cylinder( r = m5_diameter/2, h = 20, $fn = 40 );
				}
			}
		}//union sub area
	}//difference
}





module belt_bearing_support_side( thickness, height,additional_height, width, back, show_side = [true,true] ) {
show_bearing = false;
	translate([width/2,-7.5,0]) difference() {
		union() {
			if( show_side[1] == true ) {
				if( back > 0 ) difference() {
					rotate([0,90,0]) mirror([0,0,1]) linear_extrude(height = width)
						polygon([[0,-thickness], 
									[0,-thickness-back],
									[-height,-thickness] ] );
						
					rotate([90,0,0])translate([-width/2,height,0]) hole( 0,0,bearing_inner_diameter/1.01,100);
				}
	
				hull(){
					translate([-width/2,-thickness/2,(height+additional_height)/2]) 
						cube( [width,thickness,height+additional_height], center= true );
					translate([-width/2,-thickness/2,(height-additional_height)/2-0.1]) 
						cube( [width*1.75,thickness,height-additional_height], center= true );
	
					rotate([90,0,0]) translate([-width/2,height,thickness]) rotate([0,180,0])
						cylinder( h = (15-bearing_thickness)/2, r = width*3/4);
	
					rotate([90,0,0]) translate([-width/2,height,-(15-bearing_thickness)/2]) 
						cylinder( h = (15-bearing_thickness)/2, r = width/2);
	
					rotate([0,90,180]) translate([0,thickness,0]) linear_extrude(height = width)
						polygon([[0,-thickness], 
										[-height,-thickness-(15-bearing_thickness)/2],
										[-height-additional_height,-thickness] ] );
				}
				rotate([0,90,180]) translate([0.1,thickness,0]) linear_extrude(height = width)
						polygon([[0,-thickness], 
									[0,-thickness-(15-bearing_thickness)/2],
									[(-height-additional_height)/2,-thickness] ] );
			}
			if( show_side[0] == true ) {
				difference(){
					hull() {
						translate([-width/2,15+thickness/2,(height+additional_height)/2]) 
							scale([8,thickness,height+additional_height]) 
								cube( 1, center= true );
	
						rotate([90,0,0]) mirror([0,0,1]) translate([-width/2,height,(15+bearing_thickness)/2]) 
							cylinder( h = (15-bearing_thickness)/2, r = width/2);
	
						rotate([0,90,0]) mirror([0,0,1]) translate([0,thickness+(15+bearing_thickness)/2,0]) 
							linear_extrude(height = width)
							polygon([[0,-thickness+(15-bearing_thickness)/2], 
										[-height-additional_height,-thickness+(15-bearing_thickness)/2],
										[-height,-thickness] ] );
	
						translate([0,15,0]) rotate([0,90,180]) translate([0,0,-3]) 
							linear_extrude(height = width+6)
							polygon([[0,-thickness], 
										[0,-thickness-back-4],
										[-height-additional_height,-thickness-4],
										[-height-additional_height,-thickness] ] );
					
					}
				
					
					rotate([0,90,180]) rotate([90,0,0])translate([-height,width/2,thickness+15]) 
						hull() {
							cylinder(r=4.7,h=3,$fn=6);
							translate([-10,0,0])
								cylinder(r=4.7,h=3,$fn=6);
						}
				}
				rotate([0,90,0]) mirror([0,0,1]) translate([0,thickness+(15+bearing_thickness)/2,0]) 
					linear_extrude(height = width)
					polygon([[0,-thickness+(15-bearing_thickness)/2], 
										[-height-additional_height,-thickness+(15-bearing_thickness)/2],
										[0,-thickness] ] );
	
			}
		}
		rotate( [90,0,0] ) translate([ -width/2, height, 0])
			through_hole( 0,0,bearing_inner_diameter/2,100);
	}
	if( show_bearing == true )
		rotate([90,0,0]) translate([ 0, height, -bearing_thickness/2]) color( [0.4,.4,.8] )
			cylinder( r =bearing_diameter/2,h = bearing_thickness);
}
