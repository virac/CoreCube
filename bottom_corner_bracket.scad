include <utils.scad>

frame_width = 20;
bracket_length = 70;
bracket_thickness = 4;

module braced_5_hole_L_bracket( width, length, thickness ) {
	difference() {
		braced_L_bracket(width, length, thickness);
		through_hole(0,0,2.8,10);
		through_hole(0,length-width,2.8,10);

		through_hole(0,(length-width)/2,2.8,10);

		through_hole((length-width)/2,0,2.8,10);
		through_hole(length-width,0,2.8,10);
	}
}

braced_5_hole_L_bracket(frame_width,bracket_length, bracket_thickness);