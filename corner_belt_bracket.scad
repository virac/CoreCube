include <utils.scad>


frame_width = 20;
bracket_length = 70;
bracket_thickness = 4;

bearing_diameter = 14;
bearing_inner_diameter = 5.2;
bearing_thickness = 10.05;

cable1_offset = 15;
cable2_offset = 40;

nema_l=71.5; // Stepper total length
nema_x=42;
nema_y=42;
nema_z=47.4;


translate ([frame_width,0,0]) 
	corner_belt_bracket( bracket_thickness,frame_width,bracket_length, 
								[18,frame_width/2,2,0 ], [0,frame_width/2,bearing_inner_diameter+4,0] );
mirror([1,0,0]) translate ([frame_width,0,0]) 
	corner_belt_bracket( bracket_thickness,frame_width,bracket_length, 
								[18,frame_width,  2,0], [0,frame_width/2,bearing_inner_diameter+4,0 ] );










module corner_belt_bracket( thickness, width, length, short_offset = [15,frame_width/2,0,0] , tall_offset = [0,frame_width,bearing_inner_diameter,10] ) {
	union() {
		non_braced_4_hole_L_bracket(width,length,thickness,33);
		belt_bracket_brace(width,length, thickness, short_offset[3], tall_offset[3]);
		translate([29 + tall_offset[0], tall_offset[1],thickness/2]) 
			belt_bearing_support( thickness, bearing_diameter/2+ tall_offset[2], bearing_inner_diameter,8 );
	/*	translate([35-width/2 + short_offset[0], short_offset[1],thickness/2])
			belt_bearing_support( thickness, bearing_diameter/2 + short_offset[2], bearing_inner_diameter ,8 );*/
	}//35-width/2
}

module belt_bracket_brace(width, length, thickness, offset1, offset2) {
		difference() {
			translate( [length-width/2,width/2,-thickness/2]) linear_extrude(height = thickness) {
					polygon([[0,-0.1], 
								[-length+width,-0.1],
								[-length+width, -width+length],
								[sin(60)*(-length+width),cos(10)*( -width+length)],
								[sin(30)*(-length+width),cos(30)*( -width+length)], 
								[sin(20)*(-length+width),cos(40)*( -width+length)], 
								[sin(10)*(-length+width),cos(60)*( -width+length)],
								[sin(5)*(-length+width),cos(70)*( -width+length)]
	//							[-width,(-2*width+length)*3/2],
//								[-width/2/3,-2*width+length]
]);
			}
		/*	translate([70-width/2,width/2,-thickness/2-1]) linear_extrude(height = thickness*2) {
				polygon([[-width-5, 0 + offset1 ], 
							[-width-5, 15 + offset1],  
							[-width-12, 15 + offset1], 
							[-width-12, 0 + offset1] ]);}*/

			translate([70-width/2,width/2,-thickness/2-1]) linear_extrude(height = thickness*2) {
				polygon([[-width-30+11, 0 + offset2], 
							[-width-30+11, 15 + offset2],  
							[-width-30, 15 + offset2], 	
							[-width-30, 0 + offset2] ]);}
			translate([70-width/2,width/2,-thickness/2-1]) linear_extrude(height = thickness*2) {
				polygon([[-width, 0 + offset2], 
							[-width, 15 + offset2],  
							[-width-11, 15 + offset2], 	
							[-width-11, 0 + offset2] ]);}
		}
	
}

module side_brace( thickness, width, length ) {
	union(){
		difference() {
			cube([width, width, thickness]);
			through_hole(width/2,width/2,2.8,10); 
		}

		rotate([90,0,0]) translate([0,0,-thickness])
			linear_extrude(height = thickness) 
				polygon([ [-0.1,thickness],[width,thickness],
						[width,0],[-0.1,-length+thickness]]);

		rotate([90,0,0]) translate([0,0,-width])
			linear_extrude(height = thickness) 
				polygon([ [-0.1,thickness],[width,thickness],
							 [width,0],[-0.1,-length+thickness]]);
	

	}
}

