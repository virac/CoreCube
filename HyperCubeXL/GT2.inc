GT2_P = 2;
GT2_R1 = 0.15;
GT2_R2 = 1.00;
GT2_R3 = 0.555;
GT2_b = 0.40;
GT2_H = 1.38;
GT2_h = 0.75;
GT2_i = 0.63;


function calcX() = GT2_R1/tan(asin(GT2_R1/(GT2_R1+GT2_R2)));


module drawCircleMaskFlatR2()
{
    translate([0,GT2_R3]) difference()
    {
        union()
        {   
            translate([-bigSize/2,-bigSize]) square([bigSize,bigSize]);
        }
        union()
        {
            translate([GT2_b,GT2_h-GT2_R3]) circle(GT2_R2);            
            translate([GT2_R3+eps,-bigSize/2]) square([bigSize,bigSize]);
            translate([eps,-bigSize/2]) square([bigSize,bigSize]);
        }
    }
}


module drawCircleMaskFlatR3()
{
    translate([0,GT2_R3]) difference()
    {
        union()
        {   
            translate([-bigSize/2,-bigSize]) square([bigSize,bigSize]);
        }
        union()
        {
            circle(GT2_R3);
            translate([GT2_R3+eps,-bigSize/2]) square([bigSize,bigSize]);
            translate([eps,-bigSize/2]) square([bigSize,bigSize]);
            // approximation
            translate([-bigSize/2,-GT2_R3/2]) square([bigSize,bigSize]);                        
        }
    }
}


module drawBeltFlatHalf()
{
    difference()
    {
        union()
        {
            translate([-eps-GT2_P/2,0]) square([GT2_P/2+2*eps,GT2_H]);
        }
        union()
        {
            translate([-bigSize/2,GT2_H]) square([bigSize,bigSize]);
            translate([eps,-bigSize/2]) square([bigSize,bigSize]);
            translate([-eps-GT2_P/2-bigSize,-bigSize/2]) square([bigSize,bigSize]);
            drawCircleMaskFlatR2();
            drawCircleMaskFlatR3();
            
            x = calcX();
            translate([-x+GT2_b,GT2_H-GT2_i-GT2_R1]) circle(GT2_R1);
            translate([-bigSize-x+GT2_b,-bigSize+GT2_h]) square([bigSize,bigSize]);            
        }
    }
}


module drawBeltFlat()
{
    drawBeltFlatHalf();
    mirror([1,0,0]) drawBeltFlatHalf();
}


module drawTimingBeltUnit(prmBeltWidth) 
{
    linear_extrude(height = prmBeltWidth, convexity = 10, twist = 0) drawBeltFlat();
}
