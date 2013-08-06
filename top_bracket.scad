include <utils.scad>
$fn = 100;
rod_radius = 5;
frame_width = 20;
bracket_length = 70;
bracket_thickness = 4;

module rod_support_L_bracket(radius, width, length, thickness) {
	difference() {
		union() {
			non_braced_5_hole_L_bracket(width,length,thickness);
			translate( [(length-width)*3/4,0,radius/2+thickness/2]) scale([(length-width)/3.8, width,radius]) cube( 1, center= true);

			translate([0,0,thickness/2]) {
				hole((length-width)/2,0,6.05,radius*1.02);
				hole(length-width,0,6.05,radius*1.02);

				translate([length-width-6.05/2,0,(radius)/2]) scale([6.05,6.05*2,radius])	cube(1,center=true);
				translate([(length-width)/2+6.05/2,0,(radius)/2]) scale([6.05,6.05*2,radius])	cube(1,center=true);
			}

		}

		through_hole((length-width)/2,0,2.8,100);
		through_hole(length-width,0,2.8,100);
		translate( [(length-width)*3/4,0,radius]) rotate([-90,0,0]) translate([0,-thickness/2,-width]) cylinder( r=radius, h = bracket_length );

	}
}

module rod_brace( radius, width, length, thickness ) {
	difference() { 
		union() {
			union() {
				translate([0,0,thickness*3.1/4]) hole(0,0,5.95,thickness);
				translate([5.95/2,0,radius]) scale([5.95,5.95*2,thickness])	cube(1,center=true);
			}
			union() {
				translate([0,0,thickness*3.1/4]) hole(width,0,5.95,thickness);
				translate([width-5.95/2,0,radius]) scale([5.95,5.95*2,thickness])	cube(1,center=true);
			}


			difference() {
				translate( [width/2,0,-radius/2]) rotate([-90,0,0]) translate([0,-5.9,-5.95]) cylinder( r=radius*2, h = 11.9 );
				
				translate([width/2,0,-thickness/2]) box(width,width*2,radius*2);
			}
		}
		through_hole(0,0,2.8,300);
		translate([0,0,thickness/1.9+radius]) hole(0,0,4.9,5);

		through_hole(width,0,2.8,300);
		translate([0,0,thickness/1.9+radius]) hole(width,0,4.9,5);

		translate( [width/2,-width,radius/2]) rotate([-90,0,0]) cylinder( r=radius, h = bracket_length );
	}
}

rod_support_L_bracket(rod_radius,frame_width,bracket_length, bracket_thickness);

translate([(bracket_length-frame_width)/2,bracket_length/2,11.9/2-bracket_thickness/2]) rotate([90,0,0]) rod_brace( rod_radius, (bracket_length-frame_width)/2, frame_width, bracket_thickness);

mirror([1,0,0]) translate([frame_width*1.5,0,0]) {
	rod_support_L_bracket(rod_radius,frame_width,bracket_length, bracket_thickness);

translate([(bracket_length-frame_width)/2,bracket_length/2,11.9/2-bracket_thickness/2]) rotate([90,0,0]) rod_brace( rod_radius, (bracket_length-frame_width)/2, frame_width, bracket_thickness);
}