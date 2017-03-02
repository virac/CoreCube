include <bolts.scad>


include <utils.scad>

frame_length = 540 ;
frame_depth = 500 ;
frame_height = 460 ;
frame_height_offset = 50 ;

frame_width = 20;
bracket_length = 70;
bracket_thickness = 4;

brace_width = 17 ;
brace_thickness = 3 ;
brace_length = 20 ;

bearing_diameter = 14;
bearing_inner_diameter = 5.2;
bearing_thickness = 10.05;


frame_bolt_diameter = m5_diameter ;
frame_bolt_washer_diameter = m5_washer_diameter ;



assemble = false;

make_balls = false;
make_frame = false;
make_frame_brace = false;
make_corner_frame_top_bracket = false;
make_corner_frame_bottom_bracket = true;

if( assemble == true ) {
if( make_balls == true ) {
	sphere(r=5);
	for( i=[-1,1])
		for( j= [-1,1]) 
			for( k= [-1,1]) 
				translate([i*frame_length/2,j*frame_depth/2,k*frame_height/2]) sphere(r=5,center=true);
}

if( make_frame == true ) {

//Make up and down braces
	for( i=[-frame_length/2,frame_length/2])
		for( j= [-frame_depth/2,frame_depth/2]) 
			translate([i-(sign(i)*frame_width/2),j-(sign(j)*frame_width/2),0]) color("BLUE") 
            cube([frame_width,frame_width,frame_height],center=true);
//make Front and back
	for( i=[-frame_length/2,frame_length/2])
		for( k= [-(frame_height-frame_height_offset)/2,(frame_height-frame_height_offset)/2]) 
			translate([i-(sign(i)*frame_width/2),0,k-(sign(k)*frame_width/2)+frame_height_offset/2]) color("GREY") 
            cube([frame_width,frame_depth-frame_width*2,frame_width],center=true);
//Make Sides
	for( j=[-frame_depth/2,frame_depth/2])
		for( k= [-(frame_height-frame_height_offset)/2,(frame_height-frame_height_offset)/2]) 
			translate([0,j-(sign(j)*frame_width/2),k-(sign(k)*frame_width/2)+frame_height_offset/2]) color("Black") 
            cube([frame_length-frame_width*2,frame_width,frame_width],center=true);
}

if( make_frame_brace == true ) {
   for( i = [0,180] ) rotate([0,0,i]) translate([-frame_length/2,-frame_depth/2,-frame_height/2+frame_height_offset]) {
      translate([frame_width,brace_width/2+frame_width/2,frame_width]) rotate([0,0,-90])
         frame_brace();
      translate([-brace_width/2+frame_width/2,frame_width,frame_width]) rotate([0,0,0])
         frame_brace();
      translate([frame_width,frame_width,brace_width/2+frame_width/2]) rotate([0,90,0])
         frame_brace();
      translate([-brace_width/2+frame_width/2,frame_width,0]) rotate([-90,0,0])
         frame_brace();
      translate([frame_width,brace_width/2+frame_width/2,0]) rotate([-90,0,-90])
         frame_brace();
   }
   for( i = [90,270] ) rotate([0,0,i]) translate([-frame_depth/2,-frame_length/2,-frame_height/2+frame_height_offset]) {
      translate([frame_width,brace_width/2+frame_width/2,frame_width]) rotate([0,0,-90])
         frame_brace();
      translate([-brace_width/2+frame_width/2,frame_width,frame_width]) rotate([0,0,0])
         frame_brace();
      translate([frame_width,frame_width,brace_width/2+frame_width/2]) rotate([0,90,0])
         frame_brace();
      translate([-brace_width/2+frame_width/2,frame_width,0]) rotate([-90,0,0])
         frame_brace();
      translate([frame_width,brace_width/2+frame_width/2,0]) rotate([-90,0,-90])
         frame_brace();
   }
   
   for( i = [0,180] ) rotate([180,0,i]) translate([-frame_length/2,-frame_depth/2,-frame_height/2]) {
      translate([frame_width,brace_width/2+frame_width/2,frame_width]) rotate([0,0,-90])
         frame_brace();
      translate([-brace_width/2+frame_width/2,frame_width,frame_width]) rotate([0,0,0])
         frame_brace();
      translate([frame_width,frame_width,brace_width/2+frame_width/2]) rotate([0,90,0])
         frame_brace();
   }
   for( i = [90,270] ) rotate([180,0,i]) translate([-frame_depth/2,-frame_length/2,-frame_height/2]) {
      translate([frame_width,brace_width/2+frame_width/2,frame_width]) rotate([0,0,-90])
         frame_brace();
      translate([-brace_width/2+frame_width/2,frame_width,frame_width]) rotate([0,0,0])
         frame_brace();
      translate([frame_width,frame_width,brace_width/2+frame_width/2]) rotate([0,90,0])
         frame_brace();
   }
}

if( make_corner_frame_top_bracket == true ) {
	for( i=[-1,1])
		for( j= [-1,1]) 
				translate([i*frame_length/2,j*frame_depth/2,frame_height/2]) rotate([0,0,(i+1)*90+(j-i)*180])
               corner_frame_top_bracket();
}
} else {
   if( make_frame_brace == true ) {
      frame_brace();
   }
   if( make_corner_frame_top_bracket == true ) {
      corner_frame_top_bracket();
   }
   if( make_corner_frame_bottom_bracket == true ) {
      corner_frame_bottom_bracket();
   }
}



module frame_brace() {
   cube([brace_width,brace_length,brace_thickness]);
   hull() {
      cube([brace_thickness,brace_length,brace_thickness]);
      cube([brace_thickness,brace_thickness,brace_length]);
   }
   translate([brace_width-brace_thickness,0,0]) hull() {
      cube([brace_thickness,brace_length,brace_thickness]);
      cube([brace_thickness,brace_thickness,brace_length]);
   }
   hull() {
      cube([brace_thickness,brace_thickness,brace_length]);
      translate([brace_width-brace_thickness,0,0])
         cube([brace_thickness,brace_thickness,brace_length]);
   }
}



module corner_frame_bottom_bracket() {
   corner_frame_bracket();
   rotate([0,90,0]) mirror([0,0,1])
      corner_frame_bracket();
   
   hull() {
      cube([bracket_length, 0.01, bracket_thickness*2]);
      rotate([90,0,0]) mirror([0,1,0])// translate([0,-0.01,0])
         cube([bracket_length, 1, bracket_thickness*2]);
   }
   hull() {
      cube([0.01, bracket_length, bracket_thickness*2]);
      rotate([0,90,0]) mirror([0,0,1])
         cube([0.01, bracket_length, bracket_thickness*2]);
   }
   hull() {
      rotate([90,0,0]) mirror([0,1,0]) // translate([-0.01,0,0])
      cube([1, bracket_length, bracket_thickness*2]);
      rotate([0,90,0]) mirror([0,0,1])
         cube([bracket_length, 0.01, bracket_thickness*2]);
   }
   
   hull() {
      cube([0.01, 0.01, bracket_thickness*2]);
      rotate([90,0,0]) mirror([0,1,0])  translate([0,-0.01,0])
         cube([0.01, 0.01, bracket_thickness*2]);
      cube([0.01, 0.01, bracket_thickness*2]);
      rotate([0,90,0]) mirror([0,0,1])// translate([0,0,0.1])
         cube([0.01, 0.01, bracket_thickness*2]);
      rotate([90,0,0]) mirror([0,1,0])  translate([-0.01,0,0])
         cube([0.01, 0.01, bracket_thickness*2]);
      rotate([0,90,0]) mirror([0,0,1])// translate([0,0,0.1])
         cube([0.01, 0.01, bracket_thickness*2]);
   }
}


module corner_frame_top_bracket() {
   corner_frame_bracket();
   rotate([0,90,0]) mirror([0,0,1])
      corner_frame_bracket();
   rotate([90,0,0]) mirror([0,1,0])
      corner_frame_bracket();
   
   hull() {
      cube([bracket_length, 0.1, bracket_thickness*2]);
      rotate([90,0,0]) mirror([0,1,0])
         cube([bracket_length, 0.1, bracket_thickness*2]);
   }
   hull() {
      cube([0.1, bracket_length, bracket_thickness*2]);
      rotate([0,90,0]) mirror([0,0,1])
         cube([0.1, bracket_length, bracket_thickness*2]);
   }
   hull() {
      rotate([90,0,0]) mirror([0,1,0])
      cube([0.1, bracket_length, bracket_thickness*2]);
      rotate([0,90,0]) mirror([0,0,1])
         cube([bracket_length, 0.1, bracket_thickness*2]);
   }
   
   hull() {
      cube([0.1, 0.1, bracket_thickness*2]);
      rotate([90,0,0]) mirror([0,1,0])
         cube([0.1, 0.1, bracket_thickness*2]);
      cube([0.1, 0.1, bracket_thickness*2]);
      rotate([0,90,0]) mirror([0,0,1])
         cube([0.1, 0.1, bracket_thickness*2]);
      rotate([90,0,0]) mirror([0,1,0])
      cube([0.1, 0.1, bracket_thickness*2]);
      rotate([0,90,0]) mirror([0,0,1])
         cube([0.1, 0.1, bracket_thickness*2]);
   }
}

module corner_frame_bracket() {
   difference(){ 
      union() {
         cube([bracket_length, frame_width, bracket_thickness]);
         cube([bracket_length, (frame_width-frame_bolt_washer_diameter)/2, bracket_thickness*2]);
         cube([frame_width,bracket_length,bracket_thickness]);
         cube([(frame_width-frame_bolt_washer_diameter)/2, bracket_length, bracket_thickness*2]);
         
         hull() {
            translate([bracket_length-0.1,0,0])
               cube([0.1,frame_width,bracket_thickness]);
            translate([0,bracket_length-0.1,0])
               cube([frame_width,0.1,bracket_thickness]);
         }
      }
      
      union() {
         translate([frame_width/2,frame_width/2,-bracket_thickness])
            cylinder(r=frame_bolt_diameter/2,h = bracket_thickness*3, $fn=32 );
         translate([bracket_length-frame_width/2,frame_width/2,-bracket_thickness])
            cylinder(r=frame_bolt_diameter/2,h = bracket_thickness*3, $fn=32 );
         translate([frame_width/2,bracket_length-frame_width/2,-bracket_thickness])
            cylinder(r=frame_bolt_diameter/2,h = bracket_thickness*3, $fn=32 );
         translate([bracket_length/2,frame_width/2,-bracket_thickness])
            cylinder(r=frame_bolt_diameter/2,h = bracket_thickness*3, $fn=32 );
         translate([frame_width/2,bracket_length/2,-bracket_thickness])
            cylinder(r=frame_bolt_diameter/2,h = bracket_thickness*3, $fn=32 );
      }
   }
   
}