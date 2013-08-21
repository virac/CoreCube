
include <Includes/FreeSerif.scad>
include <bolts.scad>

module box(w,h,d) {
	scale ([w,h,d]) cube(1, true);
}

module hexagon(x,y,height, depth) {
	translate([x,y,0]) hexagon(height, depth);
}

module hexagon(height, depth) {
	boxWidth=height/1.75;
		union(){
			box(boxWidth, height, depth);
			rotate([0,0,60]) box(boxWidth, height, depth);
			rotate([0,0,-60]) box(boxWidth, height, depth);
		}
}

module hole(x,y,rad,deep,fn=100) {
	translate([x,y,-0.1]) cylinder(r=rad,h=deep,$fn=fn);
}
module through_hole(x,y,rad,deep,fn=100) {
	translate([x,y,-deep/2-0.1]) cylinder(r=rad,h=deep,$fn=fn);
}

module braced_L_bracket(width, length, thickness) {
	union(){
		non_braced_L_bracket( width,length, thickness );
		translate( [length-width/2,width/2,-thickness/2]) linear_extrude(height = thickness) 
				polygon([ 	[0,0], 
							[-width, 0], 
							[-length+width, -2*width+length], 
							[-length+width, -width+length]]);
	}
}

module non_braced_L_bracket(width, length, thickness) {
	union(){
		translate( [0,length/2-width/2,0]) box( width,length, thickness );
		translate( [length/2-width/2,0,0]) rotate( [0,0,90] ) box( width,length, thickness );
	}
}

module braced_4_hole_L_bracket( width, length, thickness ) {
	difference() {
		braced_L_bracket(width, length, thickness);
		through_hole(0,0,2.8,10);
		through_hole(0,length-width,2.8,10);

		through_hole((length-width)/2,0,2.8,10);
		through_hole(length-width,0,2.8,10);
	}
}

module non_braced_4_hole_L_bracket( width, length, thickness, force_hole = 0 ) {
	difference() {
		non_braced_L_bracket(width, length, thickness);
		through_hole(0,0,2.8,10);
		through_hole(0,length-width,2.8,10);
		if( force_hole == 0 ) {
			through_hole((length-width)/2,0,2.8,10);
		} else {
			through_hole(length-width-force_hole,0,2.8,10);
		}
		through_hole(length-width,0,2.8,10);
	}
}

module braced_5_hole_L_bracket( width, length, thickness ) {
	difference() {
		braced_L_bracket(width, length, thickness);
		through_hole(0,0,2.8,10);
		through_hole(0,length-width,2.8,10);

		through_hole(0,(length-width)/2,2.8,10);

		through_hole((length-width)/2,0,2.8,10);
		through_hole(length-width,0,2.8,10);
	}
}

module non_braced_5_hole_L_bracket( width, length, thickness ) {
	difference() {
		non_braced_L_bracket(width, length, thickness);
		through_hole(0,0,2.8,10);
		through_hole(0,length-width,2.8,10);

		through_hole(0,(length-width)/2,2.8,10);

		through_hole((length-width)/2,0,2.8,10);
		through_hole(length-width,0,2.8,10);
	}
}

module belt_bearing_support( thickness, height,additional_height, width ) {
	difference() {
		union() {
			difference() {
				rotate([0,90,0]) mirror([0,0,1]) linear_extrude(height = width)
					polygon([[0,-thickness], 
								[0,-thickness-(height+additional_height)/1.5],
								[-height,-thickness] ] );
					
				rotate([90,0,0])translate([-width/2,height,0]) hole( 0,0,bearing_inner_diameter/1.01,100);
			}

			hull(){
				translate([-width/2,-thickness/2,(height+additional_height)/2]) 
				scale([width,thickness,height+additional_height]) 	
					cube( 1, center= true );
				translate([-width/2,-thickness/2,(height-additional_height)/2-0.1]) 
				scale([width*1.75,thickness,height-additional_height]) 	
					cube( 1, center= true );

				rotate([90,0,0]) translate([-width/2,height,thickness/2]) 
					cylinder( h = (15-bearing_thickness)/2, r = width*3/4);

				rotate([90,0,0]) translate([-width/2,height,-(15-bearing_thickness)/2]) 
					cylinder( h = (15-bearing_thickness)/2, r = width/2);

				rotate([0,90,180]) translate([0,thickness,0]) linear_extrude(height = width)
					polygon([[0,-thickness], 
									[-height,-thickness-(15-bearing_thickness)/2],
									[-height-additional_height,-thickness] ] );
			}
			rotate([0,90,180]) translate([0,thickness,0]) linear_extrude(height = width)
					polygon([[0,-thickness], 
								[0,-thickness-(15-bearing_thickness)/2],
								[(-height-additional_height)/2,-thickness] ] );

			
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
									[0,-thickness-(height+additional_height)*5/6],
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
		rotate( [90,0,0] ) translate([ -width/2, height, 0])
			through_hole( 0,0,bearing_inner_diameter/2,100);

	//	#	translate([0,15,-.1]) rotate([0,90,180]) translate([0,0,-3]) 
	//						linear_extrude(height = 3)
	//						polygon([[0,0], 
	//									[0,-(height+additional_height)/2],
	//									[-height-0.1,-thickness-4],
	//									[-height-0.1,0] ] );
	}
}


module linear_bearing_holder( lb_diameter, lb_thickness, gap, thickness,clasp, support = false, lb_rotate = 0 ) {
	rotate([0,0,-lb_rotate]) translate([0,0,-0.1]) difference() {
		union() {
			hull() {
				cylinder( r = lb_diameter/2 + thickness, h = lb_thickness, center= true, $fn = 100 );
				translate([lb_diameter/2+thickness,-(gap/2+thickness),-lb_thickness/2]) scale([holder_clasp,gap+thickness*2, lb_thickness]) cube( 1 );


			}
			translate([lb_diameter/2+thickness/2,gap/2+thickness,0]) rotate([-90,0,0]) hull() {
				cylinder( r = m3_diameter*1.5, h = thickness );
				translate([clasp/2,0,0]) {
					scale([m3_diameter*3.3,m3_diameter*6.5,0.1]) cube(1,center=true);
					cylinder( r = m3_diameter*1.5, h = thickness );
				}
			}
			translate([lb_diameter/2+thickness/2,-gap/2-thickness,0]) rotate([90,0,0]) hull() {
				cylinder( r = m3_diameter*1.5, h = thickness );
				translate([clasp/2,0,0]) {
					scale([m3_diameter*3.3,m3_diameter*6.5,0.1]) cube(1,center=true);
					cylinder( r = m3_diameter*1.5, h = thickness );
				}
			}
			if( support == true ) {
				rotate([0,0,linear_bearing_rotate]){
					translate([0,lb_thickness/2-lb_diameter+thickness/1.5,-lb_thickness/2]) rotate([90,0,180])
						linear_extrude(height = thickness*2) 
							polygon([	[lb_thickness/2,lb_thickness],
											[0,lb_thickness],
											[0,0],
											[lb_thickness+1,0],
											[lb_thickness+1,thickness*4]]);
				}
			}// if support
		} //union

		cylinder( r = lb_diameter/2, h = lb_thickness+0.1, center= true, $fn = 100 );

		translate([0,-gap/2,-lb_thickness/2-1]) scale([lb_diameter*2,gap, lb_thickness+2]) cube( 1 );

		
		translate([(lb_diameter+thickness+clasp)/2,lb_diameter/2+thickness,0]) rotate([90,0,0])
			cylinder( r = m3_diameter/2, h = lb_diameter+2*thickness, $fn = 100 );

		translate([(lb_diameter+thickness+clasp)/2,-lb_diameter/2+thickness-2,0]) rotate([90,0,0])
			cylinder( r = m3_nut_diameter/2, h = thickness, $fn = 100 );

		translate([(lb_diameter+thickness+clasp)/2,lb_diameter/2+2,0]) rotate([90,90,0])
			cylinder( r = m3_nut_diameter/2, h = thickness, $fn = 6 );

		
	#	rotate([0,0,linear_bearing_rotate])
//			translate([0,lb_thickness/2-lb_diameter+thickness/2,-lb_thickness/2]) 
			translate([-lb_diameter/2-lb_thickness/2-1,0,-thickness*3]) 
				rotate([90,0,180])
					cylinder( r = m3_diameter/2, h = 3*thickness, center= true, $fn = 100 );
	}//difference
}






// #########################################################

module bearing(id, od, w) {
	difference() {
		union() {
			translate([0,0,0]) color("red") cylinder(w,r=od/2, center = true, $fs=.1);
		}
		union() {
			translate([0,0,0]) cylinder(w+2,r=od/2-1, center = true, $fs=.1);
		}
	}
	difference() {
		union() {
			translate([0,0,0]) color("red") cylinder(w,r=id/2+1, center = true, $fs=.1);
			translate([0,0,0]) color("black") cylinder(w-0.5,r=od/2-1, center = true, $fs=.1);
		}
		union() {
			translate([0,0,0]) cylinder(w+2,r=id/2, center = true, $fs=.1);
		}
	}
}
module nema17() {
// Stepper body size
//nema_x=42;
//nema_y=42;
//nema_z=47.4;
//screw_l=16;
// Stepper body silver end caps z length
body = nema_z/100*50;
cap = nema_z/100*25;

	difference() {
		union() {
			translate([-nema_x/2,-nema_y/2,cap]) color("black") cube([nema_x,nema_y,body]);
			translate([-nema_x/2,-nema_y/2,0]) color("silver") cube([nema_x,nema_y,cap]);
			translate([-nema_x/2,-nema_y/2,cap+body]) color("silver") cube([nema_x,nema_y,cap]);
			translate([0,0,cap*2+body]) color("grey") cylinder(1.7,r=11, $fs=.1);
			translate([0,0,cap*2+body+1.7]) color("silver") cylinder(22.5,r=2.5, $fs=.1);
		}
		union() {
			for(r=[1:4]) {
				rotate([0,0,r*360/4]) translate([15.5,15.5,cap*2+body-5]) cylinder(6,r=1.5, $fs=.1);
			}

		}
	}
	for(r=[1:4]) {
		rotate([0,0,r*360/4]) translate([15.5,15.5,cap*2+body-5]) color("Goldenrod") cylinder(screw_l,r=1.5, $fs=.1);
		// rotate([0,0,r*360/4]) translate([15.5,15.5,cap*2+body-5+screw_l]) color("Goldenrod") cylinder(1.8,r=2.8, $fs=3);
	}
}
