use <utils.scad>
include <bolts.scad>

linear_bearing_diameter = 19.2;
linear_bearing_inner_diameter = 10;
linear_bearing_thickness = 29;
linear_bearing_separation = 35;

holder_gap = 10;
holder_thickness = 3;
holder_clasp = 8;

rod_diameter = 10;
rod_separation = 50;
rod_thickness = 5;
rod_grip = 30;

grip_offset = 5;
grip_width = 15;
grip_height = m5_nut_diameter + 8; //6.4+8=14.8
grip_thickness = 10;
grip_extra = 9;
grip_hole = 4;

base_mount_thickness = 4;
base_mount_width = 55;
base_mount_height = 45;
hole_offset = 0;

cable_brace_offset = 11;
cable_width = 6;

carriage_horiz(linear_bearing_diameter, linear_bearing_inner_diameter, 
			linear_bearing_thickness, linear_bearing_separation,
			rod_diameter, rod_separation, rod_thickness,
			holder_gap, holder_thickness, holder_clasp,
			grip_offset, grip_width, grip_height, grip_thickness, grip_extra, grip_hole,
			base_mount_width, base_mount_height,base_mount_thickness, hole_offset,
			cable_brace_offset);


translate([linear_bearing_thickness+linear_bearing_separation/2+grip_thickness*2,0,0]) belt_grabber(grip_width, grip_thickness, grip_extra,base_mount_thickness);
translate(-[linear_bearing_thickness+linear_bearing_separation/2+grip_thickness*2,0,0]) belt_grabber(grip_width, grip_thickness, grip_extra,base_mount_thickness);

module carriage_horiz( lb_diameter, lb_inner_diameter, lb_thickness, lb_separation,
					r_diameter, r_separation, r_thickness, 
					gap, h_thickness, clasp,
					g_offset, g_width, g_height, g_thickness, g_extra, g_hole,
					b_width, b_height,b_thickness, h_offset, belt_offset ) {
show_grabber = false ;
	mount_holes = [[ (b_width/2-h_offset), (b_height/2-h_offset)],
						[ (b_width/2-h_offset),-(b_height/2-h_offset)],
						[-(b_width/2-h_offset), (b_height/2-h_offset)],
						[-(b_width/2-h_offset),-(b_height/2-h_offset)]];
	mount_width = 2*lb_thickness+lb_separation;
	mount_length= 2*h_thickness+ lb_diameter+r_separation;
	lb_steps = [[-(lb_thickness+lb_separation)/2,-r_separation/2,0],
					[-(lb_thickness+lb_separation)/2, r_separation/2,180],
					[ (lb_thickness+lb_separation)/2, r_separation/2,180],
					[ (lb_thickness+lb_separation)/2,-r_separation/2,0]];
	difference() {
		union() {
			for( i = [0:3] ) {
				translate([lb_steps[i][0], lb_steps[i][1],
							  lb_diameter/2+b_thickness/2+0.1]) 
					rotate([0,-90,lb_steps[i][2]]) 
						linear_bearing_holder( lb_diameter, lb_thickness, r_diameter, r_thickness,
												gap, h_thickness,clasp, false );
			}
			cube([mount_width,mount_length,b_thickness],center=true);
			for( i = [0:1] ) mirror([i,0,0]) {
				translate([lb_thickness+lb_separation/2+g_thickness/2,0,(g_width/2+g_extra)-b_thickness/2])
					difference() {
						union(){
							hull() {
								cube([g_thickness,g_height,g_width + 2*g_extra - g_thickness],center=true);
								rotate([90,0,0]) translate([0,g_width/2+g_extra-g_thickness/2,-g_height/2])
									cylinder( r = g_thickness/2,h = g_height);
								rotate([90,0,0]) translate([0,-(g_width/2+g_extra-g_thickness/2),-g_height/2])
									cylinder( r = g_thickness/2,h = g_height);
								translate([-g_thickness/4,0,-(g_width/2+g_extra-b_thickness/2)]) 
									cube([g_thickness/2,g_height,b_thickness],center=true);
							}
							if( show_grabber == true ) translate([0,-g_height/2-b_thickness/2,0]) rotate([-90,0,0])
								 belt_grabber( g_width, g_thickness, g_extra, b_thickness );
						}
						union() {//sub area
							rotate([90,0,0]) through_hole( 0, g_width/2+g_extra/2,m3_diameter/2,100);
							rotate([90,0,0]) through_hole( 0,-(g_width/2+g_extra/2),m3_diameter/2,100);
							translate([-g_thickness/2-0.1,-g_offset/2,0])rotate([0,90,0]) {
								cylinder( r = m5_diameter/2, h = 100, $fn = 100 );
								cylinder( r = m5_nut_diameter/2, h = m5_nut_thickness, $fn = 6 );
							}
							translate([0,g_height/2-g_offset/2+0.1,0])
								cube([g_thickness+0.1,g_offset+0.2,g_width],center = true);
						}// union sub area
					}
			}
		}//union
		union() {
			translate([0,0,b_thickness/2+0.1]) rotate([180,0,0]) {
				cylinder( r = 20.5, h = b_thickness+0.2 );
	
				rotate(a=[0, 0, 116]){
					translate(v=[0, -25, 0]) cylinder(r=m4_diameter/2, h=b_thickness+0.2, $fn = 20);
					translate(v=[0,  25, 0]) cylinder(r=m4_diameter/2, h=b_thickness+0.2, $fn = 20);
				}
				rotate(a=[0, 0, -116]){
					translate(v=[0, -25, 0]) cylinder(r=m4_diameter/2, h=b_thickness+0.2, $fn = 20);
					translate(v=[0,  25, 0]) cylinder(r=m4_diameter/2, h=b_thickness+0.2, $fn = 20);
				}
				rotate(a=[0, 0, 90]){
					translate(v=[0, -25, 0]) cylinder(r=m4_diameter/2, h=b_thickness+0.2, $fn = 20);
					translate(v=[0,  25, 0]) cylinder(r=m4_diameter/2, h=b_thickness+0.2, $fn = 20);
				}
			}
		}
	}//difference
}

module belt_grabber( g_width, g_thickness, g_extra, b_thickness ) {
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
}

function GT2_2mm_depth() = 0.764;
function GT2_2mm_width() = 1.494; //width of the tooth
function GT2_2mm_spacing() = 0.508; //ammount of space on inbetween 2 teeth
module GT2_2mm(h)
{
	linear_extrude(height=h) polygon([[0.747183,-0.5],[0.747183,0],[0.647876,0.037218],[0.598311,0.130528],[0.578556,0.238423],[0.547158,0.343077],[0.504649,0.443762],[0.451556,0.53975],[0.358229,0.636924],[0.2484,0.707276],[0.127259,0.750044],[0,0.76447],[-0.127259,0.750044],[-0.2484,0.707276],[-0.358229,0.636924],[-0.451556,0.53975],[-0.504797,0.443762],[-0.547291,0.343077],[-0.578605,0.238423],[-0.598311,0.130528],[-0.648009,0.037218],[-0.747183,0],[-0.747183,-0.5]]);
}