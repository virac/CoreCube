include <utils.scad>

frame_width = 20;
bracket_length = 120;
bracket_thickness = 4;

module braced_5_hole_T_bracket( width, length, thickness ) {
	union(){
		braced_4_hole_L_bracket( width, (length - width) / 2 + width, thickness );
		scale( [1,-1,1] )
			braced_4_hole_L_bracket( width, (length - width) / 2 + width, thickness );
	}
}


braced_5_hole_T_bracket(frame_width,bracket_length, bracket_thickness);