use <utils.scad>
include <bolts.scad>


support_thickness = 3 ;
frame_thickness = 3 ;

support_width = 2 ;
frame_width = 4 ;

frame_length = 120 ;
frame_height = 50 ;

frame_angle1 = 18 ; 
frame_angle2 = 60 ; 

z_supprt_frame( frame_length,frame_height, support_thickness, frame_thickness, support_width, frame_width, frame_angle1, frame_angle2 );











module z_supprt_frame( length_f,height_f, thickness_s, thickness_f, width_s, width_f, angle_f1, angle_f2 ) {
	r1p0 = [0,-width_f];
	r1p1 = [length_f, -width_f];
	r1p2 = [width_f,-(width_f+tan(angle_f1)*(length_f-width_f))];
	top_edge = lineFromPoints( r1p1, r1p2 );
	r2p0 = [width_f, 0];
	r2p1 = [width_f, -height_f];
	r2p2 = [width_f+tan(angle_f2)*(height_f-width_f),-width_f];
	bottom_edge = lineFromPoints( r2p1, r2p2 );
	midp = line_intersection( top_edge, bottom_edge );
	
	
	frame_points = [ 
					[0,0],
					[length_f, 0],
					r1p1,
					midp,
					r2p1,
					[0, -height_f] ];
	top_line = lineFromPoints(r1p0, r1p1);
	vert_line = lineFromPoints(r2p0, r2p1);
	
	center_line = lineFromPoints( [0,0], midp );
	c_line_plus = shift_line( center_line, width_s/2 );
	b_edge_plus = shift_line( bottom_edge, width_s );
	t_edge_plus = shift_line( top_edge, width_s );
	c_line_minus = shift_line( center_line, -width_s/2 );
	b_edge_minus = shift_line( bottom_edge, -width_s );
	t_edge_minus = shift_line( top_edge, -width_s );
	
	t1p1 = line_intersection( b_edge_plus,c_line_plus );
	t1p2 = line_intersection( top_line,c_line_plus );
	t1p3 = line_intersection( b_edge_plus,top_line );
	
	t2p1 = line_intersection( top_line, bottom_edge );
	t2p2 = line_intersection( top_line, t_edge_plus );
	t2p3 = line_intersection( t_edge_plus, bottom_edge );
	
	t3p1 = line_intersection( t_edge_plus,c_line_minus );
	t3p2 = line_intersection( t_edge_plus,vert_line );
	t3p3 = line_intersection( vert_line,c_line_minus );
	
	t4p1 = line_intersection( vert_line, top_edge );
	t4p2 = line_intersection( vert_line, b_edge_plus );
	t4p3 = line_intersection( b_edge_plus, top_edge );
	
	
	t5p1 = line_intersection( t_edge_minus, c_line_plus );
	t5p2 = line_intersection( top_line, t_edge_minus );
	t5p3 = line_intersection( c_line_plus, top_line );
	
	t6p1 = line_intersection( b_edge_minus, c_line_minus );
	t6p2 = line_intersection( vert_line, c_line_minus );
	t6p3 = line_intersection( vert_line, b_edge_minus );
	
	frame_holes = [
					[t5p1,t5p2,t5p3],
					[t6p1,t6p2,t6p3] ];
					
	difference() {
		union() {
			linear_extrude(height=thickness_f) polygon(frame_points);
		}
		translate([0,0,-0.1]) union() {
			tesalate(  thickness_f, width_s, frame_holes[0] );
			tesalate(  thickness_f, width_s, frame_holes[1] );
		//#	linear_extrude(height=thickness_f+0.2) polygon(frame_holes[0]);
		//	linear_extrude(height=thickness_f+0.2) polygon(frame_holes[1]);
		}
	}
}

module tesalate( thickness_f, width_s, points, level =2, debug = false ) {
	base_line = lineFromPoints( points[1], points[2] );
	//center_line = perpendicularLineThrough( base_line, points[0] );
	center_line = midpointOfLineThrough( points[1], points[2], points[0] );
	
	center1 = shift_line( center_line, -width_s/2 );
	center2 = shift_line( center_line,  width_s/2 );
	arc_line1 = lineFromPoints( points[0], points[1] );
	arc_line2 = lineFromPoints( points[0], points[2] );
	
	p5 = line_intersection( center1, base_line );
	p6 = line_intersection( center1, arc_line2 );
	p7 = line_intersection( center2, base_line );
	p8 = line_intersection( center2, arc_line1 );
	if( debug == true && level == 1 ) {
		echo("base   ",base_line);
		echo("center ",center_line);
	}
	if( level > 0 ) {
		if( distSqre( points[1], p7 ) < distSqre( points[1], p5 ) ) {
			#tesalate(thickness_f, width_s, [p5,p6,points[2]], level-1);
			tesalate(thickness_f, width_s, [p7,points[1],p8], level-1);
		} else {
			tesalate(thickness_f, width_s, [p7,points[2],p8], level-1);
			tesalate(thickness_f, width_s, [p5,p6,points[1]], level-1);
		}

	} else {
		linear_extrude(height=thickness_f+0.2) polygon(points);
	}
}
function testline( a, b ) = (!not_PoM_inf(a) && b < 0 ) || (!not_PoM_inf(b) && a < 0 ) || (a > 0.0 && b > 0.0) || (a == 0.0 && b > 0.0);
function seg_seg_intersection( r1p1, r1p2, r2p1, r2p1 ) = 0;

function lineFromPointsX(p1,p2) = (p2[1]-p1[1])/(p2[0]-p1[0]);
function lineFromPoints( p1, p2 ) = [lineFromPointsX(p1,p2), (p1[0]!=p2[0])?-lineFromPointsX(p1,p2)*p1[0]+p1[1]:p1[0]];

function not_PoM_inf(v) = (v!=1/0 && v!=-1/0);
function line_intersectionX( l1,l2 ) = (l2[1]-l1[1])/(l1[0]-l2[0]);
function line_intersection( l1,l2 ) = (not_PoM_inf(l1[0]) && not_PoM_inf(l2[0]))?
										[line_intersectionX( l1,l2 ), (l1[0] * line_intersectionX( l1,l2 )) + l1[1] ]:
										(not_PoM_inf(l1[0])?[l2[1],l1[0]*l2[1]+l1[1]]:
															[l1[1],l2[0]*l1[1]+l2[1]]);
//	x = (b2 - b1) / (m1 - m2);
//	y = m1 * x + b1;
function is_parrallel( l1,l2 ) = l1[0] == l2[0]?true:false;
function line_midpoint( p1, p2 ) = [(p1[0]+p2[0])/2,(p1[1]+p2[1])/2];

function shift_line(l, d) = [l[0], (not_PoM_inf(l[0])?( -l[0]*cos(atan(-1/l[0]))*d + sin(atan(-1/l[0]))*d ):d)+l[1] ];
function perpendicularLineThrough( l, p ) = not_PoM_inf(l[0])?(l[0]==0?[1/0,p[0]]:[-1/l[0], p[0]/l[0]+p[1] ]):[0,p[1]];
function midpointOfLineThrough( a,b, p ) = lineFromPoints( (a+b)/2, p );

function distanceFromSegment( a,b, p ) = sqrt(distanceFromSegmentSquared( a,b,p ));
function distanceFromSegmentSquared( a,b,p ) = (distSqre( a, b ) == 0.0 )?dist(a,p):
												(somthing(a,b,p) < 0) ?dist( p,a ):
												(somthing(a,b,p) > 1) ?dist( p,b ):
												dist( p, [
															a[0]+somthing(a,b,p) * (b[0]-a[0]),
															a[1]+somthing(a,b,p) * (b[1]-a[1]) ] );

function distSqre( x, y ) = pow(x[0]-y[0],2)+pow(x[1]-y[1],2);
function dist( x, y ) = sqrt(distSqre( x, y ));
function somthing( a,b,p ) = ((p[0]-a[0])*(b[0]-a[0]) + (p[1]-a[1])*(b[1]-a[1])) / distSqre( a,b );
//function sqr(x) { return x * x }
//function dist2(v, w) { return sqr(v.x - w.x) + sqr(v.y - w.y) }
//function distToSegmentSquared(p, v, w) {
//  var l2 = dist2(v, w);
//  if (l2 == 0) return dist2(p, v);
//  var t = ((p.x - v.x) * (w.x - v.x) + (p.y - v.y) * (w.y - v.y)) / l2;
//  if (t < 0) return dist2(p, v);
//  if (t > 1) return dist2(p, w);
//  return dist2(p, { x: v.x + t * (w.x - v.x),
//                    y: v.y + t * (w.y - v.y) });
//}
//function distToSegment(p, v, w) { return Math.sqrt(distToSegmentSquared(p, v, w));