include <bolts.scad>
base_diameter = 100;
base_thickness = 3;
base_screw_count = 6;

hub_outer_diameter_upper = 5;
hub_height = 60;
hub_inner_diameter = 3.1;
hub_motor_diameter = 28;
hub_shaft_length = 11;
hub_motor_length = 21;
fin_count_large = 6;
fin_count_small = 6;
fin_thickness = 1;
hub_motor_mount_dist = 16;

$fn = 100;

impeller(base_diameter, base_thickness, 
			hub_outer_diameter_upper, hub_height, hub_inner_diameter,
			hub_motor_diameter+12, hub_shaft_length, hub_motor_length,
			fin_count_large, fin_count_small, fin_thickness);

translate([base_diameter+ 4*base_thickness+10,0,0]) 
	impeller_base( base_diameter, base_thickness,base_screw_count, hub_motor_diameter, hub_motor_mount_dist );

translate([-(base_diameter+ 4*base_thickness+10),0,0]) 
	impeller_top( base_diameter, base_thickness,base_screw_count, hub_motor_diameter, hub_motor_mount_dist );

module impeller(base_d, base_t, 
						hub_od, hub_h, hub_id,
						hub_md, hub_sl, hub_ml,
						fin_cL, fin_cS, fin_t ) {
	step = 2;
	difference() {
		union() {
			cylinder( r = base_d/2, h = base_t );
			for( i = [base_t-step:step:hub_h-step] ) {
				translate([0,0,i]) hull() {
					cylinder( r1 = hub_parabolic(i,step,base_t,hub_od,hub_h,base_d),
								r2 = hub_parabolic(i+step,step,base_t,hub_od,hub_h,base_d), h = step );	
				}
			}
			union() {
				translate([0,0,hub_h*.475]) 
					fins( base_d*0.375, base_d * 0.5,fin_t, base_t, hub_h*.95,fin_cL, 0);
	
				translate([0,0,hub_h*.25]) 
					fins( base_d*0.375, base_d * 0.5,fin_t, base_t, hub_h * 0.55,fin_cS, 245/fin_cL);
			}
		}
		
		translate([0,0,-0.1]) cylinder( r = hub_md/2, h = hub_ml + 0.1 );
		translate([0,0,hub_ml]) cylinder( r = hub_id/2, h = hub_sl );
	}
}

function parabolic( i ) = log(1/i)/1.5;
function hub_parabolic( cur, step, minh, mind, maxh, maxd ) =  min(parabolic(zero_to_one(cur,minh-step,maxh))*
																						(maxd-mind)/2+mind/2, maxd/2);
function zero_to_one( i, mins, maxs ) = (i-mins)/(maxs-mins);

module fin( radius, base_radius, thickness, height, angle ) {
	intersection() {
		rotate([0,0,angle]) translate([radius,0,0]) {
			intersection() {
				ring( radius, thickness, height );
				translate([ 0,-radius,-height/2])
					cylinder( r = base_radius, h = height );
			}
		}
		translate([0,0,-height/2]) cylinder( r = base_radius, h = height );
	}
}

module fin2(radius, base_radius, thickness, height, angle) {
	rotate([0,0,angle])
	rotate([90,0,90]) 
	linear_extrude(height=base_radius, center=false, convexity=5, twist=-60, slices=15)
		scale([thickness/height,1,1]) circle(r = height*.7);
}

module fins( radius, base_radius, thickness, base_t, height, count, offset ){
	intersection() {
		union() {
			for( i = [0:count] ) {
		//		fin2( radius, base_radius, thickness, height, 360*i/count+offset );
			}
		}
		translate([0,0,base_t-height/2]) intersection() {
			scale([1,1,height/base_radius]) sphere( r = base_radius );
			cylinder( r = base_radius, h = height );
		}
		
	}
}

module ring(radius, thickness, height) {
	padding = 0.1;

	inner_radius = radius - thickness;

	difference() {
		cylinder(r=radius, h=height, center=true);
		cylinder(r=inner_radius, h=height + padding, center=true);
	}
}


module impeller_base(base_d, base_t, base_c, hub_md, hub_mmount_dist ){
	difference() {
		union() {
			cylinder( r = base_d/2 + 3*base_t, h = base_t );
			for( i = [0:base_c-1] ) {
				rotate([0,0,i*360/base_c]) translate([ base_d/2 + 4*base_t,0,0 ]) hull() {
					cylinder( r = m3_diameter*1.5, h = base_t );
					translate([ -3*base_t,0,0 ]) cylinder( r = m3_diameter*1.5, h = base_t );
				}
			}
		}
		translate([0,0,-0.1]) union() {
			translate([0,0,base_t*.75]) ring( base_d/2+base_t, base_t/2, base_t+0.2 );
			translate([0,0,base_t*.75]) ring( base_d/2+2*base_t, base_t/2, base_t+0.2 );
			cylinder( r = hub_md/2, h = base_t+0.2 );
			for( i = [0:3] ) {
				rotate([0,0,i*90])
					translate([ hub_mmount_dist,0,0 ]) {
						cylinder( r = m3_diameter/2, h = base_t+0.2 );
						translate([0,0,base_t*0.6]) rotate([0,0,30]) cylinder( r = m3_nut_diameter/2, h = base_t+0.2, $fn= 6 );
					}
			}
			for( i = [0:base_c-1] ) {
				rotate([0,0,i*360/base_c]) {
					translate([ base_d/2 + 4*base_t,0,0 ]) 
						cylinder( r = m3_diameter/2, h = base_t+0.2 );
				}
			}
		}
	}
}



module impeller_top(base_d, base_t, base_c, hub_md, hub_mmount_dist ){

}
