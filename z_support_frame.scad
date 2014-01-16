use <utils.scad>
include <bolts.scad>


support_thickness = 3 ;
frame_thickness = 3 ;

support_width = 3 ;
frame_width = 4 ;

frame_length = 120 ;
frame_height = 50 ;

frame_angle1 = 30 ; 
frame_angle2 = 30 ; 

z_supprt_frame( frame_length,frame_height, support_thickness, frame_thickness, support_width, frame_width, frame_angle1, frame_angle2 );











module z_supprt_frame( length_f,height_f, thickness_s, thickness_f, width_s, width_f, angle_f1, angle_f2 ) {
	r1p1 = [length_f, -width_f];
	r1p2 = [width_f,-(width_f+tan(angle_f1)*(length_f-width_f))];
	top_edge = lineFromPoints( r1p1, r1p2 );
	r2p1 = [width_f, -height_f];
	r2p2 = [width_f+tan(angle_f2)*(height_f-width_f),-width_f];
	bottom_edge = lineFromPoints( r1p1, r1p2 );
	echo("edge is");
	//	midp = line_midpoint( r1p1,r2p1 );
		midp = line_intersection( top_edge, bottom_edge );
	frame_points = [ 
					[0,0],
					[length_f, 0],
					r1p1,
					midp,
					r2p1,
					[0, -height_f] ];
	difference() {
		union() {
			linear_extrude(height=thickness_f) polygon(frame_points);
		}
		
	}
}



function seg_seg_intersection( r1p1, r1p2, r2p1, r2p1 ) = 0;

function lineFromPoints( p1, p2 ) = [(p2[1]-p1[1])/(p2[0]-p1[0]), -(p2[1]-p1[1])/(p2[0]-p1[0])*p1[0]+p1[1]];

function line_intersection( l1,l2 ) = [(l2[1]-l1[1])/(l1[0]-l2[1]), (l1[0] * (l2[1]-l1[1])/(l1[0]-l2[1])) + l1[1] ];
//	x = (b2 - b1) / (m1 - m2);
//	y = m1 * x + b1;
function is_parrallel( l1,l2 ) = l1[0] == l2[0]?true:false;
function line_midpoint( p1, p2 ) = [(p1[0]+p2[0])/2,(p1[1]+p2[1])/2];

