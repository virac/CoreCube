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
holder_clasp = 8;

rod_diameter = 10;
rod_separation = 35;
rod_thickness = 5;
rod_grip = 30;

linear_bearing_center = -2.5; //the linear bearing is centered this amount from the end of the s_rod

//7.5
dist_from_rod_y = 36.5;
dist_from_rod_x = -12.5;

belt_thickness = 1.75;

translate ([15,0,0]) 
	x_end( linear_bearing_diameter, linear_bearing_inner_diameter, linear_bearing_thickness, 
			rod_diameter, rod_separation, rod_grip, rod_thickness,
			holder_gap, holder_thickness, holder_clasp, bearing_diameter, 6);

mirror([1,0,0]) translate ([15,0,0]) 
	x_end( linear_bearing_diameter, linear_bearing_inner_diameter, linear_bearing_thickness, 
			rod_diameter, rod_separation, rod_grip, rod_thickness,
			holder_gap, holder_thickness, holder_clasp, bearing_diameter, 100 );


translate([0,-rod_grip,0]) rotate([180,-90,0]){
		translate([0,0,linear_bearing_thickness/2])
		linear_bearing_holder( linear_bearing_diameter, linear_bearing_thickness, 
											holder_gap, holder_thickness,holder_clasp, true );
		mirror([0,0,1]) 
		translate([0,0,linear_bearing_thickness/2])
		linear_bearing_holder( linear_bearing_diameter, linear_bearing_thickness, 
											holder_gap, holder_thickness,holder_clasp, true );
}

module x_end( lb_diameter, lb_inner_diameter, lb_thickness, 
					r_diameter, r_separation, r_grip, r_thickness, 
					gap, h_thickness,clasp, b_diameter, bolt_rez ) {
	union() {
		difference() {
			union() {
				translate([0,(lb_diameter/2+ r_separation + r_diameter + r_thickness*2)/2,-r_diameter/4-r_thickness/2]) 
					x_end_holder( lb_diameter, lb_thickness, 
										r_diameter, r_separation, r_grip, r_thickness,
										gap, h_thickness,clasp,bolt_rez );
			
				translate([-belt_thickness-b_diameter-dist_from_rod_x-linear_bearing_center+r_grip/2,dist_from_rod_y,-0.1]) mirror([0,1,0])
					belt_bearing_support2( r_thickness,
													bearing_diameter/2 + bearing_inner_diameter/2 + 4,
													bearing_inner_diameter ,8 );
			} // union
			translate([-linear_bearing_center+r_grip/2,0,r_thickness/2 + r_diameter/4-4]) 
				cylinder( r = lb_diameter/2+h_thickness + 1, h = lb_thickness, center= true, $fn = 100 );


			translate([-linear_bearing_center+r_grip/2,0,r_thickness/2 + r_diameter/4-.4])
				linear_bearing_holder( linear_bearing_diameter, linear_bearing_thickness, 
											holder_gap, holder_thickness,holder_clasp, true );
		} // difference
//
//		translate([-linear_bearing_center+r_grip/2,0,r_thickness/2 + r_diameter/4-.4])
//		linear_bearing_holder( linear_bearing_diameter, linear_bearing_thickness, 
//											holder_gap, holder_thickness,holder_clasp, true );
	}
}

module x_end_holder( lb_diameter, lb_thickness, r_diameter, separation, grip, thickness, gap, h_thickness,clasp, bolt_rez ) {
	translate([thickness/2,0,0]) difference() {
		union() {
			translate([-dist_from_rod_x/4,lb_diameter/4+h_thickness/2,0]) scale([grip+abs(dist_from_rod_x/2), lb_diameter + separation + r_diameter + thickness*2 - h_thickness,r_diameter/2+thickness]) 
				cube(1,center = true);
			//translate([-linear_bearing_center+grip/2-thickness/2,-(lb_diameter/4+ separation/2 + r_diameter/2 + thickness),0]) rotate([0,0,-linear_bearing_rotate]) hull() {
			//	cylinder( r = lb_diameter/2 + h_thickness, h = r_diameter/2+ thickness, center= true, $fn = 100 );
			//	translate([lb_diameter/2+h_thickness,-(gap/2+h_thickness),-(r_diameter/2+ thickness)/2])
			//		 scale([holder_clasp,gap+h_thickness*2, r_diameter/2+ thickness]) cube( 1 );
			//}

		}// union
	
		//Rods
		translate([0,lb_diameter/4-.5,0]) rotate([0,-90,0]) translate([-r_diameter/2,0,-grip/2-0.1]) union() {
			translate([0,separation/2,0]) cylinder( r = r_diameter/2, h = grip*2, $fn = 100 );
			translate([0,-separation/2,0]) cylinder( r = r_diameter/2, h = grip*2, $fn = 100 );
		}

		//bearing holder cutout
		/*translate([-linear_bearing_center+grip/2-thickness/2,-(lb_diameter/4+separation/2 + r_diameter/2 + thickness),0]) rotate([0,0,-linear_bearing_rotate]) union() {
				translate([0,0,-r_diameter/4]) cylinder( r = lb_diameter/2, h = r_diameter/2+0.1, center= true, $fn = 100 );
				translate([0,0,r_diameter/4]) cylinder( r = lb_diameter/2, h = thickness+0.1, center= true, $fn = 100 );
				translate([lb_diameter/2-10,-gap/2,-lb_thickness/2-1]) scale([lb_diameter+10,gap, lb_thickness+2]) cube( 1 );
		}*/
		//Linear Bearing Mount Holes
		
		translate([-10.2,-19,0.5]) rotate([90,0,0]) {
#			cylinder( r = m3_diameter/2, h = thickness*3, $fn = 100 );
			//translate([0,0,thickness*2+0.2]) mirror([0,0,1]) cylinder( r = m5_nut_diameter/2, h = thickness, $fn = bolt_rez );
		}


		//bolt holes
		translate([-6,-24,-thickness-0.1]) {
			cylinder( r = m5_diameter/2, h = thickness*3, $fn = 100 );
			translate([0,0,thickness*2+0.2]) mirror([0,0,1]) cylinder( r = m5_nut_diameter/2, h = thickness, $fn = bolt_rez );
		}

		//middle bolts
		translate([0,4.25,-thickness-0.1]) {
			translate([11,0,0]) {
				cylinder( r = m5_diameter/2, h = thickness*3, $fn = 100 );
				translate([0,0,thickness*2+0.2]) mirror([0,0,1]) cylinder( r = m5_nut_diameter/2, h = thickness, $fn = bolt_rez );
			}
			translate([-6,0,0]) {
				cylinder( r = m5_diameter/2, h = thickness*3, $fn = 100 );
				translate([0,0,thickness*2+0.2]) mirror([0,0,1]) cylinder( r = m5_nut_diameter/2, h = thickness, $fn = bolt_rez );
			}
		}
		//bottom bolts
		translate([0,33.5,-thickness-0.1]) {
			translate([11,0,0]) {
				cylinder( r = m5_diameter/2, h = thickness*3, $fn = 100 );
				translate([0,0,thickness*2+0.2]) mirror([0,0,1]) cylinder( r = m5_nut_diameter/2, h = thickness, $fn = bolt_rez );
			}
			translate([-6,0,0]) {
				cylinder( r = m5_diameter/2, h = thickness*3, $fn = 100 );
				translate([0,0,thickness*2+0.2]) mirror([0,0,1]) cylinder( r = m5_nut_diameter/2, h = thickness, $fn = bolt_rez );
			}
		}
	}
}







module belt_bearing_support2( thickness, height,additional_height, width ) {
	translate([width/2,-7.5,0]) difference() {
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
									[0,-thickness-(height+additional_height)*4/6],
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