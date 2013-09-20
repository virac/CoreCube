include <utils.scad>

linear_bearing_diameter = 19.2;
linear_bearing_inner_diameter = 10;
linear_bearing_thickness = 29;
linear_bearing_separation = 20;

holder_gap = 10;
holder_thickness = 3;
holder_clasp = 8;

rod_diameter = 10;
rod_separation = 35;
rod_thickness = 5;

grip_offset = 0;
grip_width = 15;
grip_height = m5_nut_diameter + 8; //6.4+8=14.8
grip_thickness = 10;
grip_extra = 15;
grip_hole = 4;

base_mount_thickness = 4;
base_mount_width = 55;
base_mount_height = 45;
hole_offset = 5;

cable_brace_offset = 11;
cable_width = 6;

carriage(linear_bearing_diameter, linear_bearing_inner_diameter, 
			linear_bearing_thickness, linear_bearing_separation,
			rod_diameter, rod_separation, rod_thickness,
			holder_gap, holder_thickness, holder_clasp,
			grip_offset, grip_width, grip_height, grip_thickness, grip_extra, grip_hole,
			base_mount_width, base_mount_height,base_mount_thickness, hole_offset,
			cable_brace_offset);


module carriage( lb_diameter, lb_inner_diameter, lb_thickness, lb_separation,
					r_diameter, r_separation, r_thickness, 
					gap, h_thickness, clasp,
					g_offset, g_width, g_height, g_thickness, g_extra, g_hole,
					b_width, b_height,b_thickness, h_offset, belt_offset ) {
	lb_steps = [[-1,-1,0], [-1, 1,180], [ 1, 1,180], [ 1,-1,0]];
	mount_holes = [[ (b_width/2-h_offset), (b_height/2-h_offset)],
						[ (b_width/2-h_offset),-(b_height/2-h_offset)],
						[-(b_width/2-h_offset), (b_height/2-h_offset)],
						[-(b_width/2-h_offset),-(b_height/2-h_offset)]];
	brace_width = lb_thickness*2+lb_separation;
	brace_height= lb_diameter+r_separation+28;
	brace_holes = [[ (brace_width/2-h_offset), (brace_height/2-h_offset)],
						[ (brace_width/2-h_offset),-(brace_height/2-h_offset)],
						[-(brace_width/2-h_offset), (brace_height/2-h_offset)],
						[-(brace_width/2-h_offset),-(brace_height/2-h_offset)]];
	difference() {
		union() {
			for( i = [0:3] ) {
				translate([lb_steps[i][0]*(lb_thickness+lb_separation)/2,
							  lb_steps[i][1]*r_separation/2,
							  lb_diameter/2+h_thickness/2+0.1]) 
					rotate([0,-90,lb_steps[i][2]]) 
						linear_bearing_holder( lb_diameter, lb_thickness, 
												gap, h_thickness,clasp, false );
			}
			cube([brace_width,brace_height,h_thickness],center=true);
			translate([0,b_height/2-brace_height/2,0]) for( i = [0:3] ) {
				translate([mount_holes[i][0],mount_holes[i][1],h_thickness/2]) {
					cylinder( r = m3_diameter*1.5,h = 2);
				}
			}

			translate([-g_thickness -(b_width/2+(brace_width-b_width)/4),
							0, g_thickness/2-h_thickness/2]) {
				rotate([0,-90,0])  difference() {
					union() {
						cube([g_thickness,brace_height,h_thickness],center=true);
						translate([0,g_offset,g_height/2+h_thickness/2]) 
							difference() {
								hull() {
									cube([g_thickness,g_width + 2*g_extra - g_thickness,g_height],center = true);
		
									translate([0,g_width/2+g_extra-g_thickness/2,-g_height/2])
										cylinder( r = g_thickness/2,h = g_height);
									translate([0,-(g_width/2+g_extra-g_thickness/2),-g_height/2])
										cylinder( r = g_thickness/2,h = g_height);
								}
								union() {
									translate([0,g_width/2+g_extra/2,g_height/2+0.1])
										nut_trap_hole(m3_diameter/2,g_height,g_height*3/4,
															m3_nut_thickness,m3_nut_diameter/2,g_thickness);
									translate([0,-(g_width/2+g_extra/2),g_height/2+0.1])
										nut_trap_hole(m3_diameter/2,g_height,g_height*3/4,
															m3_nut_thickness,m3_nut_diameter/2,g_thickness);
									translate([ g_thickness/2+0.1,0,g_hole/2])rotate([0,90,0])mirror([0,0,1]) {
										cylinder( r = m5_diameter/2, h = 100, $fn = 100 );
										cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness, $fn = 6 );
									}
								}
							}
						//translate([	0, brace_holes[0][1],b_thickness/2])
						//	cylinder( r2 = m3_diameter*1.5, r1 = (brace_width-b_width)/4,h = 1);
						//translate([	0, brace_holes[1][1],b_thickness/2])
						//	cylinder( r2 = m3_diameter*1.5, r1 = (brace_width-b_width)/4,h = 1);
					}
					translate([0,g_offset,g_hole/2-0.1])
						cube([g_thickness+0.1,g_width,h_thickness+g_hole+0.1],center = true);
					through_hole( 0, brace_holes[0][1],m3_diameter/2,100);
					through_hole( 0, brace_holes[1][1],m3_diameter/2,100);
				}
				translate([-g_thickness*3,g_width,-h_thickness]) 
					//cube([g_thickness,g_width + g_extra*2,b_thickness],center = true);
					difference() {
						hull() {
							cube([g_thickness,g_width + g_extra,b_thickness],center = true);
								translate([0,g_width/2+g_extra-g_thickness/2,-b_thickness/2])
								cylinder( r = g_thickness/2,h = b_thickness);
							translate([0,-(g_width/2+g_extra-g_thickness/2),-b_thickness/2])
								cylinder( r = g_thickness/2,h = b_thickness);
						}
						union() {
							for( i = [-3:3] )
							{
								translate([i*(GT2_2mm_spacing()+GT2_2mm_width()),-g_width/2,b_thickness/2]) rotate([-90,0,0])
									GT2_2mm(g_width);
							}
							through_hole( 0, g_width/2+g_extra/2,m3_diameter/2,100);
							through_hole( 0,-(g_width/2+g_extra/2),m3_diameter/2,100);
						}
					}
				translate([-2*g_thickness-g_width/2,-g_width-(g_height - g_hole),-g_thickness/2]) rotate([0,-90,0]) 
					difference() {
						rotate([90,0,90]) cylinder( r = (g_height - g_hole)/2, h = g_width,$fn = 100 );
						rotate([0,0,90]) translate([0,-g_width/2,-(g_height - g_hole+1)/2]) cube( [2*(g_height - g_hole)+1, g_width+1, g_height - g_hole+1], center = true);
						hole(g_width/2,0, m5_diameter/2, 5 );
					}
			}
			translate([g_thickness + (b_width/2+(brace_width-b_width)/4),
							0, g_thickness/2-h_thickness/2]) {
				rotate([0,90,0])  difference() {
					union() {
						cube([g_thickness,brace_height,h_thickness],center=true);
						translate([0,g_offset,g_height/2+h_thickness/2]) 
							difference() {
								hull() {
									cube([g_thickness,g_width + 2*g_extra - g_thickness,g_height],center = true);
		
									translate([0,g_width/2+g_extra-g_thickness/2,-g_height/2])
										cylinder( r = g_thickness/2,h = g_height);
									translate([0,-(g_width/2+g_extra-g_thickness/2),-g_height/2])
										cylinder( r = g_thickness/2,h = g_height);
								}
								union() {
		
									translate([0,g_width/2+g_extra/2,g_height/2+0.1])
										nut_trap_hole(m3_diameter/2,g_height,g_height*3/4,
															m3_nut_thickness,m3_nut_diameter/2,-g_thickness);
									translate([0,-(g_width/2+g_extra/2),g_height/2+0.1])
										nut_trap_hole(m3_diameter/2,g_height,g_height*3/4,
															m3_nut_thickness,m3_nut_diameter/2,-g_thickness);
									translate([-g_thickness/2-0.1,0,g_hole/2])rotate([0,90,0]) {
										cylinder( r = m5_diameter/2, h = 100, $fn = 100 );
										cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness, $fn = 6 );
									}
								}
							}
					//	translate([	0, brace_holes[0][1],b_thickness/2])
					//		cylinder( r2 = m3_diameter*1.5, r1 = (brace_width-b_width)/4,h = 1);
					//	translate([	0, brace_holes[1][1],b_thickness/2])
					//		cylinder( r2 = m3_diameter*1.5, r1 = (brace_width-b_width)/4,h = 1);
					}
					translate([0,g_offset,g_hole/2-0.1])
						cube([g_thickness+0.1,g_width,h_thickness+g_hole+0.1],center = true);
					through_hole( 0, brace_holes[0][1],m3_diameter/2,100);
					through_hole( 0, brace_holes[1][1],m3_diameter/2,100);
				}
				translate([g_thickness*3,g_width,-h_thickness]) 
				//cube([g_thickness,g_width + g_extra*2,b_thickness],center = true);
					difference() {
						hull() {
							cube([g_thickness,g_width + 2*g_extra - g_thickness,b_thickness],center = true);
		
							translate([0,g_width/2+g_extra-g_thickness/2,-b_thickness/2])
								cylinder( r = g_thickness/2,h = b_thickness);
							translate([0,-(g_width/2+g_extra-g_thickness/2),-b_thickness/2])
								cylinder( r = g_thickness/2,h = b_thickness);
						}
						union() {
							for( i = [-3:3] )
							{
								translate([i*(GT2_2mm_spacing()+GT2_2mm_width()),-g_width/2,b_thickness/2]) rotate([-90,0,0])
									GT2_2mm(g_width);
							}
							through_hole( 0, g_width/2+g_extra/2,m3_diameter/2,100);
							through_hole( 0,-(g_width/2+g_extra/2),m3_diameter/2,100);
						}
					}
				translate([g_thickness*4-g_width/2,-g_width-(g_height - g_hole),-g_thickness/2])  rotate([0,-90,0])
					difference() {
						rotate([90,0,90]) cylinder( r = (g_height - g_hole)/2, h = g_width,$fn = 100 );
						rotate([0,0,90]) translate([0,-g_width/2,-(g_height - g_hole+1)/2]) cube( [2*(g_height - g_hole)+1, g_width+1, g_height - g_hole+1], center = true);
						hole(g_width/2,0, m5_diameter/2, 5 );
					}
			}
			for( i = [0:3] ) {
				translate([	brace_holes[i][0], brace_holes[i][1],h_thickness/2])
					cylinder( r = m3_diameter*1.5,h = 2);
			}

		}//union
		union() {
			//drill holes to mount the hot end mount and belt clamps
			translate([0,b_height/2-brace_height/2,h_thickness/2]) for( i = [0:3] ) {
				through_hole( mount_holes[i][0], mount_holes[i][1],m3_diameter/2,100);
				hole(mount_holes[i][0], mount_holes[i][1], m3_nut_diameter/2, 3,6);
			}
				
			translate([0,0,h_thickness/2]) for( i = [0:3] ) {
				through_hole( brace_holes[i][0], brace_holes[i][1],m3_diameter/2,100);
				hole(	brace_holes[i][0], brace_holes[i][1], m3_nut_diameter/2, 3,6);
			}
		}
	}//difference
}
function GT2_2mm_depth() = 0.764;
function GT2_2mm_width() = 1.494; //width of the tooth
function GT2_2mm_spacing() = 0.508; //ammount of space on inbetween 2 teeth
module GT2_2mm(h)
{
	linear_extrude(height=h) polygon([[0.747183,-0.5],[0.747183,0],[0.647876,0.037218],[0.598311,0.130528],[0.578556,0.238423],[0.547158,0.343077],[0.504649,0.443762],[0.451556,0.53975],[0.358229,0.636924],[0.2484,0.707276],[0.127259,0.750044],[0,0.76447],[-0.127259,0.750044],[-0.2484,0.707276],[-0.358229,0.636924],[-0.451556,0.53975],[-0.504797,0.443762],[-0.547291,0.343077],[-0.578605,0.238423],[-0.598311,0.130528],[-0.648009,0.037218],[-0.747183,0],[-0.747183,-0.5]]);
}