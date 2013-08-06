include <utils.scad>

tslot = [ [0.2,0], [11.7, 0], [11.7, 1], [9.2, 3.5], [2.8, 3.5], [0.2, 0.9] ];

module nut() {
rotate([180,0,0]) difference() {
	translate([-6, -7.5, 0]) rotate([270,0,0]) linear_extrude(height=15) polygon(tslot);
	translate([0,0,-1.2]) cylinder(r=2.8, h=1.2, $fn=100);
	translate([0,0,-3.5]) rotate([0,0,90]) hexagon(8, 6);
}
}

module dual_nut(sep,has_text = false) {
	rotate([180,0,0]) difference() {
		translate([-6, -7.5, 0]) rotate([270,0,0]) linear_extrude(height=15+sep) polygon(tslot);
		translate([0,0,-1.2]) cylinder(r=2.8, h=1.2, $fn=100);
		translate([0,0,-3.5]) rotate([0,0,90]) hexagon(8, 6);

		if( has_text ) {
			rotate([0,180,0]) translate([2.5,sep/2,3.61]) rotate([0,0,90]) scale( [.15,.12,.15]) {
				translate([-15,0,0]) FreeSerif(str(sep)[0]);
				translate([15,0,0]) FreeSerif(str(sep)[1]);
			}
		}

		translate([0,sep,-1.2]) cylinder(r=2.8, h=1.2, $fn=100);
		translate([0,sep,-3.5]) rotate([0,0,90]) hexagon(8, 6);
	}
}

size = 25;
for(x=[0:1]) for(y=[0:0]) {
	translate([x*14, y*(17+size), 0]) dual_nut(size);
}
