include <bolts.scad>


include <utils.scad>

frame_length = 200 ;
frame_depth = 200 ;
frame_height = 200 ;

frame_width = 20;
bracket_length = 70;
bracket_thickness = 4;

bearing_diameter = 14;
bearing_inner_diameter = 5.2;
bearing_thickness = 10.05;


make_balls = true;
make_frame = true;
make_side_brakets = true;
make_front_brackets = true;

if( make_balls == true ) {
	sphere(r=5);
	for( i=[-frame_length/2,frame_length/2])
		for( j= [-frame_depth/2,frame_depth/2]) 
			for( k= [-frame_height/2,frame_height/2]) 
				translate([i,j,k]) sphere(r=5,center=true);
}

if( make_frame == true ) {

//Make up and down braces
	for( i=[-frame_length/2,frame_length/2])
		for( j= [-frame_depth/2,frame_depth/2]) 
			translate([i-(sign(i)*frame_width/2),j-(sign(j)*frame_width/2),0]) color("Black") 
            cube([frame_width,frame_width,frame_height],center=true);
//make Front and back
	for( i=[-frame_length/2,frame_length/2])
		for( k= [-frame_height/2,frame_height/2]) 
			translate([i-(sign(i)*frame_width/2),0,k-(sign(k)*frame_width/2)]) color("Black") 
            cube([frame_width,frame_depth-frame_width*2,frame_width],center=true);
//Make Sides
	for( j=[-frame_depth/2,frame_depth/2])
		for( k= [-frame_height/2,frame_height/2]) 
			translate([0,j-(sign(j)*frame_width/2),k-(sign(k)*frame_width/2)]) color("Black") 
            cube([frame_length-frame_width*2,frame_width,frame_width],center=true);
}

if( make_side_brakets == true ) {
	for( i=[-frame_length/2,frame_length/2])
		for( j=[-frame_depth/2,frame_depth/2])
			for( k= [-frame_height/2,frame_height/2]) 
				translate([i-(sign(i)*frame_width/2),
                       j-(sign(j)*frame_width/2),
                       k-(sign(k)*frame_width/2)]) 
					rotate([-sign(k)*90,0,90+sign(i)*90]) 
                  translate([0,0,-sign(i)*sign(j)*sign(k)*(frame_width/2+bracket_thickness/2)])
						braced_4_hole_L_bracket(frame_width,bracket_length, bracket_thickness);
}


use <corner_motor_bracket.scad>
use <corner_belt_bracket.scad>

if( make_front_brackets == true ) {
	for( i=[-frame_length/2,frame_length/2])
		for( j=[-frame_depth/2,frame_depth/2])
			for( k= [-frame_height/2])//,frame_height/2]) 
				translate([i-(sign(i)*frame_width/2),
                       j-(sign(j)*frame_width/2),
                       k-(sign(k)*frame_width/2)]) 
					rotate([-sign(k)*90,0,-sign(j)*90]) 
                  translate([0,0,sign(i)*sign(j)*sign(k)*(frame_width/2+bracket_thickness/2)])
						braced_4_hole_L_bracket(frame_width,bracket_length, bracket_thickness);
         
	for( i=[frame_length/2])//,frame_length/2])
		for( j=[-frame_depth/2,frame_depth/2])
			for( k= [frame_height/2])//,frame_height/2]) 
				translate([i-(sign(i)*frame_width/2),
                       j-(sign(j)*frame_width/2),
                       k-(sign(k)*frame_width/2)]) 
					rotate([-sign(k)*90,0,-sign(j)*90]) 
                  translate([0,0,sign(i)*sign(j)*sign(k)*(frame_width/2+bracket_thickness/2)])
                     mirror([0,0,-0.5+sign(i)*sign(j)*0.5])
                        corner_motor_bracket( );


   for( i=[-frame_length/2])//,frame_length/2])
      for( j=[-frame_depth/2,frame_depth/2])
			for( k= [frame_height/2])//,frame_height/2]) 
				translate([i-(sign(i)*frame_width/2),
                       j-(sign(j)*frame_width/2),
                       k-(sign(k)*frame_width/2)]) 
					rotate([-sign(k)*90,0,-sign(j)*90]) 
                  translate([0,0,sign(i)*sign(j)*sign(k)*(frame_width/2+bracket_thickness/2)])
                     mirror([0,0,-0.5+sign(i)*sign(j)*0.5])
               corner_belt_bracket( bracket_thickness,frame_width,bracket_length, 
								[18,frame_width,  2,0], [0,frame_width/2,bearing_inner_diameter+4,0 ] );
}


