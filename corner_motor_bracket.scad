include <utils.scad>

show_motor = false;

frame_width = 20;
bracket_length = 70;
bracket_thickness = 4;

nema_l=71.5; // Stepper total length
nema_x=42;
nema_y=42;
nema_z=47.4;
screw_l=30;


for( i = [0,1] )  {
	if( i == 1) {
		mirror([1,0,0]) translate([frame_width*2,0,0])
		corner_motor_bracket( 0 );
	} else {
		//corner_motor_bracket( 0 );
	}
}

module corner_motor_bracket( offset ) {
	union() {
		non_braced_4_hole_L_bracket(frame_width,bracket_length, bracket_thickness);

		motor_brace(frame_width,bracket_length, bracket_thickness,nema_l/3+frame_width/4-frame_width/2-bracket_thickness, offset );

		translate([(bracket_length-frame_width)/2,nema_l/3+frame_width/4+offset,nema_z/2]) rotate([90,0,0])
			nema17_mount();

		if( show_motor == true ) {
			translate([(bracket_length-frame_width)/2,nema_l+frame_width/4,nema_z/2]) rotate([90,0,0]) 
			union() {
				nema17();
				translate([0,0,nema_l-2]) bearing(5, 10, 4);
			}
		}
	}
}
// #########################################################
module nema17_mount() {

	difference () {
		union() {
			translate([0,0,1.7]) cube([nema_x,nema_y,bracket_thickness], center = true);
			translate([0,-3,1.7]) cube([nema_x,nema_y,bracket_thickness], center = true);

			difference() {
				translate([nema_x/2,-nema_y/2-1.5,bracket_thickness-.5]) rotate([0,-90,0]) cube([bracket_thickness*2.5/2,bracket_thickness,bracket_thickness]);
				translate([nema_x/2+1,-nema_y/2-1,bracket_thickness+5]) rotate([0,-90,0]) rotate([0,0,50]) cube([7,7,7]);
			}
			difference() {
				translate([-nema_x/2+bracket_thickness,-nema_y/2-1.5,bracket_thickness-.5]) rotate([0,-90,0]) cube([bracket_thickness*2.5/2,bracket_thickness,bracket_thickness]);
				translate([-nema_x/2+bracket_thickness+1,-nema_y/2-1,bracket_thickness+5]) rotate([0,-90,0]) rotate([0,0,50]) cube([7,7,7]);
			}


			for(r=[1:4]) {
				rotate([0,0,r*360/4]) translate([15.5,15.5,3]) cylinder(2,r1=5.5,r2=4, $fs=.1);
			}

			motor_shaft_brace();

		
		}
		
		union() {

			translate([0,0,2]) cylinder(5,r=13, $fn=50, center = true);	// rev. 3
			translate([0,0,9.8]) cylinder(420,r =5, $fn=50, center = true);	// rev. 3

			for(r=[1:4]) {
				rotate([0,0,r*360/4]) translate([15.5,15.5,-1]) cylinder(40,r=1.75, $fs=.1);
			}
		}
	}
}
module motor_shaft_brace() {
	union() {
		difference() {
			translate([0,-13,21.5]) cube([14,25,5],center=true);
			translate([0,-15,18]) cylinder(7, r = 6, $fs=0.1);
			translate([0,-21,18]) cylinder(7, r = 6, $fs=0.1);
			translate([0,-22,18]) cylinder(7, r = 6, $fs=0.1);
			translate([0,-19.5,21.5]) cube([12,9,6],center=true);
		}
		difference() {
			translate([11,-25.5,19]) rotate([0,-90,0]) cube([18,25,5]);
			translate([12,-22.5,38]) rotate([0,-90,0]) rotate([0,0,32]) cube([18,28,7]);
		}
		difference() {
			translate([-6,-25.5,19]) rotate([0,-90,0]) cube([18,25,5]);
			translate([-5,-22.5,38]) rotate([0,-90,0]) rotate([0,0,32]) cube([18,28,7]);
		}
		difference() {
			union() {
				translate([-10,-17.5,19]) rotate([0,0,45])  cube([15,18,5]);
				translate([-18,-9.5,19]) rotate([-45,0,0]) translate([0,-2,0]) cube([5,28,5]);
				translate([-18,-9.5,22]) rotate([-50,0,0]) translate([0,4.5,0]) cube([5,24,5]);
				translate([-18,1,9]) rotate([-90,0,0]) translate([0,-2,0]) cube([5,10,5]);
			}
			union() {
				translate([-10,-17.5,19])  cube([15,18,5]);
				translate([-5,-.5,19])  rotate([0,0,90]) cube([15,18,6]);
				translate([-10,-24.5,19]) rotate([0,0,45])  cube([5,25,5]);
				translate([-23,-9.5,19]) rotate([-45,0,0]) translate([0,-5,0]) cube([5,28,15]);
			}
		}
		mirror([1,0,0]) difference() {
			union() {
				translate([-10,-17.5,19]) rotate([0,0,45])  cube([15,18,5]);
				translate([-18,-9.5,19]) rotate([-45,0,0]) translate([0,-2,0]) cube([5,28,5]);
				translate([-18,-9.5,22]) rotate([-50,0,0]) translate([0,4.5,0]) cube([5,24,5]);
				translate([-18,1,9]) rotate([-90,0,0]) translate([0,-2,0]) cube([5,10,5]);
			}
			union() {
				translate([-10,-17.5,19])  cube([15,18,5]);
				translate([-5,-.5,19])  rotate([0,0,90]) cube([15,18,6]);
				translate([-10,-24.5,19]) rotate([0,0,45])  cube([5,25,5]);
				translate([-23,-9.5,19]) rotate([-45,0,0]) translate([0,-5,0]) cube([5,28,15]);
			}
		}
	}
}

module motor_brace(width, length, thickness,motor_offset,offset) {
	union(){
		translate( [length-width/2,width/2,-thickness/2]) linear_extrude(height = thickness) 
				polygon([ 	[0,-0.1], 
							[-width, -0.1], 
							[-length+width,-0.1],
							[-length+width,offset],
							[-width, offset], 
							[-width, offset + motor_offset], 
							[-length+width, offset+ motor_offset], 
							[-length+width, -2*width+length], 
							[-length+width, -width+length],
							[-width,(-2*width+length)*3/2],
							[-width/2/3,-2*width+length]]);
	}
}

