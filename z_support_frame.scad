use <utils.scad>
include <bolts.scad>


support_thickness = 3 ;
frame_thickness = 3 ;

support_width = 2 ;
frame_width = 4 ;

frame_length = 120 ;
frame_height = 50 ;

frame_angle1 = 10 ; 
frame_angle2 = 40 ; 

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
	
	center_line = lineFromPoints( [width_f,-width_f], midp );
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
			tesalate_triangle(  thickness_f, width_s, frame_holes[0],frame_holes[0] );
			tesalate_triangle(  thickness_f, width_s, frame_holes[1],frame_holes[1] );
		}
	}
}

//This method takes the points shifts them by +/- width_s/2 perpendicular to the line segment of point0 
//  and the midpoint between point1 and 2 once so many levels are generated down will render the points
module tesalate( thickness_f, width_s, points, level = 0, debug = false ) {
	base_line = lineFromPoints( points[1], points[2] );
	//center_line = perpendicularLineThrough( base_line, points[0] );
	center_line = midpointOfLineThrough( points[2], points[1], points[0] );
	
	mPoint = midpoint( points[2], points[1] );
	
	center1 = shift_line( center_line, -width_s/2 );
	center2 = shift_line( center_line,  width_s/2 );
	arc_line1 = lineFromPoints( points[0], points[1] );
	arc_line2 = lineFromPoints( points[0], points[2] );
	
	p4 = midpoint( points[1], points[2] );
	p5 = line_intersection( center1, base_line );
	p6_1 = line_intersection( center1, arc_line1 );
	p6_2 = line_intersection( center1, arc_line2 );
	p7 = line_intersection( center2, base_line );
	p8_1 = line_intersection( center2, arc_line1 );
	p8_2 = line_intersection( center2, arc_line2 );
	area = triangleArea( points );
	if( debug == true || level == 0 || ( area > 26.0944 && area < 26.0945 )) {
		echo(" !!!!!!!!!!!!!!!!!!!!!!!! ");
	echo( "area  ",area);
		echo("level  ",level);
		echo("w/2    ",width_s/2);
		echo("points0",points[0] );
		echo("points1",points[1] );
		echo("points2",points[2] );
		echo("mpoint ", mPoint );
		echo("base   ",base_line);
		echo("center ",center_line);
		echo("center1",center1);
		echo("center2",center2);
		echo("arc1   ",arc_line1);
		echo("arc2   ",arc_line2);
		// echo("p4     ",p4);
		echo("p5     ",p5);
		// echo("p6_1   ",p6_1);
		// echo("p6_2   ",p6_2);
		// echo("p7     ",p7);
		// echo("p8_1   ",p8_1);
		// echo("p8_2   ",p8_2);
		// echo("dist1 7",distSqre( points[1], p7 ));
		// echo("dist1 5",distSqre( points[1], p5 ));
	}
	if( area > 26.07 ) {
		if( distSqre( points[1], p7 ) < distSqre( points[1], p5 ) ) {
			tesalate(thickness_f, width_s*shrink, [p5,points[2],p6_2], level+1);
			tesalate(thickness_f, width_s*shrink, [p7,p8_1,points[1]], level+1);
		} else {
			tesalate(thickness_f, width_s*shrink, [p7,points[2],p8_2], level+1);
			tesalate(thickness_f, width_s*shrink, [p5,p6_1,points[1]], level+1);
		}

	} else {
		//echo("RENDER@@@@@@@@@@@@@ ");
		if( area > 22.8061 && area < 22.8062 ) 
		{
	#	linear_extrude(height=thickness_f+0.2) polygon(points);
		} else {
		linear_extrude(height=thickness_f+0.2) polygon(points);
		}
	}
}

module tesalate_triangle( thickness_f, width_s, points_noShift, points, level = 0, shrink = 0.74, debug = false ) {
	use_width = level == 0 ? width_s : width_s * pow(shrink,level);
	
	baseSeg_noShift = lineSegFromPoints( points_noShift[1], points_noShift[2] );
	mPoint_noShift = midpoint( points_noShift[2], points_noShift[1] );
	centerSeg_noShift = lineSegFromPoints(mPoint_noShift,points_noShift[0]);

	baseSeg = lineSegFromPoints( points[1], points[2] );
	
	mPoint = midpoint( points[2], points[1] );
	centerSeg = lineSegFromPoints(mPoint,points[0]);
	
	cenSeg1 = shiftLineSeg( centerSeg_noShift, -use_width/2 );
	cenSeg2 = shiftLineSeg( centerSeg_noShift,  use_width/2 );
	arcSeg1 = lineSegFromPoints( points[0], points[1] );
	arcSeg2 = lineSegFromPoints( points[0], points[2] );
	
	p4 = midpoint( points[1], points[2] );
	p5 = lineSegIntersection( cenSeg1, baseSeg );
	p6_1 = lineSegIntersection( cenSeg1, arcSeg1 );
	p6_2 = lineSegIntersection( cenSeg1, arcSeg2 );
	
	p7 = lineSegIntersection( cenSeg2, baseSeg );
	p8_1 = lineSegIntersection( cenSeg2, arcSeg1 );
	p8_2 = lineSegIntersection( cenSeg2, arcSeg2 );
	
	arcSeg1_noShift = lineSegFromPoints( points_noShift[0], points_noShift[1] );
	arcSeg2_noShift = lineSegFromPoints( points_noShift[0], points_noShift[2] );
	
	p5_noS = lineSegIntersection( centerSeg_noShift, baseSeg_noShift );
	p6_1_noS = lineSegIntersection( centerSeg_noShift, arcSeg1_noShift );
	p6_2_noS = lineSegIntersection( centerSeg_noShift, arcSeg2_noShift );
	
	area = triangleArea( points );
	if( debug == true ) {
		echo(" !!!!!!!!!!!!!!!!!!!!!!!! ");
	echo( "area  ",area);
		echo("level  ",level);
		echo("w/2    ",width_s/2);
		echo("points0",points[0] );
		echo("points1",points[1] );
		echo("points2",points[2] );
		echo("mpoint ", mPoint );
		echo("base   ",baseSeg);
		echo("center ",centerSeg);
		echo("center1",cenSeg1);
		echo("center2",cenSeg2);
		echo("arc1   ",arcSeg1);
		echo("arc2   ",arcSeg2);
		echo("p4     ",p4);
		echo("p5     ",p5);
		echo("p6_1   ",p6_1);
		echo("p6_2   ",p6_2);
		echo("p7     ",p7);
		echo("p8_1   ",p8_1);
		echo("p8_2   ",p8_2);
		echo("dist1 7",distSqre( points[1], p7 ));
		echo("dist1 5",distSqre( points[1], p5 ));
	}
	if( area > 25 ) {//&& level < 6){
		if( distSqre( points[1], p7 ) < distSqre( points[1], p5 ) ) {
			tesalate_triangle(thickness_f, width_s, [p5_noS,points_noShift[2],p6_2_noS], [p5,points[2],p6_2], level+1, shrink);
			tesalate_triangle(thickness_f, width_s, [p5_noS,p6_1_noS,points_noShift[1]], [p7,p8_1,points[1]], level+1, shrink);
		} else {
			tesalate_triangle(thickness_f, width_s, [p5_noS,points_noShift[2],p6_2_noS], [p7,points[2],p8_2], level+1, shrink);
			tesalate_triangle(thickness_f, width_s, [p5_noS,p6_1_noS,points_noShift[1]], [p5,p6_1,points[1]], level+1, shrink);
		}

	} else {
		linear_extrude(height=thickness_f+0.2) polygon(points);
	}
}


function testline( a, b ) = (!not_PoM_inf(a) && b < 0 ) || (!not_PoM_inf(b) && a < 0 ) || (a > 0.0 && b > 0.0) || (a == 0.0 && b > 0.0);
function seg_seg_intersection( r1p1, r1p2, r2p1, r2p1 ) = 0;

function lineFromPointsSlope(p1,p2) = (p1[1]-p2[1])/(p1[0]-p2[0]);
//create a line from 2 points ie v[0] is m or slope, and v[1] is b or y intercept
//  if v[0] is +/- inf, ie vertical line v[0] is the x-intercept
function lineFromPoints( p1, p2 ) = (p1[0]!=p2[0])?[lineFromPointsSlope(p1,p2),-lineFromPointsSlope(p1,p2)*p1[0]+p1[1]]:[1/0,p1[0]];

function lineSegFromPoints( p1, p2 ) = [p1,p2];
//check to see is the value is not +/- inf
function not_PoM_inf(v) = (v!=1/0 && v!=-1/0 );//&& v < 100000000000000);// && v > -1e10;
												//  (   y4    -    y3  )   * (   x2     -    x1   )   -  (   x4    -    x3  )   * (   y2     -    y1   ) 
function lineSegIntersectionU_Denom( ls1, ls2 ) = ((ls2[1][1] - ls2[0][1]) * (ls1[1][0] - ls1[0][0]) )-((ls2[1][0] - ls2[0][0]) * (ls1[1][1] - ls1[0][1]) );
												//  (   x4    -    x3  )   * (   y1     -    y3   )   -  (   y4    -    y3  )   * (   x1     -    x3   ) 
function lineSegIntersectionUaNumer( ls1, ls2 ) = ((ls2[1][0] - ls2[0][0]) * (ls1[0][1] - ls2[0][1]) )-((ls2[1][1] - ls2[0][1]) * (ls1[0][0] - ls2[0][0]) );
												//  (   x2    -    x1  )   * (   y1     -    y3   )   -  (   y2    -    y1  )   * (   x1     -    x3   ) 
function lineSegIntersectionUbNumer( ls1, ls2 ) = ((ls1[1][0] - ls1[0][0]) * (ls1[0][1] - ls2[0][1]) )-((ls1[1][1] - ls1[0][1]) * (ls1[0][0] - ls2[0][0]) );

function lineSegIntersectionUa(ls1,ls2) = lineSegIntersectionUaNumer(ls1,ls2) / lineSegIntersectionU_Denom(ls1,ls2);

function lineSegIntersection( ls1,ls2 ) = [ls1[0][0]  + lineSegIntersectionUa(ls1,ls2) * (ls1[1][0]-ls1[0][0]),
											ls1[0][1]  + lineSegIntersectionUa(ls1,ls2) * (ls1[1][1]-ls1[0][1])];
											
function lineSegSlope( ls ) = (ls[1][1] - ls[0][1])/(ls[1][0] - ls[0][0]);
function lineSegShiftAmtX( ls, d ) = cos(atan(-1/lineSegSlope( ls )))*d;
function lineSegShiftAmtY( ls, d ) = sin(atan(-1/lineSegSlope( ls )))*d;
function lineSegShiftAmt( ls, d ) = [lineSegShiftAmtX( ls, d ),lineSegShiftAmtY( ls, d ) ];
function shiftLineSeg( ls, d ) = ls + [lineSegShiftAmt( ls, d ),lineSegShiftAmt( ls, d )];											
											
function line_intersectionX( l1,l2 ) = (l2[1]-l1[1])/(l1[0]-l2[0]);
//find the x,y point of intersection of 2 lines int the [m,b] form, assumes there is one and only one
function line_intersection( l1,l2 ) = (not_PoM_inf(l1[0]) && not_PoM_inf(l2[0]))?
										[line_intersectionX( l1,l2 ), (l1[0] * line_intersectionX( l1,l2 )) + l1[1] ]:
										(not_PoM_inf(l1[0])?[l2[1],l1[0]*l2[1]+l1[1]]:
															[l1[1],l2[0]*l1[1]+l2[1]]);
//	x = (b2 - b1) / (m1 - m2);
//	y = m1 * x + b1;
function is_parrallel( l1,l2 ) = l1[0] == l2[0]?true:false;

//translate a line d units perpendicular to the slope of the line l
function shift_line(l, d) = l+[0, (not_PoM_inf(l[0])?( -l[0]*cos(atan(-1/l[0]))*d + sin(atan(-1/l[0]))*d ):d) ];
function perpendicularLineThrough( l, p ) = not_PoM_inf(l[0])?(l[0]==0?[1/0,p[0]]:[-1/l[0], p[0]/l[0]+p[1] ]):[0,p[1]];
function midpoint( a,b ) = (a+b)/2;
function midpointOfLineThrough( a,b, p ) = lineFromPoints( midpoint( a,b ), p );

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

function trianglePerimeter(p1,p2,p3) = dist( p1,p2 ) + dist( p2,p3 ) + dist( p3,p1 );
function trianglePointsArea( p1,p2,p3 ) = sqrt(trianglePerimeter(p1,p2,p3)/2 * 	(trianglePerimeter(p1,p2,p3)/2 - dist( p1,p2 )) * 
																				(trianglePerimeter(p1,p2,p3)/2 - dist( p2,p3 )) * 
																				(trianglePerimeter(p1,p2,p3)/2 - dist( p3,p1 )) );
function triangleArea( t ) = trianglePointsArea( t[0], t[1], t[2] );
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