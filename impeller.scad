base_diameter = 50;
base_thickness = 2;

hub_outer_diameter_upper = 5;
hub_height = 20;
hub_inner_diameter = 2;
fin_count_large = 6;
fin_count_small = 6;
fin_thickness = 1;

$fn = 100;

impeller(base_diameter, base_thickness, 
			hub_outer_diameter_upper, hub_height, hub_inner_diameter,
			fin_count_large, fin_count_small, fin_thickness);


module impeller(base_d, base_t, 
						hub_od, hub_h, hub_id,
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
				translate([0,0,hub_h*.4]) 
					fins( base_d*0.375, base_d * 0.5,fin_t, base_t, hub_h * 0.8,fin_cL, 0);
	
				translate([0,0,hub_h*.2]) 
					fins( base_d*0.375, base_d * 0.5,fin_t, base_t, hub_h * 0.4,fin_cS, 245/fin_cL);
			}
		}
		
		translate([0,0,-0.1]) cylinder( r = hub_id/2, h = hub_h + 0.2 );
	}
}

function parabolic( i ) = log(1/i)/2;
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
				fin2( radius, base_radius, thickness, height, 360*i/count+offset );
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