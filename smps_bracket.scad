include <bolts.scad>



back_horiz_separation = 50 ;
back_vert_separation = 150 ;

back_mount_separation = 55 ;

smps_bolt = m4_diameter;
mount_bolt = m5_diameter;

$fn = 30 ;

module smps_mount() {
	difference() {
		union() {
			
			for( j = [0,-1]) hull() for( i = [-1,1] ) {
				translate([i*back_horiz_separation/2,j*back_vert_separation,0]) 
					cylinder( r = mount_bolt, h = 5 );
			}
			translate([0,0,2.5]) {
				translate([0,-back_vert_separation/2,0]) minkowski() {
					cube( [20,back_vert_separation,5],center = true );
					cylinder(r=5,h=0.01);
				}
				for( j =[-1,1] ) for( i=[-1,1] ) hull() {
					translate([i*12.6,-back_vert_separation/2+j*back_vert_separation/2-j*10,2])
						cube( [4.8,1,1],center = true );
					translate([i*12.6,-back_vert_separation/2+j*10,2])
				#		cube( [4.8,1,1],center = true );
					translate([i*12.6,-back_vert_separation/2+j*back_vert_separation/4+15,12.5])
						cube( [4.8,1,20],center = true );
					translate([i*12.6,-back_vert_separation/2+j*back_vert_separation/4-15,12.5])
						cube( [4.8,1,20],center = true );
				}
			}
		}
		
		
		for( j = [0,-1]) for( i = [-1,1] ) {
			translate([i*back_horiz_separation/2,j*back_vert_separation,-0.1]) 
				cylinder( r = smps_bolt/2, h = 5.2 );
		}
		for( j =[-1,1] ) for( i=[-1,1] ) { translate([i*9.9,-back_vert_separation/2+j*back_vert_separation/4,15])
			rotate([0,i*90,0])
		#		cylinder( r = mount_bolt/2, h = 5.2 );
		}
	}
}

smps_mount();
/*rotate([0,0,180])
translate([0,20,0])
smps_mount();*/
