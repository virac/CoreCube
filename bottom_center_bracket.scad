include <utils.scad>

frame_width = 20;
bracket_length = 70;
bracket_thickness = 4;


braced_4_hole_L_bracket(frame_width,bracket_length, bracket_thickness);
scale([1,-1,1]) braced_4_hole_L_bracket(frame_width,bracket_length, bracket_thickness);
scale([-1,1,1]) braced_4_hole_L_bracket(frame_width,bracket_length, bracket_thickness);
scale([-1,-1,1]) braced_4_hole_L_bracket(frame_width,bracket_length, bracket_thickness);
