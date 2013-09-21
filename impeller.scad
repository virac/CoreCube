base_diameter = 50;
base_thickness = 2;

hub_outer_diameter_upper = 5;
hub_height = 20;
hub_inner_diameter = 2;
fin_count_large = 16;
fin_count_small = 8;

$fn = 100;

impeller(base_diameter, base_thickness, 
			hub_outer_diameter_upper, hub_height, hub_inner_diameter,
			fin_count_large, fin_count_small);


module impeller(base_d, base_t, 
						hub_od, hub_h, hub_id,
						fin_cL, fin_cS ) {
	step = 2;
	difference() {
		union() {
			cylinder( r = base_d/2, h = base_t );
			for( i = [base_t-step:step:hub_h-step] ) {
				echo(hub_parabolic(i,step,base_t,hub_od,hub_h,base_d));
				translate([0,0,i]) hull() {
					cylinder( r1 = hub_parabolic(i,step,base_t,hub_od,hub_h,base_d),
								r2 = hub_parabolic(i+step,step,base_t,hub_od,hub_h,base_d), h = step );	
				}
			}
		}
		
		translate([0,0,-0.1]) cylinder( r = hub_id/2, h = hub_h + 0.2 );
	}
}
function parabolic( i ) = log(1/i)/2;
function hub_parabolic( cur, step, minh, mind, maxh, maxd ) =  min(parabolic(zero_to_one(cur,minh-step,maxh))*
																						(maxd-mind)/2+mind/2, maxd/2);
function zero_to_one( i, mins, maxs ) = (i-mins)/(maxs-mins);

module ring(radius, thickness, height) {
	padding = 0.1;

	inner_radius = radius - thickness;

	difference() {
		cylinder(r=radius, h=height, center=true);
		cylinder(r=inner_radius, h=height + padding, center=true);
	}
}