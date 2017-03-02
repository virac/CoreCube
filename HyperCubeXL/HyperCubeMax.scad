$fn = 250;
eps = 0.01;
bigSize = 500;
smallSize = 100;


// personal settings
USE_PROJUNK_PREFS = 0;


// ********* Alu profile selection
//include <ALU_PROFILE_15x15.inc>
include <ALU_PROFILE_20x20.inc>
//include <ALU_PROFILE_30x30.inc>
//include <ALU_PROFILE_40x40.inc>


// if set to true, slots will be created instead of circular holes
useHammerNuts = false;


// ********* Screw/Nut selection
include <M3.inc>
//include <M4.inc>



// ********* Bearing selection
include <BEARINGS.inc>
BearingX = LM10UU;
BearingY = LM10UU;
BearingZ = LM10UU;


// ********* Bearing selection
include <FLANGE_BEARINGS.inc>
smallFB = Pully2GT16T;
bigFB = Pully2GT16T;


// ********* Nema selection
include <NEMAS.inc>
motorXY = NEMA17; //NEMA23;
motorZ = NEMA17;  //NEMA14;


// colors
colorAlu = "Silver";
colorPlastic = "Lime";
colorBronze = "Gold";
colorSteel1 = "SteelBlue";
colorSteel2 = "LightSteelBlue";
colorHeatedBed = "Orange";
colorEnclosingPanel = "LightCyan";
colorTopDome = "SlateBlue";
colorBottomPanel = "SaddleBrown";


// WASHER TYPES
FLAT_WASHER = 0;//leave flat space for washer
PLASTIC_WASHER = 1;//use printed washers
INSERT_WASHER = 2;//leave half depth for inset washer

plasticWashers = FLAT_WASHER; 


// printability corrections; values should be zero for real object dimensions 
PRINTABLE = 1;
correction_BearingRadius = PRINTABLE ? 1.0 : 0.0;
correction_BearingLength = PRINTABLE ? 1.5 : 0.0;
correction_FlangeBearingLength = PRINTABLE ? 1.0 : 0.0;
correction_NutRadius = PRINTABLE ? 0.3 : 0.0;


// clearances
clearanceMovingParts = 10.0;
clearanceFixedParts = 5.0;
clearanceFixedPartsSmall = 0.5;
clearanceFloor = USE_PROJUNK_PREFS ? 45.0 : 10.0;
clearanceYRod = 1.0;
clearanceXRod = wAlu1/4;
clearanceBearing = 2.0;
clearanceFlangeBearing = 0.3;
clearanceBelt = 3.0;
clearanceBeltSmall = 1.0;
clearanceXYIdler = 1.0;
clearanceScrew = 1.0;
clearanceNut = 0.1;
clearanceHammerNut = 0.2;
clearanceLeadScrew = 4.0;
clearanceScaleFactor = 1.05;
clearanceHeaterBlock = 5.0;
clearanceHinge = 0.25;
clearanceBottomPanel = 1.0;
clearanceMicroSwitch = 2.0;
clearanceWireHolder = 0.2;
minClearanceYCarriageClamp = 1.5;

yCarriageSeparation = 0;

// sample values for extruder dimensions
hExtruder = 150;
wExtruder = 130.0;
dExtruder = 45.0;
hHotEnd = 46.0;
hTipHotEnd = 4.0;
rHotEnd = 16.0/2;
hHeaterBlock = 13;
overhangExtruderBeneathXCarriage = hHeaterBlock + clearanceHeaterBlock;


// alu profile
wAluCenter = wAlu1 - 2*wAlu3;
lAluCenter = wAlu3;
tAluCenter = rAlu/2;
wAluCorner1 = wAlu1/2 - wAlu2/2;
tAluCorner1 = 0.13*wAluCorner1;
tAluCorner2 = 1.8*tAluCorner1;
wAluCornerInner = 0.6*wAluCorner1-2*tAluCorner1;
lAluCorner = wAluCorner1-wAluCornerInner-2*tAluCorner1;


// GT2 belt
wBelt = 6.0;
include <GT2.inc>


// coupler
lCoupler = 25;
rCouplerOuter = 14.0/2;
rCouplerInner1 = 5.0/2;
rCouplerInner2 = 8.0/2;


// lead screw nut
rLeadScrewNut1 = 22.0/2;
rLeadScrewNut2 = 16.0/2;
rLeadScrewNut3 = 10.2/2;
rLeadScrewNut4 = 8.0/2;
rLeadScrewNutHole = 3.5/2;
hLeadScrewNut1 = 1.5;
hLeadScrewNut2 = 3.5;
hLeadScrewNut3 = 10.0;
nrOfLeadScrewNutHoles = 4;


// mk3 heatedbed
tHeatedBed = 3.4;
wHeatedBedX = 213;
wHeatedBedY = wHeatedBedX;
rHeatedBedHole = 2.9/2;
rHeatedBedCenterHole = 2.0/2;
distHeatedBedHolesX = wHeatedBedX-5;
distHeatedBedHolesY = wHeatedBedY-5;


// distance heatedbed to bedclamp (space for spring)
distHeatedBedtoBedClamp = 15.0;


// lead screw mount
tLeadScrewNutMount = tPlastic;
distLeadScrewNutMountHoles = 2*rLeadScrewNut1 + 2*tLeadScrewNutMount + 2*rAluScrew+calcScrewFlesh(rAluScrew);
rLeadScrewNutMount = rLeadScrewNut3 + 0.5;
wLeadScrewNutMount = distLeadScrewNutMountHoles + 2*rAluScrew+calcScrewFlesh(rAluScrew);
rLeadScrewBigCoupler = 26.0/2;


// bed clamp
tBedClamp = tPlastic;
wBedClamp = max(2*rAluScrew+calcScrewFlesh(rAluScrew),lAluHammerNut/2);
rBedClampHole = rHeatedBedHole;
offsetBedClampHole = 8.0;


// GT2 Pulley 20 teeth
rPulley1 = 9.75/2;
rPulley2 = 14.0/2;
rPulley3 = 12.0/2;
rPulley4 = 5.0/2;
hPulley1 = 8;
hPulley2 = 9;
hPulley3 = 16;
hPulley4 = 17;


// Z-carriage
tZCarriage = tPlastic;
tZCarriageSmall = tPlastic/2;
hZCarriage = tZCarriage + getRBearingOuter(BearingZ);
wZCarriage = 2*getRBearingOuter(BearingZ) + 4*rScrew + 2*calcScrewFlesh(rScrew);
lZCarriage = 2*getLBearing(BearingZ) + 2*tZCarriage;
rZCarriage = rAluScrew + 1.5*calcScrewFlesh(rAluScrew)/2;
filletZCarriage = rZCarriage/2;
distZCarriageHoles = wZCarriage + 2*rAluWasher;


// Z-carriage clamp
reductionZCarriageClamp = 0.1*getRBearingOuter(BearingZ);
hZCarriageClamp = getRBearingOuter(BearingZ)+tZCarriage-reductionZCarriageClamp;



// required print height
maxBuildHeight = 300.0;


// handy distance variables (part1)
distanceLeadScrewToAluProfile = distZCarriageHoles/2+rZCarriage+clearanceMovingParts;
distanceFloorToTopAluProfile = clearanceFloor + getHNema(motorZ);


// Z-Motor mount
tZMotorMount = tPlastic;
wZMotorMount1 = getW1Nema(motorZ) + 2*tZMotorMount + 2*clearanceFixedPartsSmall;
wZMotorMount2 = wZMotorMount1 + 4*rAluScrew + 2*calcScrewFlesh(rAluScrew);
lZMotorMount1 = getW1Nema(motorZ)/2 + distanceLeadScrewToAluProfile - tZMotorMount;
lZMotorMount2 = wAlu1 + tZMotorMount;
rZMotorMountNema = getRCylinderNema(motorZ) + clearanceFixedPartsSmall;
distZMotorMountHoles = wZMotorMount2 - 2*rAluScrew - calcScrewFlesh(rAluScrew);


// Z-Bearing mount
tZBearingMount = tPlastic;
tZBearingMountThick = 2*rScrew + calcScrewFlesh(rScrew);
wZBearingMount1 = 2*getRFlangeBearing(F608ZZ) + 2*tZBearingMount + 2*clearanceFixedPartsSmall;
wZBearingMount2 = 4*rAluScrew + 2*calcScrewFlesh(rAluScrew);
wZBearingMount = max(wZBearingMount1,wZBearingMount2);
cutWidthZBearingMount = 2.0;
cutDepthZBearingMount = 0.4*wZBearingMount;
filletZBearingMount = rAluScrew;


// Z-Rod mount 
tZRodMount = tPlastic;
tZRodMountThick = 2*rScrew + calcScrewFlesh(rScrew);
wZRodMount = 2*getRBearingInner(BearingZ)+calcScrewFlesh(getRBearingInner(BearingZ));
cutWidthZRodMount = 2.0;
cutDepthZRodMount = 0.4*wZRodMount;
filletZRodMount = rAluScrew;



// Y-carriage
tYCarriage = tPlastic;
tYCarriageSmall = tPlastic/2;
hYCarriage = tYCarriage + getRBearingOuter(BearingY);
wYCarriageBottomPart = 2*getRBearingOuter(BearingY) + 4*rScrew + 2*calcScrewFlesh(rScrew);
wYCarriageTopPart = 3*tYCarriage + getHeightFlangeBearing(smallFB) + wBelt + 2*clearanceBelt;
wYCarriage = max(wYCarriageBottomPart, wYCarriageTopPart);
distYCarriageFlangeBearingHoles = 2*getRFlangeBearing(smallFB);
lYCarriageTopPart = distYCarriageFlangeBearingHoles + 2*getRFlangeBearingInner(smallFB) + calcScrewFleshSmallFB();
hYCarriageTopPart1 = clearanceBearing + getRFlangeBearing(smallFB) + distYCarriageFlangeBearingHoles + getRFlangeBearingInner(smallFB) + calcScrewFleshSmallFB()/2;
hYCarriageTopPart2 = wBelt + 2*clearanceBelt + tYCarriageSmall + getHeightFlangeBearing(smallFB) + getRFlangeBearingInner(smallFB) + calcScrewFleshSmallFB()/2;
hYCarriageTopPart = max(hYCarriageTopPart1,hYCarriageTopPart2);
lYCarriage = 2*getLBearing(BearingY) + 2*tYCarriage+yCarriageSeparation;
rYCarriage = getRBearingInner(BearingX) + calcScrewFlesh(getRBearingInner(BearingX))/2;
filletYCarriage = rYCarriage/2;
distBetweenXRods = wYCarriage + 2*rYCarriage + calcScrewFlesh(getRBearingInner(BearingX));
cutWidthYCarriage = 2.0;
cutDepthYCarriage = 0.8*rYCarriage;
distYCarriageCenterFlangeBearingToCenterFlangeBearing = wYCarriageTopPart - 2*tYCarriage - 2*getHeightFlangeBearing(smallFB)/2;
distHeartYRodToFlangeBearingHole = hYCarriage + hYCarriageTopPart - getRFlangeBearingInner(smallFB) - calcScrewFleshSmallFB()/2 - distYCarriageFlangeBearingHoles;
distHeartXRodToFlangeBearingHole = lYCarriageTopPart - getRFlangeBearingInner(smallFB) - calcScrewFleshSmallFB()/2;
//echo("distBetweenXRods", distBetweenXRods);

// Max Y-carriage
distBetweenYMaxRods = distBetweenXRods + 2*(rYCarriage + wYCarriage/2 + cutWidthYCarriage);
wYMaxCarriageConnector = distBetweenYMaxRods + wYCarriage;
lYMaxCarriageConnector = lYCarriage/2 - rYCarriage-cutWidthYCarriage;
//hYMaxCarriageConnector = hYCarriage;

// Y-carriage clamp
reductionYCarriageClamp = 0.1*getRBearingOuter(BearingY);
hYCarriageClamp = getRBearingOuter(BearingY)+tYCarriage-reductionYCarriageClamp;


// Y-Rod mount
wouldBeClearanceYCarriageClamp = wAlu1/2 - hYCarriageClamp - reductionYCarriageClamp;
//echo("wouldBeClearanceYCarriageClamp", wouldBeClearanceYCarriageClamp);
distYRodToMidSideAluProfile = (wouldBeClearanceYCarriageClamp >= minClearanceYCarriageClamp) ? 0 : minClearanceYCarriageClamp-wouldBeClearanceYCarriageClamp;
//echo("distYRodToMidSideAluProfile", distYRodToMidSideAluProfile);
tYRodMount = tPlastic;
tYRodMountThick = 2*rScrew + calcScrewFlesh(rScrew);
rYRodMount = getRBearingInner(BearingY)+calcScrewFlesh(getRBearingInner(BearingY))/2;
wYRodMount = 2*rAluScrew+calcScrewFlesh(rAluScrew); 
temp_lYRodMount = 2*getRBearingInner(BearingY)+calcScrewFlesh(getRBearingInner(BearingY)) + 2*(2*rAluScrew+calcScrewFlesh(rAluScrew));

cutWidthYRodMount = 2.0;
overhangYRodMount = distYRodToMidSideAluProfile + getRBearingInner(BearingY)+2*rScrew+calcScrewFlesh(rScrew) + calcExtraDistanceYRodMount() - wAlu1/2;
//echo("overhangYRodMount", overhangYRodMount);



// XY Idler
tXYIdler = tPlastic;
temp_lXYIdler = 2*tXYIdler+wYCarriageTopPart-2*tYCarriageSmall;
wXYIdler = wAlu1 - clearanceXYIdler;
hXYIdlerExtension = 2.2;

lYRodMount = max(temp_lYRodMount,temp_lXYIdler);
lXYIdler = lYRodMount;
distYRodMountHoles = lYRodMount - 2*rAluScrew-calcScrewFlesh(rAluScrew);

// XY Motor mount
tXYMotorMount = tPlastic;
wXYMotorMount1 = getW1Nema(motorXY) + max(tXYMotorMount,tZRodMountThick) + clearanceFixedPartsSmall;
wXYMotorMount2 = wXYMotorMount1 + 4*rAluScrew + 2*calcScrewFlesh(rAluScrew);
distBeltToYRod = distHeartYRodToFlangeBearingHole + distYCarriageFlangeBearingHoles - getRFlangeBearingOuter(smallFB);
//echo("distBeltToYRod",distBeltToYRod);
lXYMotorMount = distBeltToYRod + distYRodToMidSideAluProfile - wAlu1/2 + getW1Nema(motorXY)/2 - rPulley3;
//echo("lXYMotorMount",lXYMotorMount);
rXYMotorMountNema = getRCylinderNema(motorXY) + clearanceFixedPartsSmall;
distXYMotorMountHoles = 0.8*getHNema(motorXY) - 2*rAluScrew + calcScrewFlesh(rAluScrew);
distYRodToTopMotorLeft = getHCylinderNema(motorXY) + getHAxleNema(motorXY) - (hPulley2 -hPulley1) - (hPulley3 -hPulley2)/2 - distYCarriageCenterFlangeBearingToCenterFlangeBearing/2;
distYRodToTopMotorRight = distYRodToTopMotorLeft + distYCarriageCenterFlangeBearingToCenterFlangeBearing;
//echo("distYRodToTopMotorLeft",distYRodToTopMotorLeft);
//echo("distYRodToTopMotorRight",distYRodToTopMotorRight);



// X Carriage
tXCarriage = tPlastic;
tXCarriageSmall = tPlastic/2;
hXCarriage = tXCarriage + getRBearingOuter(BearingX);
wXCarriage = distBetweenXRods + 2 * getRBearingOuter(BearingX) + 4*rScrew + 2*calcScrewFlesh(rScrew);
lXCarriage = 2*getLBearing(BearingX) + 2*tXCarriage;
wXCarriageBeltClamp = 2*rScrew + calcScrewFlesh(rScrew);
wXCarriageBeltClampImprint = 1.5*floor(wXCarriageBeltClamp);
tXCarriageBeltClamp = tPlastic;
nrOfImprintTooth = floor(wXCarriageBeltClampImprint/GT2_P);
wXCarriageBeltClampImprintCorrected = nrOfImprintTooth * GT2_P;
clampForceXCarriageBelt = 0.60;


// X-carriage clamp
reductionXCarriageClamp = 0.1*getRBearingOuter(BearingX);
hXCarriageClamp = getRBearingOuter(BearingX)+tXCarriage-reductionXCarriageClamp;



// microswitch
lMicroSwitch = 20.0;
wMicroSwitch = 7.0;
hMicroSwitch = 16.0;
rMicroSwitchScrew = 2.5/2;
distMicroSwitchMountHoles = 9.5;
offsetMicroSwitchMountHole = 7.0;


// y endstop mount
tYEndstopMount = 4.0;
tYEndstopClampForce = 1.0;


// x endstop mount
tXEndstopMount = 3.0;
tXEndstopClampForce = 6.0;


// wire holder clip
hTieRap = 1.5;
wTieRap = 4.0;
clampForceWireHolderClip = 0.5;
tWireHolderClipBottom = 2.0;
tWireHolderClipMid = wAluScrewSlot-clampForceWireHolderClip;
tWireHolderClipTopCone = 1.0;
tWireHolderClipTop = 0.5;
overlapWireHolderClip = 1.0;
lWireHolderClip = 0.6*(wAlu1 + wAlu2);
wWireHolderClip = 0.3*(wAlu1 + wAlu2);
rWireHolderClip = wAlu2/2 - clearanceWireHolder;


// Extruder mount hole
distExtruderMountHoles = 30.0;
rExtruderMountHole = 4.0/2;
rExtruderNut = 7.6/2;
tExtruderNut = 5.0;


// handy distance variables (part2)
distanceSurfaceHeatedBedToFloor = distanceFloorToTopAluProfile + tZMotorMount + distHeatedBedtoBedClamp + wAlu1 + tHeatedBed;
minDistanceYRodToTopAluProfile = distBetweenXRods/2 + rYCarriage+clearanceMovingParts;
distanceYRodToTopAluProfile = max(lYRodMount/2+hAluCornerPiece+clearanceFixedPartsSmall,minDistanceYRodToTopAluProfile);
//echo("minDistanceYRodToTopAluProfile",minDistanceYRodToTopAluProfile);
//echo("distanceYRodToTopAluProfile",distanceYRodToTopAluProfile);
distanceLeadScrewToBedHole1 = distZCarriageHoles/2+rZCarriage+wBedClamp/2+clearanceFixedPartsSmall;
distanceLeadScrewToBedHole2 = dExtruder/2 + hXCarriage + hXCarriageClamp + reductionXCarriageClamp + wZRodMount/2 + clearanceMovingParts;
distanceLeadScrewToBedHole = max(distanceLeadScrewToBedHole1, distanceLeadScrewToBedHole2);



// extrusion lengths bed
extrusionLengthBedX = distHeatedBedHolesX-2*offsetBedClampHole-2*tBedClamp-2*wAlu1;
extrusionLengthBedY = wBedClamp/2+distHeatedBedHolesY+distanceLeadScrewToBedHole+distZCarriageHoles/2+max(rZCarriage,lAluHammerNut/2);
echo("extrusionLengthBedX",extrusionLengthBedX);
echo("extrusionLengthBedY",extrusionLengthBedY);


// handy distance variables (part3)
distanceLeadScrewToZRod = extrusionLengthBedX/2 + wAlu1 + hZCarriage;
echo("distanceLeadScrewToZRod",distanceLeadScrewToZRod);


// extrusion lengths frame
extrusionLengthX1 = 2*distanceLeadScrewToZRod + wZRodMount + 2*hAluCornerPiece + 2*clearanceFixedPartsSmall;
extrusionLengthX2 = 2*(distYRodToMidSideAluProfile+distHeartYRodToFlangeBearingHole+distYCarriageFlangeBearingHoles+getRFlangeBearingInner(smallFB)+calcScrewFleshSmallFB()/2) + max(lXCarriage,wExtruder) + 2*clearanceMovingParts + wHeatedBedX - wAlu1;
recommendedExtrusionLengthX = max(extrusionLengthX1,extrusionLengthX2);
// check if heated bed fits within the XY motors; if it fits then the y extrusion can be shortened by the motor mount width
remainingDistanceBetweenMotors = recommendedExtrusionLengthX - 2*calcLengthXYMotorMount() - 2*calcOffsetXYMotorMount() - wHeatedBedX - wExtruder;
//`"remainingDistanceBetweenMotors", remainingDistanceBetweenMotors);
spaceNeededForMotorMount = (remainingDistanceBetweenMotors > clearanceMovingParts) ? 0 : wXYMotorMount1;
extrusionLengthY1 = spaceNeededForMotorMount + wHeatedBedY + 2*clearanceMovingParts + dExtruder + hXCarriage + lYCarriage/2 + tYRodMountThick;
extrusionLengthY2 = extrusionLengthBedY + 2*clearanceMovingParts + dExtruder/2 + spaceNeededForMotorMount;
//echo("extrusionLengthY1",extrusionLengthY1);
//echo("extrusionLengthY2",extrusionLengthY2);
recommendedExtrusionLengthY = max(extrusionLengthY1,extrusionLengthY2);
recommendedExtrusionLengthZ = distanceSurfaceHeatedBedToFloor + maxBuildHeight + overhangExtruderBeneathXCarriage + wXCarriage/2 + distBetweenXRods/2 + distanceYRodToTopAluProfile + wAlu1/2;


// preferred rounded values for projunk
extrusionLengthX = USE_PROJUNK_PREFS ? 455 : recommendedExtrusionLengthX;
extrusionLengthY = USE_PROJUNK_PREFS ? 370 : recommendedExtrusionLengthY;
extrusionLengthZ = USE_PROJUNK_PREFS ? 630 : recommendedExtrusionLengthZ;

echo("extrusionLengthX",extrusionLengthX);
echo("extrusionLengthY",extrusionLengthY);
echo("extrusionLengthZ",extrusionLengthZ);


// handy distance variables (part4)
distanceBetweenAluProfilesZ = extrusionLengthZ - wAlu1 - distanceFloorToTopAluProfile;


// lead screw
leadScrewLength = extrusionLengthZ - distanceFloorToTopAluProfile - getHAxleNema(motorZ) - getHCylinderNema(motorZ) - clearanceLeadScrew;
echo("leadScrewLength",leadScrewLength);


// length rods
extraLengthZRod = wAlu1/2;
ZRodLength = extrusionLengthZ - wAlu1 - distanceFloorToTopAluProfile + 2*(tZRodMountThick-tZRodMount)+extraLengthZRod;
YRodLength = extrusionLengthY - 2*clearanceYRod;
XRodLength = extrusionLengthX + 2*wAlu1 - 2*clearanceXRod;
echo("XRodLength",XRodLength);
echo("YRodLength",YRodLength);
echo("ZRodLength",ZRodLength);


// outside frame dimensions
zHeightFrame = extrusionLengthZ;
xWidthFrame = extrusionLengthX + 2*wAlu1;
yWidthFrame = extrusionLengthY + 2*wAlu1;
echo("xWidthFrame",xWidthFrame);
echo("yWidthFrame",yWidthFrame);
echo("zHeightFrame",zHeightFrame);


// hinges
rHingeInner = rAluScrew;
rHingeOuter = rHingeInner + calcScrewFlesh(rHingeInner)/2;
tHinge = rHingeOuter;
lHinge = 4*rAluScrew + 2*calcScrewFlesh(rAluScrew);
wHinge = 2*rAluScrew + calcScrewFlesh(rAluScrew) + rHingeOuter;


// door knob
rDoorKnob = wNut/2 + calcScrewFlesh(wNut/2)/2;
offsetDoorKnobNut = 0.5 * tNut;
hDoorKnob = tNut + offsetDoorKnobNut + 2*clearanceNut;
rSphereDoorKnob = 1.5 * rDoorKnob;
distanceDoorKnob = wAlu1/2;



// enclosing panels
tEnclosingPanel = 8.5;
tFrontEnclosingPanel = 8.5;
tTopEnclosingPanel = 8.5;
tBottomEnclosingPanel = 8.5;
cornerScrewDistanceEnclosingPanel = wAlu1 + lAluHammerNut;
maxScrewDistanceEnclosingPanel = 150;
sidePanelWidth = yWidthFrame;
sidePanelHeight = zHeightFrame - distanceFloorToTopAluProfile + wAlu1;
echo("sidePanelWidth",sidePanelWidth);
echo("sidePanelHeight",sidePanelHeight);
backPanelWidth = xWidthFrame;
backPanelHeight = zHeightFrame - distanceFloorToTopAluProfile + wAlu1;
echo("backPanelWidth",backPanelWidth);
echo("backPanelHeight",backPanelHeight);
topPanelWidth = xWidthFrame;
topPanelHeight = yWidthFrame;
echo("topPanelWidth",topPanelWidth);
echo("topPanelHeight",topPanelHeight);
bottomPanelWidth = xWidthFrame;
bottomPanelHeight = yWidthFrame;
echo("bottomPanelWidth",bottomPanelWidth);
echo("bottomPanelHeight",bottomPanelHeight);
distHingeHolesToRotationAxis = rAluScrew + calcScrewFlesh(rAluScrew)/2 + rHingeOuter;
reductionFrontPanelHinge = wAlu1/2 + distHingeHolesToRotationAxis;
frontPanelWidth = xWidthFrame - reductionFrontPanelHinge;
frontPanelHeight = zHeightFrame - distanceFloorToTopAluProfile + wAlu1;
echo("frontPanelWidth",frontPanelWidth);
echo("frontPanelHeight",frontPanelHeight);


// hinge distances
maxHingeDistance = 250;
nrOfHinges = ceil((frontPanelHeight+maxHingeDistance/2)/maxHingeDistance);
distanceHinges = frontPanelHeight/(nrOfHinges-0.5);
endDistanceHinge = distanceHinges/4;


// Top dome
rTopDome = 0.95*min(wHeatedBedX,wHeatedBedY)/2;
tTopDome = 3.0;
tTopDomeMount = tPlastic;
rTopDomeFilamentEntry = 30.0;
echo("rTopDome",rTopDome);


// Spoolholder
tSpoolHolderArm = tPlastic;
tSpoolHolderBottom = 2*tPlastic;
offsetSpoolholderHoleX = 80;
offsetSpoolholderHoleY = 130;
rSpoolholderHole = 8.0/2;


// Camera mount
tCameraMount = tPlastic;
offsetCameraMountX = 110;
offsetCameraMountY = 20;


// greg extruder mount
tGregMount = 28.0;
wGregMount = 68.0;
hGregMount = 10.0;
hGregMountSupport = 10.0;
wGregMountSupport = 18.0;


// Shock absorber
wShockAbsorber = wAlu1 - 4.0;
tShockAbsorber = 15.0;
rShockAbsorber = 1.0;



function calcScrewFlesh(rScrew) = 2.5*rScrew;

function calcScrewFleshSmallFB() = 5.0*getRFlangeBearingInner(smallFB);



module drawFancyRounding(prmRadius)
{
	difference()
	{
		union()
		{
			translate([0,0,-smallSize/2]) cube([2*prmRadius,2*prmRadius,smallSize]);
		}
		union()
		{
			translate([0,0,-smallSize/2-eps]) cylinder(smallSize+2*eps,prmRadius,prmRadius,$fn=100);
		}
	}

}


module drawCornerFillet(prmRadius, prmHeight)
{
	difference()
	{
		union()
		{
			translate([0,0,0]) cube([prmRadius+eps,prmRadius+eps,prmHeight]);
		}
		union()
		{
			translate([0,0,-eps]) cylinder(prmHeight+2*eps,prmRadius,prmRadius,$fn=100);
		}
	}	
}


module drawScrewHole(h=smallSize)
{
	translate([0,0,-h/2]) cylinder(h, rScrew, rScrew);
}


module drawAluScrewHole(h=smallSize)
{
	translate([0,0,-h/2]) cylinder(h, rAluScrew, rAluScrew);
}


module drawAluScrewSlotHole(h=smallSize)
{
	hull()
	{
		translate([wAluScrewSlot/2,0,-h/2]) cylinder(h, rAluScrew, rAluScrew);
		translate([-wAluScrewSlot/2,0,-h/2]) cylinder(h, rAluScrew, rAluScrew);
	}
}


module drawAluOpenScrewHole(h=smallSize)
{
	translate([0,0,-h/2]) cylinder(h, rAluScrew, rAluScrew);
	translate([0,smallSize/2,0]) cube([2*rAluScrew,smallSize,h], true);
}


module drawAluHammerNutHole(h=smallSize)
{
	cube([wAluHammerNut+2*clearanceHammerNut,lAluHammerNut+2*clearanceHammerNut,h], true);
}


module drawFlangeBearingScrewHole(prmBearingType,h=smallSize)
{
	translate([0,0,-h/2]) cylinder(h, getRFlangeBearingInner(prmBearingType), getRFlangeBearingInner(prmBearingType));
} 


module drawFlangeBearingHole(prmBearingType)
{
   if( plasticWashers == FLAT_WASHER )
   {
      h = getHeightFlangeBearing(prmBearingType)+correction_FlangeBearingLength;
      r = getRFlangeBearing(prmBearingType)+clearanceBearing+eps;
      translate([0,0,-h/2]) cylinder(h, r, r);
      translate([-r,0,-h/2]) cube([2*r,r,h]);
      rotate([0,0,90]) translate([-r,0,-h/2]) cube([2*r,r,h]);
   } else if( plasticWashers == PLASTIC_WASHER ) {
      h = 2*getWFlangeBearing(prmBearingType)+correction_FlangeBearingLength;
      h2 = getHeightFlangeBearing(prmBearingType)+correction_FlangeBearingLength;
      r = getRFlangeBearing(prmBearingType)+clearanceBearing+eps;
      r2 = getRFlangeBearingWasherOuter(prmBearingType) + clearanceBearing+eps;
      translate([0,0,-h/2]) cylinder(h, r, r);
      difference() {
         translate([0,0,-h2/2]) cylinder(h2, r, r);
         translate([0,0,-h2/2]) cylinder(h2, r2, r2);
      }
      translate([-r,0,-h/2]) cube([2*r,r,h]);
      rotate([0,0,90]) translate([-r,0,-h/2]) cube([2*r,r,h]);
   }
} 
//!!!!!!!!!!!!!!TODO FIX

module drawNemaScrewHole(prmNemaType, h=smallSize)
{
	translate([0,0,-h/2]) cylinder(h, getRScrewHoleNema(prmNemaType), getRScrewHoleNema(prmNemaType), $fn=50);
}

module drawNemaScrewSlotHole(prmNemaType, h=smallSize)
{
	hull()
	{
		translate([0,getWScrewSlotNema(prmNemaType)/2,-h/2]) cylinder(h, getRScrewHoleNema(prmNemaType), getRScrewHoleNema(prmNemaType), $fn=50);
		translate([0,-getWScrewSlotNema(prmNemaType)/2,-h/2]) cylinder(h, getRScrewHoleNema(prmNemaType), getRScrewHoleNema(prmNemaType), $fn=50);
	}
}


module drawExtruderMountHole(prmIsNut=false)
{
	translate([0,0,-smallSize/2]) cylinder(smallSize, rExtruderMountHole, rExtruderMountHole, $fn=50);
	if (prmIsNut) {
		drawExtruderNutMask();
	}
}


module drawGT2Pulley()
{
	color(colorSteel1)
	difference()
	{
		union()
		{
			translate([0,0,hPulley3]) cylinder(hPulley4-hPulley3,rPulley2,rPulley2,$fn=100);
			translate([0,0,hPulley2-eps]) cylinder(hPulley3-hPulley2+2*eps,rPulley3,rPulley3,$fn=100);
			translate([0,0,hPulley1]) cylinder(hPulley2-hPulley1,rPulley2,rPulley2,$fn=100);
			cylinder(hPulley1+eps,rPulley1,rPulley1,$fn=50);
		}
		union()
		{
			translate([0,0,-eps]) cylinder(hPulley4+2*eps,rPulley4,rPulley4,$fn=50);
		}
	}
}


module drawScrew(prmLength)
{
	color(colorSteel1)
	difference()
	{
		union()
		{
			translate([0,0,tScrewHeadOuter-eps]) cylinder(prmLength+eps,rScrew,rScrew,$fn=25);
			cylinder(tScrewHeadOuter,rScrewHeadOuter,rScrewHeadOuter,$fn=50);
		}
		union()
		{
			translate([0,0,-eps]) cylinder(tScrewHeadInner+eps,rScrewHeadInner,rScrewHeadInner,$fn=6);
		}
	}
}


module drawScrewHeadMaskFlat(prmFilletRadius)
{
	translate([prmFilletRadius,prmFilletRadius]) circle(prmFilletRadius);
	polygon([[prmFilletRadius,0],[smallSize,0],[smallSize,smallSize],[0,smallSize],[0,prmFilletRadius],[prmFilletRadius,0]]);
}


module drawScrewHeadMask()
{
	cylinder(smallSize,rWasherOuter,rWasherOuter,$fn=50);
	translate([-rWasherOuter,0,0]) rotate([90,0,0]) linear_extrude(height = smallSize, center = true, convexity = 10, twist = 0, slices = 20, scale = 1.0) drawScrewHeadMaskFlat(rScrew);
}


module drawNut()
{
	color(colorSteel1)
	difference()
	{
		union()
		{
			translate([0,0,tNut-eps]) cylinder(tNutHead+eps,rNutHead,rNutHead,$fn=50);
			cylinder(tNut,rNut,rNut,$fn=6);
		}
		union()
		{
			translate([0,0,-eps]) cylinder(tNutHead+tNut+2*eps,rScrew,rScrew ,$fn=25);
		}
	}
}


module drawNutMask()
{
	translate([0,0,-eps]) rotate([0,0,90])cylinder(tNut+eps,rNut+correction_NutRadius,rNut+correction_NutRadius,$fn=6);
}


module drawFlangeBearingNutMask(prmBearingType)
{
	translate([0,0,-eps]) rotate([0,0,90])cylinder(getTFlangeBearingNut(prmBearingType)+eps,getRFlangeBearingNut(prmBearingType)+correction_NutRadius,getRFlangeBearingNut(prmBearingType)+correction_NutRadius,$fn=6);
}


module drawExtruderNutMask()
{
	translate([0,0,-eps]) rotate([0,0,90])cylinder(tExtruderNut+eps,rExtruderNut+correction_NutRadius,rExtruderNut+correction_NutRadius,$fn=6);
}


module drawWasher()
{
	color(colorSteel2)
	difference()
	{
		union()
		{
			cylinder(tWasher,rWasherOuter,rWasherOuter,$fn=50);
		}
		union()
		{
			translate([0,0,-eps]) cylinder(tWasher+2*eps,rWasherInner,rWasherInner,$fn=25);
		}
	}
}


module drawBearing(prmBearingType)
{
	color(colorSteel1)
	translate([0,0,-getLBearing(prmBearingType)/2]) difference()
	{
		union()
		{
			cylinder(getLBearing(prmBearingType),getRBearingOuter(prmBearingType),getRBearingOuter(prmBearingType),$fn=100);
		}
		union()
		{
			translate([0,0,-eps]) cylinder(getLBearing(prmBearingType)+2*eps,getRBearingInner(prmBearingType),getRBearingInner(prmBearingType), $fn=50);
		}
	}
}


module drawBearingMask(prmBearingType, prmLength = bigSize)
{
	lBearingCorrected = getLBearing(prmBearingType) + correction_BearingLength;
	rBearingOuterCorrected = getRBearingOuter(prmBearingType) + correction_BearingRadius;
	difference() 
	{
		union()
		{
			translate([0,0,-lBearingCorrected/2]) cylinder(lBearingCorrected,rBearingOuterCorrected,rBearingOuterCorrected,$fn=100);
		}
	/*	union()
		{
			difference()
			{
				translate([0,0,-rScrew]) cylinder(2*rScrew,bigSize,bigSize,$fn=100);
				translate([0,0,-rScrew-eps]) cylinder(2*rScrew+2*eps,getRBearingOuter(prmBearingType),getRBearingOuter(prmBearingType),$fn=100);
			}
		}*/
	}
	translate([0,0,-prmLength/2]) cylinder(prmLength,getRBearingRodMask(prmBearingType),getRBearingRodMask(prmBearingType),$fn=50);
}


module drawFlangeBearingHalf(prmBearingType)
{
	difference()
	{
		union()
		{
			h = getWFlangeBearing(prmBearingType)-getTFlangeBearing(prmBearingType);
			translate([0,0,h+getTFlangeBearing(prmBearingType)-eps]) cylinder(getTFlangeBearingWasher(prmBearingType)+eps,getRFlangeBearingWasherOuter(prmBearingType)+eps,getRFlangeBearingWasherOuter(prmBearingType),$fn=100);
			translate([0,0,h]) cylinder(getTFlangeBearing(prmBearingType),getRFlangeBearing(prmBearingType),getRFlangeBearing(prmBearingType),$fn=100);
			translate([0,0,-eps]) cylinder(h+2*eps,getRFlangeBearingOuter(prmBearingType)+eps,getRFlangeBearingOuter(prmBearingType),$fn=50);
		}
		union()
		{
			translate([0,0,-smallSize/2]) cylinder(smallSize,getRFlangeBearingInner(prmBearingType),getRFlangeBearingInner(prmBearingType), $fn=50);
		}
	}
}


module drawFlangeBearing(prmBearingType)
{
	color(colorSteel1) {
		drawFlangeBearingHalf(prmBearingType);
		mirror([0,0,1]) drawFlangeBearingHalf(prmBearingType);
	}
}


module drawRod(prmBearingType, prmLength)
{
	color(colorSteel2) cylinder(prmLength,getRBearingInner(prmBearingType),getRBearingInner(prmBearingType),$fn=50);
}


module drawLeadScrew()
{
	color(colorSteel2) cylinder(leadScrewLength,rLeadScrewNut4,rLeadScrewNut4,$fn=50);
}


module drawLeadScrewNutMount(prmUseBigCoupler=false)
{
	color(colorPlastic)
	difference()
	{
		union()
		{
			cylinder(tLeadScrewNutMount,rLeadScrewNut1,rLeadScrewNut1,$fn=100);
			translate([-wLeadScrewNutMount/2,-rLeadScrewNut1,0]) cube([wLeadScrewNutMount,wAlu1+tLeadScrewNutMount+2*rLeadScrewNut1,tLeadScrewNutMount]);
			translate([-wLeadScrewNutMount/2,rLeadScrewNut1,-wAlu1]) cube([wLeadScrewNutMount,tLeadScrewNutMount,wAlu1+eps]);
			translate([rLeadScrewNut1+tLeadScrewNutMount/2,0,-wAlu1/2]) cube([tLeadScrewNutMount,2*rLeadScrewNut1,wAlu1],true);
			mirror([1,0,0]) translate([rLeadScrewNut1+tLeadScrewNutMount/2,0,-wAlu1/2]) cube([tLeadScrewNutMount,2*rLeadScrewNut1,wAlu1],true);
		}
		union()
		{
			translate([0,0,-bigSize/2]) cylinder(bigSize,rLeadScrewNutMount,rLeadScrewNutMount, $fn=50);
			if (prmUseBigCoupler) {
				translate([0,0,-bigSize]) cylinder(bigSize,rLeadScrewBigCoupler,rLeadScrewBigCoupler, $fn=100);
			}
			for (i = [0:nrOfLeadScrewNutHoles-1]) {
				angle = i*360/nrOfLeadScrewNutHoles;
				rotate([0,0,angle]) translate([rLeadScrewNut2,0,-bigSize/2]) cylinder(bigSize,rLeadScrewNutHole,rLeadScrewNutHole, $fn=25);
			}
			offsetY = wAlu1/2+tLeadScrewNutMount+rLeadScrewNut1;
			if (useHammerNuts) {
				translate([distLeadScrewNutMountHoles/2,offsetY,tLeadScrewNutMount/2]) rotate([0,0,-90]) drawAluOpenScrewHole(tLeadScrewNutMount+2*eps);
				translate([-distLeadScrewNutMountHoles/2,offsetY,tLeadScrewNutMount/2]) rotate([0,0,90]) drawAluOpenScrewHole(tLeadScrewNutMount+2*eps);
			} else {
				translate([distLeadScrewNutMountHoles/2,offsetY,tLeadScrewNutMount/2]) drawAluScrewHole(tLeadScrewNutMount+2*eps);
				translate([-distLeadScrewNutMountHoles/2,offsetY,tLeadScrewNutMount/2]) drawAluScrewHole(tLeadScrewNutMount+2*eps);
			}

			translate([distLeadScrewNutMountHoles/2,rLeadScrewNut1+tLeadScrewNutMount/2,-wAlu1/2]) rotate([90,0,0]) drawAluScrewHole(tLeadScrewNutMount+2*eps);
			translate([-distLeadScrewNutMountHoles/2,rLeadScrewNut1+tLeadScrewNutMount/2,-wAlu1/2]) rotate([90,0,0]) drawAluScrewHole(tLeadScrewNutMount+2*eps);

			translate([wLeadScrewNutMount/2-wAlu1/2,offsetY,0]) drawFancyRounding(wAlu1/2);
			mirror([1,0,0]) translate([wLeadScrewNutMount/2-wAlu1/2,offsetY,0]) drawFancyRounding(wAlu1/2);

			translate([wLeadScrewNutMount/2-rLeadScrewNut1,0,0]) rotate([0,0,-90]) drawFancyRounding(rLeadScrewNut1);
			mirror([1,0,0]) translate([wLeadScrewNutMount/2-rLeadScrewNut1,0,0]) rotate([0,0,-90]) drawFancyRounding(rLeadScrewNut1);

			translate([wLeadScrewNutMount/2-wAlu1/2,0,-wAlu1/2]) rotate([-90,0,0]) drawFancyRounding(wAlu1/2);
			mirror([1,0,0]) translate([wLeadScrewNutMount/2-wAlu1/2,0,-wAlu1/2]) rotate([-90,0,0]) drawFancyRounding(wAlu1/2);

			radius = min(wAlu1,2*rLeadScrewNut1);
			translate([0,-rLeadScrewNut1+radius,-wAlu1+radius]) rotate([0,90,0]) rotate([0,0,-90]) drawFancyRounding(radius);
		}
	}
}


module drawBedClamp()
{
    color(colorPlastic)
	difference()
	{
		union()
		{
			translate([-wBedClamp/2,0,0]) cube([wBedClamp,offsetBedClampHole+tBedClamp,tBedClamp]);
			cylinder(tBedClamp,wBedClamp/2,wBedClamp/2, $fn=50);
			translate([-wBedClamp/2,offsetBedClampHole,-wAlu1-eps]) cube([wBedClamp,tBedClamp,wAlu1+2*eps]);			
			translate([-wBedClamp/2,offsetBedClampHole+tBedClamp-eps,-wAlu1]) cube([wBedClamp,wAlu1-wBedClamp/2+eps,tBedClamp]);
			translate([0,offsetBedClampHole+wAlu1,-wAlu1]) cylinder(tBedClamp,wBedClamp/2,wBedClamp/2, $fn=50);
		}
		union()
		{
			translate([0,0,-eps]) cylinder(tBedClamp+2*eps,rBedClampHole,rBedClampHole, $fn=25);
			translate([0,offsetBedClampHole+tBedClamp/2,tBedClamp-wAlu1/2]) rotate([90,0,0]) drawAluScrewHole(tBedClamp+2*eps);
			if (useHammerNuts) {
				translate([0,offsetBedClampHole+tBedClamp+wAlu1/2,-wAlu1+tBedClamp/2]) rotate([0,0,90]) drawAluOpenScrewHole(tBedClamp+2*eps);
			} else {
				translate([0,offsetBedClampHole+tBedClamp+wAlu1/2,-wAlu1+tBedClamp/2]) drawAluScrewHole(tBedClamp+2*eps);
			}
		}
	}
}


module drawZCarriage(prmExtraStrong=false,prmExtraArmLength = 0)
{
	color(colorPlastic)
	difference()
	{
		union()
		{
			if (prmExtraStrong) {
				hull()
				{
					translate([0,0,hZCarriage/2]) cube([wZCarriage,lZCarriage,hZCarriage],true);
					translate([-distZCarriageHoles/2,0,0]) cylinder(hZCarriage, rZCarriage, rZCarriage);
					translate([distZCarriageHoles/2+prmExtraArmLength,0,0]) cylinder(hZCarriage, rZCarriage, rZCarriage);
				}
			} else {
				translate([0,0,hZCarriage/2]) cube([wZCarriage,lZCarriage,hZCarriage],true);
				translate([-distZCarriageHoles/2,0,0]) cylinder(hZCarriage, rZCarriage, rZCarriage);
				translate([distZCarriageHoles/2+prmExtraArmLength,0,0]) cylinder(hZCarriage, rZCarriage, rZCarriage);
				translate([wZCarriage/2-eps,-rZCarriage,0]) cube([(distZCarriageHoles-wZCarriage)/2+prmExtraArmLength+eps,2*rZCarriage,hZCarriage]);
				mirror([1,0,0]) translate([wZCarriage/2-eps,-rZCarriage,0]) cube([(distZCarriageHoles-wZCarriage)/2+eps,2*rZCarriage,hZCarriage]);
				translate([-wZCarriage/2-filletZCarriage,rZCarriage+filletZCarriage,0]) rotate([0,0,-90]) drawCornerFillet(filletZCarriage, hZCarriage);
				mirror([1,0,0]) translate([-wZCarriage/2-filletZCarriage,rZCarriage+filletZCarriage,0]) rotate([0,0,-90]) drawCornerFillet(filletZCarriage, hZCarriage);
				mirror([0,1,0]) translate([-wZCarriage/2-filletZCarriage,rZCarriage+filletZCarriage,0]) rotate([0,0,-90]) drawCornerFillet(filletZCarriage, hZCarriage);
				mirror([0,1,0]) mirror([1,0,0]) translate([-wZCarriage/2-filletZCarriage,rZCarriage+filletZCarriage,0]) rotate([0,0,-90]) drawCornerFillet(filletZCarriage, hZCarriage);
			}
		}
		union()
		{
			translate([0,lZCarriage/2-getLBearing(BearingZ)/2-tZCarriageSmall,hZCarriage]) rotate([90,0,0]) drawBearingMask(BearingZ);
			mirror([0,1,0]) translate([0,lZCarriage/2-getLBearing(BearingZ)/2-tZCarriageSmall,hZCarriage]) rotate([90,0,0]) drawBearingMask(BearingZ);
			offsetX = wZCarriage/2-rScrew-calcScrewFlesh(rScrew)/2;
			offsetY = lZCarriage/4;
			translate([offsetX,offsetY,hZCarriage/2]) drawScrewHole(hZCarriage+2*eps);
			translate([-offsetX,offsetY,hZCarriage/2]) drawScrewHole(hZCarriage+2*eps);
			translate([offsetX,-offsetY,hZCarriage/2]) drawScrewHole(hZCarriage+2*eps);
			translate([-offsetX,-offsetY,hZCarriage/2]) drawScrewHole(hZCarriage+2*eps);
			translate([offsetX,offsetY,0]) drawNutMask();
			translate([-offsetX,offsetY,0]) drawNutMask();
			translate([offsetX,-offsetY,0]) drawNutMask();
			translate([-offsetX,-offsetY,0]) drawNutMask();
			translate([distZCarriageHoles/2+prmExtraArmLength,0,hZCarriage/2]) drawAluScrewHole(hZCarriage+2*eps);
			translate([-distZCarriageHoles/2,0,hZCarriage/2]) drawAluScrewHole(hZCarriage+2*eps);
		}
	}
}


module drawCarriageClamp(prmBearing,prmWCarriage,prmHCarriageClamp,prmTCarriage,prmReductionCarriageClamp)
{
	color(colorPlastic)
	difference()
	{
		union()
		{
			translate([-prmWCarriage/2,-getLBearing(prmBearing)/2-2,prmReductionCarriageClamp]) cube([prmWCarriage,getLBearing(prmBearing)+4,prmHCarriageClamp]);
		}
		union()
		{
			rotate([90,0,0]) drawBearingMask(prmBearing);//,getLBearing(prmBearing)/2+2*eps);
			offsetX = prmWCarriage/2-rScrew-calcScrewFlesh(rScrew)/2;
			translate([offsetX,0,prmHCarriageClamp/2]) drawScrewHole(prmHCarriageClamp+2*eps);
			translate([-offsetX,0,prmHCarriageClamp/2]) drawScrewHole(prmHCarriageClamp+2*eps);
			offsetZ = getRBearingOuter(prmBearing)+prmTCarriage-tWasher-tScrewHeadOuter; 
			translate([offsetX,0,offsetZ]) drawScrewHeadMask();
			translate([-offsetX,0,offsetZ]) rotate([0,0,180]) drawScrewHeadMask();
		}
	}
}


module drawXCarriageClamp(isMicroSwitchMount = false)
{
	w = 4*rScrew + 2*calcScrewFlesh(rScrew) + 2*getRBearingOuter(BearingX);
	w2 = w - 2*rWasherOuter - 2*rScrew - calcScrewFlesh(rScrew);
	color(colorPlastic)
	difference()
	{
		union()
		{
			drawCarriageClamp(BearingX,w,hXCarriageClamp,tXCarriage,reductionXCarriageClamp);
         if( isMicroSwitchMount )
            translate([-w2/2,getLBearing(BearingX)/4-eps,hXCarriageClamp+reductionXCarriageClamp-tXEndstopMount]) cube([w2,getLBearing(BearingX)/4+hMicroSwitch+clearanceMicroSwitch+eps,tXEndstopMount]);
		}
		union()
		{
			yOffset = getLBearing(BearingX)/2 + hMicroSwitch + clearanceMicroSwitch - offsetMicroSwitchMountHole ;
			translate([distMicroSwitchMountHoles/2,yOffset,0]) cylinder(bigSize,rMicroSwitchScrew,rMicroSwitchScrew,true,$fn=50);
			translate([-distMicroSwitchMountHoles/2,yOffset,0]) cylinder(bigSize,rMicroSwitchScrew,rMicroSwitchScrew,true,$fn=50);
		}
	}
}


module drawYCarriageClamp()
{
	drawCarriageClamp(BearingY,wYCarriage,hYCarriageClamp,tYCarriage,reductionYCarriageClamp);
}


module drawZCarriageClamp()
{
	drawCarriageClamp(BearingZ,wZCarriage,hZCarriageClamp,tZCarriage,reductionZCarriageClamp);
}


module drawZMotorMountPlateFlat()
{
	b = getW1Nema(motorZ)/2 + distanceLeadScrewToAluProfile - tZMotorMount + eps;
	h = wAlu1+eps;
	polygon([[0,-eps],[0,b],[h,b],[0,-eps]]);
}


module drawZMotorMountPlate()
{
	rotate([0,-90,0]) linear_extrude(height = tZMotorMount, center = true, convexity = 10, twist = 0, slices = 20, scale = 1.0) drawZMotorMountPlateFlat();
}


module drawZMotorMount()
{
	color(colorPlastic)
	difference()
	{
		union()
		{
			translate([-wZMotorMount1/2,-getW1Nema(motorZ)/2,0]) cube([wZMotorMount1,lZMotorMount1+eps,tZMotorMount]);
			translate([-wZMotorMount2/2,distanceLeadScrewToAluProfile-tZMotorMount,0]) cube([wZMotorMount2,lZMotorMount2,tZMotorMount]);
			translate([-wZMotorMount2/2,distanceLeadScrewToAluProfile-tZMotorMount,tZMotorMount-eps]) cube([wZMotorMount2,tZMotorMount,wAlu1+eps]);
			translate([wZMotorMount1/2-tZMotorMount/2,-getW1Nema(motorZ)/2,tZMotorMount]) drawZMotorMountPlate();
			translate([-wZMotorMount1/2+tZMotorMount/2,-getW1Nema(motorZ)/2,tZMotorMount]) drawZMotorMountPlate();
		}
		union()
		{
			hull() {
				translate([0,getWScrewSlotNema(motorZ)/2,-eps]) cylinder(tZMotorMount+2*eps,rZMotorMountNema,rZMotorMountNema,$fn=200);
				translate([0,-getWScrewSlotNema(motorZ)/2,-eps]) cylinder(tZMotorMount+2*eps,rZMotorMountNema,rZMotorMountNema,$fn=200);
			}
			offsetHole = getDistScrewHolesNema(motorZ)/2;
			translate([offsetHole,offsetHole,tZMotorMount/2]) drawNemaScrewSlotHole(motorZ,tZMotorMount+2*eps);
			translate([-offsetHole,offsetHole,tZMotorMount/2]) drawNemaScrewSlotHole(motorZ,tZMotorMount+2*eps);
			translate([offsetHole,-offsetHole,tZMotorMount/2]) drawNemaScrewSlotHole(motorZ,tZMotorMount+2*eps);
			translate([-offsetHole,-offsetHole,tZMotorMount/2]) drawNemaScrewSlotHole(motorZ,tZMotorMount+2*eps);

			if (useHammerNuts) {
				translate([distZMotorMountHoles/2,distanceLeadScrewToAluProfile+wAlu1/2,0]) rotate([0,0,-90]) drawAluOpenScrewHole();
				translate([-distZMotorMountHoles/2,distanceLeadScrewToAluProfile+wAlu1/2,0]) rotate([0,0,90]) drawAluOpenScrewHole();
				translate([0,distanceLeadScrewToAluProfile+wAlu1/2,0]) rotate([0,0,90]) drawAluHammerNutHole();
			} else {
				translate([distZMotorMountHoles/2,distanceLeadScrewToAluProfile+wAlu1/2,0]) drawAluScrewHole();
				translate([-distZMotorMountHoles/2,distanceLeadScrewToAluProfile+wAlu1/2,0]) drawAluScrewHole();
				translate([0,distanceLeadScrewToAluProfile+wAlu1/2,0]) drawAluScrewHole();
			}
			translate([distZMotorMountHoles/2,distanceLeadScrewToAluProfile,tZMotorMount+wAlu1/2]) rotate([90,0,0]) drawAluScrewHole();
			translate([-distZMotorMountHoles/2,distanceLeadScrewToAluProfile,tZMotorMount+wAlu1/2]) rotate([90,0,0]) drawAluScrewHole();
		}
	}
}


module drawZBearingMount()
{
	color(colorPlastic)
	difference()
	{
		union()
		{
			translate([-wZBearingMount/2,0,0]) cube([wZBearingMount,distanceLeadScrewToAluProfile,tZBearingMountThick]);
			cylinder(tZBearingMountThick,wZBearingMount/2,wZBearingMount/2,$fn=200);
			translate([-wZBearingMount/2,distanceLeadScrewToAluProfile-eps,0]) cube([wZBearingMount,wAlu1-wZBearingMount/2+eps,tZBearingMount]);
			translate([0,distanceLeadScrewToAluProfile+wAlu1-wZBearingMount/2,0]) cylinder(tZBearingMount,wZBearingMount/2,wZBearingMount/2,$fn=200);
			translate([-wZBearingMount/2,distanceLeadScrewToAluProfile-tZBearingMount,tZBearingMount-eps]) cube([wZBearingMount,tZBearingMount,wAlu1-wZBearingMount/2+eps]);
			translate([0,distanceLeadScrewToAluProfile-tZBearingMount/2,tZBearingMount+wAlu1-wZBearingMount/2]) rotate([90,0,0]) cylinder(tZBearingMount,wZBearingMount/2,wZBearingMount/2,true,$fn=200);
			if (wAlu1-wZBearingMount/2>filletZBearingMount) {
				translate([0,distanceLeadScrewToAluProfile-tZBearingMount-filletZBearingMount,tZBearingMountThick+filletZBearingMount]) rotate([0,90,0]) translate([0,0,-wZBearingMount/2]) drawCornerFillet(filletZBearingMount, wZBearingMount);
			}
		}
		union()
		{
			translate([0,0,-bigSize/2]) cube([bigSize,bigSize,bigSize],true);
			rBearingOuter = getRFlangeBearingOuter(F608ZZ) + clearanceFlangeBearing;
			translate([0,0,-eps]) cylinder(tZBearingMountThick+2*eps,rBearingOuter,rBearingOuter,$fn=200);

			if (useHammerNuts) {
				translate([0,distanceLeadScrewToAluProfile+wAlu1/2,0]) rotate([0,0,-90]) drawAluHammerNutHole();
			} else {
				translate([0,distanceLeadScrewToAluProfile+wAlu1/2,0]) drawAluScrewHole();
			}
			translate([0,distanceLeadScrewToAluProfile,tZBearingMount+wAlu1/2]) rotate([90,0,0]) drawAluScrewHole();
			// cuts
			offsetCutX = 2*rScrew+calcScrewFlesh(rScrew)+rBearingOuter;
			translate([-wZBearingMount/2-eps,offsetCutX,-eps]) cube([cutDepthZBearingMount+eps,cutWidthZBearingMount,tZBearingMountThick+2*eps]);	
			translate([-cutWidthZBearingMount-wZBearingMount/2+cutDepthZBearingMount,0,-eps]) cube([cutWidthZBearingMount,offsetCutX+cutWidthZBearingMount,tZBearingMountThick+2*eps]);	
			translate([0,offsetCutX-rScrew-calcScrewFlesh(rScrew)/2,tZBearingMountThick/2]) rotate([0,90,0]) drawScrewHole();
		}
	}
}


module drawZRodMount()
{
	color(colorPlastic)
	difference()
	{
		union()
		{
			translate([-wZRodMount/2,0,0]) cube([wZRodMount,distanceLeadScrewToAluProfile,tZRodMountThick]);
			cylinder(tZRodMountThick,wZRodMount/2,wZRodMount/2, $fn=200);
			translate([-wZRodMount/2,distanceLeadScrewToAluProfile-eps,0]) cube([wZRodMount,wAlu1-wZRodMount/2+eps,tZRodMount]);			
			translate([0,distanceLeadScrewToAluProfile+wAlu1-wZRodMount/2,0]) cylinder(tZRodMount,wZRodMount/2,wZRodMount/2, $fn=200);
			translate([-wZRodMount/2,distanceLeadScrewToAluProfile-tZRodMount,tZRodMount-eps]) cube([wZRodMount,tZRodMount,wAlu1-wZRodMount/2+eps]);
			translate([0,distanceLeadScrewToAluProfile-tZRodMount/2,tZRodMount+wAlu1-wZRodMount/2]) rotate([90,0,0]) cylinder(tZRodMount,wZRodMount/2,wZRodMount/2,true,$fn=200);
			if (wAlu1-wZRodMount/2>filletZRodMount) {
				translate([0,distanceLeadScrewToAluProfile-tZRodMount-filletZRodMount,tZRodMountThick+filletZRodMount]) rotate([0,90,0]) translate([0,0,-wZRodMount/2]) drawCornerFillet(filletZRodMount, wZRodMount);
			}
		}
		union()
		{			
			translate([0,0,-bigSize/2]) cube([bigSize,bigSize,bigSize],true);
			translate([0,0,-eps]) cylinder(tZRodMountThick+2*eps,getRBearingInner(BearingZ),getRBearingInner(BearingZ), $fn=100);
			if (useHammerNuts) {
				translate([0,distanceLeadScrewToAluProfile+wAlu1/2,0]) rotate([0,0,90]) drawAluHammerNutHole();
			} else {
				translate([0,distanceLeadScrewToAluProfile+wAlu1/2,0]) drawAluScrewHole();
			}
			translate([0,distanceLeadScrewToAluProfile,tZRodMount+wAlu1/2]) rotate([90,0,0]) drawAluScrewHole();
			// cuts
			offsetCutX = 2*rScrew+calcScrewFlesh(rScrew)+getRBearingInner(BearingZ);
			translate([-wZRodMount/2-eps,offsetCutX,-eps]) cube([cutDepthZRodMount+eps,cutWidthZRodMount,tZRodMountThick+2*eps]);	
			translate([-cutWidthZRodMount-wZRodMount/2+cutDepthZRodMount,0,-eps]) cube([cutWidthZRodMount,offsetCutX+cutWidthZRodMount,tZRodMountThick+2*eps]);	
			translate([0,offsetCutX-rScrew-calcScrewFlesh(rScrew)/2,tZRodMountThick/2]) rotate([0,90,0]) drawScrewHole();
		}
	}
}


function calcWouldBeFleshYRodMount() = distYRodToMidSideAluProfile+getRBearingInner(BearingY)+rScrew+calcScrewFlesh(rScrew)/2-wYRodMount/2-rScrew;

function calcExtraDistanceYRodMount() = (calcWouldBeFleshYRodMount() >= calcScrewFlesh(rScrew)/2) ? 0 : calcScrewFlesh(rScrew)/2 - calcWouldBeFleshYRodMount();


module drawYMaxRodMount(isMaskMode = false)
{
	wouldBeFlesh = distYRodToMidSideAluProfile+getRBearingInner(BearingY)+rScrew+calcScrewFlesh(rScrew)/2-wYRodMount/2-rScrew;
	extraDistanceX = calcExtraDistanceYRodMount();
	tScrewClearance = tWasher+tNut+clearanceScrew;

	color(colorPlastic)
	difference()
	{
		union()
		{
			hull() {
				translate([0,distYRodMountHoles/2,tYRodMount/2]) cube([wYRodMount,wYRodMount,tYRodMount], center = true);
				translate([0,-distYRodMountHoles/2,tYRodMount/2]) cube([wYRodMount,wYRodMount,tYRodMount], true);
		//		translate([0,distYRodMountHoles/2,0])# cylinder(tYRodMount,wYRodMount,wYRodMount/2, $fn=100);
		//		translate([0,-distYRodMountHoles/2,0]) cylinder(tYRodMount,wYRodMount/2,wYRodMount/2, $fn=100);
				if (isMaskMode) {
					translate([-smallSize,distYRodMountHoles/2+smallSize,0]) cylinder(tYRodMount,wYRodMount/2,wYRodMount/2, $fn=100);
					translate([-smallSize,-distYRodMountHoles/2-smallSize,0]) cylinder(tYRodMount,wYRodMount/2,wYRodMount/2, $fn=100);
				}
			}
			translate([distYRodToMidSideAluProfile,0,0]) {
				cylinder(tYRodMountThick,rYRodMount,rYRodMount, $fn=100);
				translate([0,-rYRodMount,0]) cube([getRBearingInner(BearingY)+2*rScrew+1.5*calcScrewFlesh(rScrew)+extraDistanceX,2*rYRodMount,tYRodMountThick]);
			}
			if (isMaskMode) {
				translate([-smallSize,-(distYRodMountHoles+wYRodMount)/2,0]) cube([smallSize,distYRodMountHoles+wYRodMount,tYRodMount]);
				hull() {
					translate([0,distYRodMountHoles/2,tYRodMount-eps]) cylinder(tScrewClearance+eps, rWasherOuter,rWasherOuter);
					translate([0,-distYRodMountHoles/2,tYRodMount-eps]) cylinder(tScrewClearance+eps, rWasherOuter,rWasherOuter);
				}
				translate([0,-rYRodMount-tScrewClearance,0]) cube([distYRodToMidSideAluProfile+getRBearingInner(BearingY)+2*rScrew+1.5*calcScrewFlesh(rScrew)+extraDistanceX,2*rYRodMount+2*tScrewClearance,tYRodMountThick]);
			}
		}
		union()
		{
			if (!isMaskMode) {
				if( useHammerNuts ) {
               translate([0,distYRodMountHoles/2,tYRodMount/2]) drawAluScrewSlotHole(tYRodMount+2*eps);
               translate([0,-distYRodMountHoles/2,tYRodMount/2]) drawAluScrewSlotHole(tYRodMount+2*eps);
            } else {
               translate([0,distYRodMountHoles/2,tYRodMount/2]) drawAluScrewHole(tYRodMount+2*eps);
               translate([0,-distYRodMountHoles/2,tYRodMount/2]) drawAluScrewHole(tYRodMount+2*eps);
            }
				translate([distYRodToMidSideAluProfile,0,0]) {
					translate([0,0,-eps]) cylinder(tYRodMountThick+2*eps,getRBearingInner(BearingY),getRBearingInner(BearingY),$fn=50);
					translate([0,-cutWidthYRodMount/2,-eps]) cube([smallSize,cutWidthYRodMount,tYRodMountThick+2*eps]);	
					translate([getRBearingInner(BearingY)+rScrew+calcScrewFlesh(rScrew)/2+extraDistanceX,0,tYRodMountThick/2]) rotate([90,0,0]) drawScrewHole();
               translate([getRBearingInner(BearingY)+rScrew+calcScrewFlesh(rScrew)/2+extraDistanceX,rYRodMount,tYRodMountThick/2]) rotate([90,0,0]) drawNutMask();
				}
			}
		}
	}
}


module drawYRodMount(isMaskMode = false)
{
	wouldBeFlesh = distYRodToMidSideAluProfile+getRBearingInner(BearingY)+rScrew+calcScrewFlesh(rScrew)/2-wYRodMount/2-rScrew;
	extraDistanceX = calcExtraDistanceYRodMount();
	tScrewClearance = tWasher+tNut+clearanceScrew;

	color(colorPlastic)
	difference()
	{
		union()
		{
			hull() {
				translate([0,distYRodMountHoles/2,tYRodMount/2]) cube([wYRodMount,wYRodMount,tYRodMount], center = true);
				translate([0,-distYRodMountHoles/2,tYRodMount/2]) cube([wYRodMount,wYRodMount,tYRodMount], true);
		//		translate([0,distYRodMountHoles/2,0])# cylinder(tYRodMount,wYRodMount,wYRodMount/2, $fn=100);
		//		translate([0,-distYRodMountHoles/2,0]) cylinder(tYRodMount,wYRodMount/2,wYRodMount/2, $fn=100);
				if (isMaskMode) {
					translate([-smallSize,distYRodMountHoles/2+smallSize,0]) cylinder(tYRodMount,wYRodMount/2,wYRodMount/2, $fn=100);
					translate([-smallSize,-distYRodMountHoles/2-smallSize,0]) cylinder(tYRodMount,wYRodMount/2,wYRodMount/2, $fn=100);
				}
			}
			translate([distYRodToMidSideAluProfile,0,0]) {
				cylinder(tYRodMountThick,rYRodMount,rYRodMount, $fn=100);
				translate([0,-rYRodMount,0]) cube([getRBearingInner(BearingY)+2*rScrew+calcScrewFlesh(rScrew)+extraDistanceX,2*rYRodMount,tYRodMountThick]);
			}
			if (isMaskMode) {
				translate([-smallSize,-(distYRodMountHoles+wYRodMount)/2,0]) cube([smallSize,distYRodMountHoles+wYRodMount,tYRodMount]);
				hull() {
					translate([0,distYRodMountHoles/2,tYRodMount-eps]) cylinder(tScrewClearance+eps, rWasherOuter,rWasherOuter);
					translate([0,-distYRodMountHoles/2,tYRodMount-eps]) cylinder(tScrewClearance+eps, rWasherOuter,rWasherOuter);
				}
				translate([0,-rYRodMount-tScrewClearance,0]) cube([distYRodToMidSideAluProfile+getRBearingInner(BearingY)+2*rScrew+calcScrewFlesh(rScrew)+extraDistanceX,2*rYRodMount+2*tScrewClearance,tYRodMountThick]);
			}
		}
		union()
		{
			if (!isMaskMode) {
				if( useHammerNuts ) {
               translate([0,distYRodMountHoles/2,tYRodMount/2]) drawAluScrewSlotHole(tYRodMount+2*eps);
               translate([0,-distYRodMountHoles/2,tYRodMount/2]) drawAluScrewSlotHole(tYRodMount+2*eps);
            } else {
               translate([0,distYRodMountHoles/2,tYRodMount/2]) drawAluScrewHole(tYRodMount+2*eps);
               translate([0,-distYRodMountHoles/2,tYRodMount/2]) drawAluScrewHole(tYRodMount+2*eps);
            }
				translate([distYRodToMidSideAluProfile,0,0]) {
					translate([0,0,-eps]) cylinder(tYRodMountThick+2*eps,getRBearingInner(BearingY),getRBearingInner(BearingY),$fn=50);
					translate([0,-cutWidthYRodMount/2,-eps]) cube([smallSize,cutWidthYRodMount,tYRodMountThick+2*eps]);	
					translate([getRBearingInner(BearingY)+rScrew+calcScrewFlesh(rScrew)/2+extraDistanceX,0,tYRodMountThick/2]) rotate([90,0,0]) drawScrewHole();
				}
			}
		}
	}
}


module drawYCarriageTopPart()
{
	rScrew = getRFlangeBearingInner(smallFB);
	screwFlesh = calcScrewFleshSmallFB()/2;

   
	difference()
	{
		union()
		{
			r = rScrew + screwFlesh;
			cube([wYCarriageTopPart,lYCarriageTopPart,hYCarriageTopPart-r+eps]);
			translate([0,r,hYCarriageTopPart-r]) cube([wYCarriageTopPart,lYCarriageTopPart-2*r,r]);
			translate([0,r,hYCarriageTopPart-r]) rotate([0,90,0]) cylinder(wYCarriageTopPart,r,r,$fn=50);
			translate([0,lYCarriageTopPart-r,hYCarriageTopPart-r]) rotate([0,90,0]) cylinder(wYCarriageTopPart,r,r,$fn=50);
		}
		union()
		{
         rScrewClearance = 5*rScrew;
         xCenterHole1 = tYCarriage + getHeightFlangeBearing(smallFB)/2;
         xCenterHole2 = xCenterHole1 + distYCarriageCenterFlangeBearingToCenterFlangeBearing;
         zScrewHoleTop = hYCarriageTopPart - rScrew - screwFlesh;
         zScrewHoleBottom = zScrewHoleTop - distYCarriageFlangeBearingHoles;
         yScrewHoleFront = rScrew + screwFlesh;
         yScrewHoleBack = yScrewHoleFront + distYCarriageFlangeBearingHoles;
         
			// bottom flange bearing hole
			translate([xCenterHole1,yScrewHoleFront,zScrewHoleBottom]) rotate([0,90,0]) {
				drawFlangeBearingScrewHole(smallFB, getHeightFlangeBearing(smallFB)+2*tYCarriage+2*eps);
				difference(){
               rotate([180,0,0]) drawFlangeBearingHole(smallFB);
               
            }
			}
			translate([tYCarriage,yScrewHoleFront+getRFlangeBearingInner(smallFB),zScrewHoleBottom]) cube([getHeightFlangeBearing(smallFB),getRFlangeBearing(smallFB)-getRFlangeBearingInner(smallFB),smallSize]);
			translate([tYCarriage,yScrewHoleFront+getRFlangeBearingInner(smallFB),zScrewHoleTop-rScrewClearance]) cube([getHeightFlangeBearing(smallFB),smallSize,smallSize]);

			// top flange bearing hole
			lengthScrewHole = 2*(xCenterHole2 - xCenterHole1);
			translate([xCenterHole2,yScrewHoleBack,zScrewHoleTop]) rotate([0,90,0]) {
				drawFlangeBearingScrewHole(smallFB, lengthScrewHole);
				drawFlangeBearingHole(smallFB);
			}			
			translate([xCenterHole1+getHeightFlangeBearing(smallFB)/2,yScrewHoleBack,zScrewHoleTop]) rotate([0,90,0]) rotate([0,0,90]){
				drawFlangeBearingNutMask(smallFB);
			}			

			// belt hole
			wBeltHole = wBelt+2*clearanceBelt;
			translate([wYCarriageTopPart-wBeltHole-tYCarriage,-eps,-eps]) cube([wBeltHole,lYCarriageTopPart+2*eps,wBeltHole+eps]);
			translate([wYCarriageTopPart-wBeltHole/2-tYCarriage,yScrewHoleFront,zScrewHoleBottom]) rotate([0,90,0]) translate([0,0,-wBeltHole/2]) cylinder(wBeltHole,rScrewClearance,rScrewClearance);

			// nut mask in belt hole
			translate([wYCarriageTopPart-wBeltHole-tYCarriage,yScrewHoleFront,zScrewHoleBottom]) rotate([0,-90,0]) rotate([0,0,90]) {
				drawFlangeBearingNutMask(smallFB);
			}
		}
	}
}


module drawYCarriage()
{
	color(colorPlastic)
	difference()
	{
      rScrew = getRFlangeBearingInner(smallFB);
      screwFlesh = calcScrewFleshSmallFB()/2;
      zScrewHoleTop = hYCarriageTopPart - rScrew - screwFlesh;
      zScrewHoleBottom = zScrewHoleTop - distYCarriageFlangeBearingHoles;
      hBottomPartClamp = zScrewHoleBottom-getRFlangeBearingWasherOuter(smallFB);
      hTopPartClamp = zScrewHoleTop-getRFlangeBearingWasherOuter(smallFB);
      
		union()
		{
         
         
			translate([0,0,hYCarriage/2]) cube([wYCarriage,lYCarriage,hYCarriage],true);
			translate([-distBetweenXRods/2,0,0]) cylinder(hYCarriage+hBottomPartClamp, rYCarriage, rYCarriage);
			translate([distBetweenXRods/2,0,0]) cylinder(hYCarriage+hBottomPartClamp, rYCarriage, rYCarriage);
         translate([wYCarriage/2-eps,-rYCarriage,0]) cube([(distBetweenXRods-wYCarriage)/2+eps,2*rYCarriage,hYCarriage+hBottomPartClamp]);
			mirror([1,0,0]) translate([wYCarriage/2-eps,-rYCarriage,0]) cube([(distBetweenXRods-wYCarriage)/2+eps,2*rYCarriage,hYCarriage+hBottomPartClamp]);
			translate([-wYCarriage/2-filletYCarriage,rYCarriage+filletYCarriage,0]) rotate([0,0,-90]) drawCornerFillet(filletYCarriage, hYCarriage);
			mirror([0,1,0]) mirror([1,0,0]) translate([-wYCarriage/2-filletYCarriage,rYCarriage+filletYCarriage,0]) rotate([0,0,-90]) drawCornerFillet(filletYCarriage, hYCarriage);
			translate([-wYCarriageTopPart/2,-lYCarriageTopPart/2,hYCarriage-eps]) drawYCarriageTopPart();
         
			rFillet = (wYCarriage-wYCarriageTopPart)/2;
			if (rFillet > 0) {
				translate([-wYCarriageTopPart/2-rFillet,-lYCarriageTopPart/2,hYCarriage+rFillet]) rotate([-90,0,0]) drawCornerFillet(rFillet, lYCarriageTopPart);
				mirror([1,0,0]) translate([-wYCarriageTopPart/2-rFillet,-lYCarriageTopPart/2,hYCarriage+rFillet]) rotate([-90,0,0]) drawCornerFillet(rFillet, lYCarriageTopPart);
			}
		}
		union()
		{
			translate([0,lYCarriage/2-getLBearing(BearingY)/2-tYCarriageSmall,0]) rotate([90,0,0]) drawBearingMask(BearingY);
			mirror([0,1,0]) translate([0,lYCarriage/2-getLBearing(BearingY)/2-tYCarriageSmall,0]) rotate([90,0,0]) drawBearingMask(BearingY);
			offsetX = wYCarriage/2-rScrew-calcScrewFlesh(rScrew)/2;
			translate([offsetX,lYCarriage/4,hYCarriage/2]) drawScrewHole(hYCarriage+2*eps);
			translate([-offsetX,lYCarriage/4,hYCarriage/2]) drawScrewHole(hYCarriage+2*eps);
			translate([offsetX,-lYCarriage/4,hYCarriage/2]) drawScrewHole(hYCarriage+2*eps);
			translate([-offsetX,-lYCarriage/4,hYCarriage/2]) drawScrewHole(hYCarriage+2*eps);
			translate([offsetX,lYCarriage/4,hYCarriage-tNut+eps]) drawNutMask();
			translate([-offsetX,lYCarriage/4,hYCarriage-tNut+eps]) drawNutMask();
			translate([offsetX,-lYCarriage/4,hYCarriage-tNut+eps]) drawNutMask();
			translate([-offsetX,-lYCarriage/4,hYCarriage-tNut+eps]) drawNutMask();
			translate([distBetweenXRods/2,0,-eps]) cylinder(hYCarriage+hTopPartClamp+2*eps,getRBearingInner(BearingX),getRBearingInner(BearingX), $fn=50);
			translate([-distBetweenXRods/2,0,-eps]) cylinder(hYCarriage+hTopPartClamp+2*eps,getRBearingInner(BearingX),getRBearingInner(BearingX), $fn=50);

			// cuts
			translate([wYCarriage/2,rYCarriage-cutDepthYCarriage,-eps]) cube([cutWidthYCarriage,cutDepthYCarriage+eps,hYCarriage+hBottomPartClamp+2*eps]);	
			translate([wYCarriage/2,rYCarriage-cutDepthYCarriage,-eps]) cube([distBetweenXRods/2-wYCarriage/2,cutWidthYCarriage,hYCarriage+hBottomPartClamp+2*eps]);	
			translate([wYCarriage/2+rScrew+calcScrewFlesh(rScrew)/2+cutWidthYCarriage,0,(hYCarriage+hBottomPartClamp)/2]) rotate([90,90,0]) drawScrewHole();
         hull() translate([wYCarriage/2+rScrew+calcScrewFlesh(rScrew)/2+cutWidthYCarriage,-rYCarriage+tNut,(hYCarriage+hBottomPartClamp)/2]) rotate([90,0,0]) {
            drawNutMask();
            translate([0,0,rYCarriage]) drawNutMask();
         }
			
         mirror([1,0,0]) mirror([0,1,0]) {
				translate([wYCarriage/2,rYCarriage-cutDepthYCarriage,-eps]) cube([cutWidthYCarriage,cutDepthYCarriage+eps,hYCarriage+hBottomPartClamp+2*eps]);	
				translate([wYCarriage/2,rYCarriage-cutDepthYCarriage,-eps]) cube([distBetweenXRods/2-wYCarriage/2,cutWidthYCarriage,hYCarriage+hBottomPartClamp+2*eps]);	
				translate([wYCarriage/2+rScrew+calcScrewFlesh(rScrew)/2+cutWidthYCarriage,0,(hYCarriage+hBottomPartClamp)/2]) rotate([90,90,0]) drawScrewHole();		
            hull() translate([wYCarriage/2+rScrew+calcScrewFlesh(rScrew)/2+cutWidthYCarriage,-rYCarriage+tNut,(hYCarriage+hBottomPartClamp)/2]) rotate([90,0,0]) {
               drawNutMask();
               translate([0,0,rYCarriage]) drawNutMask();
            }
			}
		}
	}
}

module drawYMaxCarriage2()
{
	color(colorPlastic)
	difference()
	{
      rScrew = getRFlangeBearingInner(smallFB);
      screwFlesh = calcScrewFleshSmallFB()/2;
      zScrewHoleTop = hYCarriageTopPart - rScrew - screwFlesh;
      zScrewHoleBottom = zScrewHoleTop - distYCarriageFlangeBearingHoles;
      hBottomPartClamp = zScrewHoleBottom-getRFlangeBearingWasherOuter(smallFB);
      hTopPartClamp = zScrewHoleTop-getRFlangeBearingWasherOuter(smallFB);
      
      hYMaxCarriageConnector = (hYCarriage+hBottomPartClamp)/2-calcScrewFlesh(rScrew);
		union()
		{
			translate([0,0,hYCarriage/2]) cube([wYCarriage,lYCarriage,hYCarriage],true);
			translate([distBetweenYMaxRods/2,0,hYCarriage/2]) cube([wYCarriage,lYCarriage,hYCarriage],true);
			translate([-distBetweenYMaxRods/2,0,hYCarriage/2]) cube([wYCarriage,lYCarriage,hYCarriage],true);
         
         translate([0,(lYCarriage/2-lYMaxCarriageConnector/2),hYMaxCarriageConnector/2]) cube([wYMaxCarriageConnector,lYMaxCarriageConnector,hYMaxCarriageConnector],true);
         translate([0,-(lYCarriage/2-lYMaxCarriageConnector/2),hYMaxCarriageConnector/2]) cube([wYMaxCarriageConnector,lYMaxCarriageConnector,hYMaxCarriageConnector],true);
         
         rConnectorFillet = hYCarriage - hYMaxCarriageConnector;
         if( rConnectorFillet > 0 )
         {
            translate([wYCarriage/2+rConnectorFillet,lYCarriage/2-lYMaxCarriageConnector,hYMaxCarriageConnector+rConnectorFillet]) rotate([0,90,90]) drawCornerFillet(rConnectorFillet, lYMaxCarriageConnector);
            mirror([1,0,0]) translate([wYCarriage/2+rConnectorFillet,lYCarriage/2-lYMaxCarriageConnector,hYMaxCarriageConnector+rConnectorFillet]) rotate([0,90,90]) drawCornerFillet(rConnectorFillet, lYMaxCarriageConnector);
            mirror([0,1,0])translate([wYCarriage/2+rConnectorFillet,lYCarriage/2-lYMaxCarriageConnector,hYMaxCarriageConnector+rConnectorFillet]) rotate([0,90,90]) drawCornerFillet(rConnectorFillet, lYMaxCarriageConnector);
            mirror([0,1,0])mirror([1,0,0]) translate([wYCarriage/2+rConnectorFillet,lYCarriage/2-lYMaxCarriageConnector,hYMaxCarriageConnector+rConnectorFillet]) rotate([0,90,90]) drawCornerFillet(rConnectorFillet, lYMaxCarriageConnector);
            
            translate([distBetweenYMaxRods/2-wYCarriage/2-rConnectorFillet,lYCarriage/2-lYMaxCarriageConnector,hYMaxCarriageConnector+rConnectorFillet]) rotate([-90,0,0]) drawCornerFillet(rConnectorFillet, lYMaxCarriageConnector);
            mirror([1,0,0]) translate([distBetweenYMaxRods/2-wYCarriage/2-rConnectorFillet,lYCarriage/2-lYMaxCarriageConnector,hYMaxCarriageConnector+rConnectorFillet]) rotate([-90,0,0]) drawCornerFillet(rConnectorFillet, lYMaxCarriageConnector);
            mirror([0,1,0])translate([distBetweenYMaxRods/2-wYCarriage/2-rConnectorFillet,lYCarriage/2-lYMaxCarriageConnector,hYMaxCarriageConnector+rConnectorFillet]) rotate([-90,0,0]) drawCornerFillet(rConnectorFillet, lYMaxCarriageConnector);
            mirror([0,1,0])mirror([1,0,0]) translate([distBetweenYMaxRods/2-wYCarriage/2-rConnectorFillet,lYCarriage/2-lYMaxCarriageConnector,hYMaxCarriageConnector+rConnectorFillet]) rotate([-90,0,0]) drawCornerFillet(rConnectorFillet, lYMaxCarriageConnector);
         }
			translate([distBetweenXRods/2,0,0]) cylinder(hYCarriage+hBottomPartClamp, rYCarriage, rYCarriage);
			translate([-distBetweenXRods/2,0,0]) cylinder(hYCarriage+hBottomPartClamp, rYCarriage, rYCarriage);
         translate([wYCarriage/2-eps,-rYCarriage,0]) cube([(distBetweenXRods-wYCarriage)/2+eps,2*rYCarriage,hYCarriage+hBottomPartClamp]);
			mirror([1,0,0]) translate([wYCarriage/2-eps,-rYCarriage,0]) cube([(distBetweenXRods-wYCarriage)/2+eps,2*rYCarriage,hYCarriage+hBottomPartClamp]);
			translate([-wYCarriage/2-filletYCarriage,rYCarriage+filletYCarriage,0]) rotate([0,0,-90]) drawCornerFillet(filletYCarriage, hYCarriage);
			mirror([0,1,0]) mirror([1,0,0]) translate([-wYCarriage/2-filletYCarriage,rYCarriage+filletYCarriage,0]) rotate([0,0,-90]) drawCornerFillet(filletYCarriage, hYCarriage);
			translate([-wYCarriageTopPart/2,-lYCarriageTopPart/2,hYCarriage-eps]) drawYCarriageTopPart();
         
			rFillet = (wYCarriage-wYCarriageTopPart)/2;
			if (rFillet > 0) {
				translate([-wYCarriageTopPart/2-rFillet,-lYCarriageTopPart/2,hYCarriage+rFillet]) rotate([-90,0,0]) drawCornerFillet(rFillet, lYCarriageTopPart);
				mirror([1,0,0]) translate([-wYCarriageTopPart/2-rFillet,-lYCarriageTopPart/2,hYCarriage+rFillet]) rotate([-90,0,0]) drawCornerFillet(rFillet, lYCarriageTopPart);
			}
		}
		union()
		{
         //cuts for Yrod bearings
			for( i = [-1,1] ) translate([i*distBetweenYMaxRods/2,0,0])
         {
            translate([0,lYCarriage/2-getLBearing(BearingY)/2-tYCarriageSmall,0]) rotate([90,0,0]) drawBearingMask(BearingY);
            mirror([0,1,0]) translate([0,lYCarriage/2-getLBearing(BearingY)/2-tYCarriageSmall,0]) rotate([90,0,0]) drawBearingMask(BearingY);
            offsetX = wYCarriage/2-rScrew-calcScrewFlesh(rScrew)/2;
            translate([offsetX,lYCarriage/4,hYCarriage/2]) drawScrewHole(hYCarriage+2*eps);
            translate([-offsetX,lYCarriage/4,hYCarriage/2]) drawScrewHole(hYCarriage+2*eps);
            translate([offsetX,-lYCarriage/4,hYCarriage/2]) drawScrewHole(hYCarriage+2*eps);
            translate([-offsetX,-lYCarriage/4,hYCarriage/2]) drawScrewHole(hYCarriage+2*eps);
            translate([offsetX,lYCarriage/4,hYCarriage-tNut+eps]) drawNutMask();
            translate([-offsetX,lYCarriage/4,hYCarriage-tNut+eps]) drawNutMask();
            translate([offsetX,-lYCarriage/4,hYCarriage-tNut+eps]) drawNutMask();
            translate([-offsetX,-lYCarriage/4,hYCarriage-tNut+eps]) drawNutMask();
         }

			// cuts for xrods
			translate([distBetweenXRods/2,0,-eps]) cylinder(hYCarriage+hTopPartClamp+2*eps,getRBearingInner(BearingX),getRBearingInner(BearingX), $fn=50);
			translate([-distBetweenXRods/2,0,-eps]) cylinder(hYCarriage+hTopPartClamp+2*eps,getRBearingInner(BearingX),getRBearingInner(BearingX), $fn=50);

			translate([wYCarriage/2,rYCarriage-cutDepthYCarriage,-eps]) cube([cutWidthYCarriage,cutDepthYCarriage+eps,hYCarriage+hBottomPartClamp+2*eps]);	
			translate([wYCarriage/2,rYCarriage-cutDepthYCarriage,-eps]) cube([distBetweenXRods/2-wYCarriage/2,cutWidthYCarriage,hYCarriage+hBottomPartClamp+2*eps]);	
			translate([wYCarriage/2+rScrew+calcScrewFlesh(rScrew)/2+cutWidthYCarriage,0,(hYCarriage+hBottomPartClamp)/2]) rotate([90,90,0]) drawScrewHole();
         hull() translate([wYCarriage/2+rScrew+calcScrewFlesh(rScrew)/2+cutWidthYCarriage,-rYCarriage+tNut,(hYCarriage+hBottomPartClamp)/2]) rotate([90,0,0]) {
            drawNutMask();
            translate([0,0,rYCarriage]) drawNutMask();
         }
			
         mirror([1,0,0]) mirror([0,1,0]) {
				translate([wYCarriage/2,rYCarriage-cutDepthYCarriage,-eps]) cube([cutWidthYCarriage,cutDepthYCarriage+eps,hYCarriage+hBottomPartClamp+2*eps]);	
				translate([wYCarriage/2,rYCarriage-cutDepthYCarriage,-eps]) cube([distBetweenXRods/2-wYCarriage/2,cutWidthYCarriage,hYCarriage+hBottomPartClamp+2*eps]);	
				translate([wYCarriage/2+rScrew+calcScrewFlesh(rScrew)/2+cutWidthYCarriage,0,(hYCarriage+hBottomPartClamp)/2]) rotate([90,90,0]) drawScrewHole();		
            hull() translate([wYCarriage/2+rScrew+calcScrewFlesh(rScrew)/2+cutWidthYCarriage,-rYCarriage+tNut,(hYCarriage+hBottomPartClamp)/2]) rotate([90,0,0]) {
               drawNutMask();
               translate([0,0,rYCarriage]) drawNutMask();
            }
			}
		}
	}
}

module drawXYIdlerWallFlat(zScrewAxis,rScrew,R)
{
	polygon([[0,0],[wXYIdler,0],[wXYIdler+R,zScrewAxis-tXYIdler+2*rScrew+hXYIdlerExtension],[0,0]]);
}


module drawXYIdlerWall(zScrewAxis,rScrew,R,h)
{
	rotate([90,0,0]) linear_extrude(height = h, center = true, convexity = 10, twist = 0, slices = 20, scale = 1.0) drawXYIdlerWallFlat(zScrewAxis,rScrew,R);
}


module drawXYIdler()
{
	zScrewAxis = distHeartYRodToFlangeBearingHole + distYRodToMidSideAluProfile - wAlu1/2;
	rScrew = getRFlangeBearingInner(smallFB);
	screwFlesh = calcScrewFleshSmallFB()/2;
	R = rScrew+screwFlesh;

	color(colorPlastic)
	difference()
	{
		union()
		{
			translate([-wAlu1/2+clearanceXYIdler,-lXYIdler/2,0]) cube([wXYIdler-tXYIdler/2+eps,lXYIdler,tXYIdler]);
			translate([-wAlu1/2+clearanceXYIdler,0,tXYIdler-eps]) {
				drawXYIdlerWall(zScrewAxis,rScrew,R,tXYIdler/2);
				translate([0,-lXYIdler/2+tXYIdler/4,0]) drawXYIdlerWall(zScrewAxis,rScrew,R,tXYIdler/2);
				translate([0,lXYIdler/2-tXYIdler/4,0]) drawXYIdlerWall(zScrewAxis,rScrew,R,tXYIdler/2);
			}
			hull(){
				translate([wXYIdler-wAlu1/2+clearanceXYIdler+R,0,zScrewAxis]) rotate([90,0,0]) translate([0,0,-lXYIdler/2]) cylinder(lXYIdler,R,R,$fn=100);
				translate([wXYIdler-wAlu1/2+clearanceXYIdler-tXYIdler/2,0,tXYIdler/2]) rotate([90,0,0]) translate([0,0,-lXYIdler/2]) cylinder(lXYIdler,tXYIdler/2,tXYIdler/2,$fn=100);
			}						
		}
		union()
		{
			translate([0,distYCarriageCenterFlangeBearingToCenterFlangeBearing/2,tXYIdler/2]) drawAluScrewHole(tXYIdler+2*eps);
			translate([0,-distYCarriageCenterFlangeBearingToCenterFlangeBearing/2,tXYIdler/2]) drawAluScrewHole(tXYIdler+2*eps);
			translate([wXYIdler-wAlu1/2+clearanceXYIdler+R,0,zScrewAxis]) rotate([90,0,0]) {
				drawFlangeBearingScrewHole(smallFB, lXYIdler+2*eps);
				translate([0,0,distYCarriageCenterFlangeBearingToCenterFlangeBearing/2]) drawFlangeBearingHole(smallFB);
				translate([0,0,-distYCarriageCenterFlangeBearingToCenterFlangeBearing/2]) drawFlangeBearingHole(smallFB);
			}
			if (overhangYRodMount > 0) {
				translate([wAlu1/2,-bigSize/2,0]) cube([bigSize,bigSize,overhangYRodMount+clearanceXYIdler]);
			}
		}
	}
}



module drawXYMotorMountPlateFlat(h,w)
{
	polygon([[0,eps],[w,eps],[0,-h],[0,eps]]);
}


module drawXYMotorMountPlate(h,w)
{
	linear_extrude(height = tXYMotorMount, center = true, convexity = 10, twist = 0, slices = 20, scale = 1.0) drawXYMotorMountPlateFlat(h,w);
}


module drawXYMotorMountPlateFlat2(h,w)
{
	h1 = (2*rAluScrew + calcScrewFlesh(rAluScrew)); 
	h2 = h1 + w;
	polygon([[0,0],[w,0],[w,h1],[0,h2],[0,0]]);
}


module drawXYMotorMountPlate2(h,w)
{
	linear_extrude(height = tXYMotorMount, center = true, convexity = 10, twist = 0, slices = 20, scale = 1.0) drawXYMotorMountPlateFlat2(h,w);
}


module drawXYMotorMountPlateFlat3(h,w,lengthSupport)
{
	q = 2*rAluScrew + calcScrewFlesh(rAluScrew);
	h1 = h - q; 
	h2 = h1 - 0.6*q;
	w1 = w - lengthSupport;
	polygon([[0,-h1],[0,-h2],[-w1,eps],[-w,eps],[0,-h1]]);
}


module drawXYMotorMountPlate3(h,w,lengthSupport)
{
	linear_extrude(height = tXYMotorMount, center = true, convexity = 10, twist = 0, slices = 20, scale = 1.0) drawXYMotorMountPlateFlat3(h,w,lengthSupport);
}


function calcLengthXYMotorMount() = (lXYMotorMount > getW1Nema(motorXY)) ? lXYMotorMount : getW1Nema(motorXY);


function calcOffsetXYMotorMount() = (lXYMotorMount > getW1Nema(motorXY)) ? 0 : lXYMotorMount - getW1Nema(motorXY);


module drawXYMotorMount(prmIsLeftMotor)
{
	w1 = rAluScrew + calcScrewFlesh(rAluScrew)/2 + wAlu1/2;
	h1 = distXYMotorMountHoles + 2*rAluScrew + calcScrewFlesh(rAluScrew);
	lengthMotorMount = calcLengthXYMotorMount();
	offsetY = calcOffsetXYMotorMount();
	distYRodToTopMotor = prmIsLeftMotor ? distYRodToTopMotorLeft : distYRodToTopMotorRight;
	lengthSupport = 0.7*(wXYMotorMount1-tXYMotorMount-2*rAluScrew-calcScrewFlesh(rAluScrew));
	offsetSupport = 0.8*tXYMotorMount;
   
	color(colorPlastic)
	difference()
	{
		union()
		{
			translate([0,offsetY,0]) cube([wXYMotorMount1,lengthMotorMount,tXYMotorMount]);
			translate([-w1,eps,-h1+tXYMotorMount]) cube([w1+tXYMotorMount,tXYMotorMount,h1]);
			translate([tXYMotorMount/2,0,0]) rotate([0,0,-90]) rotate([90,0,0]) translate([0,-(h1-tXYMotorMount),0]) drawXYMotorMountPlate2(h1-tXYMotorMount,w1);
			translate([tXYMotorMount/2,tXYMotorMount,0]) rotate([90,0,0]) rotate([0,90,0]) drawXYMotorMountPlate(h1-tXYMotorMount,lXYMotorMount-tXYMotorMount);
			translate([tXYMotorMount,-wAlu1/2+offsetSupport,0]) rotate([0,0,180]) rotate([90,0,0]) drawXYMotorMountPlate3(h1-tXYMotorMount,wXYMotorMount1-tXYMotorMount,lengthSupport);
			translate([wXYMotorMount1-lengthSupport,-(wAlu1/2+tXYMotorMount/2-offsetSupport),0]) cube([lengthSupport,wAlu1/2+tXYMotorMount/2,tXYMotorMount]);
		}
		union()
		{
			translate([-eps,-wAlu1/2,distYRodToTopMotor]) scale(clearanceScaleFactor) rotate([0,0,90]) rotate([90,0,0]) drawYRodMount(true);
			translate([wXYMotorMount1-getW1Nema(motorXY)/2,lXYMotorMount-getW1Nema(motorXY)/2,0]) {
				translate([0,0,-eps]) cylinder(tXYMotorMount+2*eps,rXYMotorMountNema,rXYMotorMountNema,$fn=200);
				offsetHole = getDistScrewHolesNema(motorXY)/2;
				translate([offsetHole,offsetHole,tXYMotorMount/2]) drawNemaScrewHole(motorXY,tXYMotorMount+2*eps);
				translate([-offsetHole,offsetHole,tXYMotorMount/2]) drawNemaScrewHole(motorXY,tXYMotorMount+2*eps);
				translate([offsetHole,-offsetHole,tXYMotorMount/2]) drawNemaScrewHole(motorXY,tXYMotorMount+2*eps);
				translate([-offsetHole,-offsetHole,tXYMotorMount/2]) drawNemaScrewHole(motorXY,tXYMotorMount+2*eps);
			}

			offsetScrewHole = rAluScrew+calcScrewFlesh(rAluScrew)/2-tXYMotorMount;
			if (useHammerNuts) {
				translate([-wAlu1/2,0,-offsetScrewHole]) rotate([90,0,0]) drawAluOpenScrewHole();
				translate([-wAlu1/2,0,-offsetScrewHole-distXYMotorMountHoles]) rotate([90,0,0]) rotate([0,0,180]) drawAluOpenScrewHole();
			} else {
				translate([-wAlu1/2,0,-offsetScrewHole]) rotate([90,0,0]) drawAluScrewHole();
				translate([-wAlu1/2,0,-offsetScrewHole-distXYMotorMountHoles]) rotate([90,0,0]) drawAluScrewHole();
			}
			translate([0,-wAlu1/2,-offsetScrewHole-distXYMotorMountHoles]) rotate([0,90,0]) drawAluScrewHole();
		}
	}
}


module drawXYMotorMountRight()
{
	drawXYMotorMount(false);
}


module drawXYMotorMountLeft()
{
	mirror([0,1,0]) drawXYMotorMount(true);
}




module drawXYMaxMotorMount(prmIsLeftMotor)
{
	w1 = rAluScrew + calcScrewFlesh(rAluScrew)/2 + wAlu1/2;
	h1 = distXYMotorMountHoles + 2*rAluScrew + calcScrewFlesh(rAluScrew);
	lengthMotorMount = calcLengthXYMotorMount();
	offsetY = calcOffsetXYMotorMount();
	distYRodToTopMotor = prmIsLeftMotor ? distYRodToTopMotorLeft : distYRodToTopMotorRight;
	lengthSupport = 0.7*(wXYMotorMount1-tXYMotorMount-2*rAluScrew-calcScrewFlesh(rAluScrew));
	offsetSupport = 0.8*tXYMotorMount;
   
	color(colorPlastic)
	difference()
	{
		union()
		{
			translate([0,offsetY,0]) cube([wXYMotorMount1,lengthMotorMount,tXYMotorMount]);
			translate([-w1,eps,-h1+tXYMotorMount]) cube([w1+tXYMotorMount,tXYMotorMount,h1]);
			translate([tXYMotorMount/2,0,0]) rotate([0,0,-90]) rotate([90,0,0]) translate([0,-(h1-tXYMotorMount),0]) drawXYMotorMountPlate2(h1-tXYMotorMount,w1);
			translate([tXYMotorMount/2,tXYMotorMount,0]) rotate([90,0,0]) rotate([0,90,0]) drawXYMotorMountPlate(h1-tXYMotorMount,lXYMotorMount-tXYMotorMount);
			translate([tXYMotorMount,-wAlu1/2+offsetSupport,0]) rotate([0,0,180]) rotate([90,0,0]) drawXYMotorMountPlate3(h1-tXYMotorMount,wXYMotorMount1-tXYMotorMount,lengthSupport);
			translate([wXYMotorMount1-lengthSupport,-(wAlu1/2+tXYMotorMount/2-offsetSupport),0]) cube([lengthSupport,wAlu1/2+tXYMotorMount/2,tXYMotorMount]);
		}
		union()
		{
			translate([-eps,-wAlu1/2,distYRodToTopMotor]) scale(clearanceScaleFactor) rotate([0,0,90]) rotate([90,0,0]) drawYMaxRodMount(true);
			translate([wXYMotorMount1-getW1Nema(motorXY)/2,lXYMotorMount-getW1Nema(motorXY)/2,0]) {
				translate([0,0,-eps]) cylinder(tXYMotorMount+2*eps,rXYMotorMountNema,rXYMotorMountNema,$fn=200);
				offsetHole = getDistScrewHolesNema(motorXY)/2;
				translate([offsetHole,offsetHole,tXYMotorMount/2]) drawNemaScrewHole(motorXY,tXYMotorMount+2*eps);
				translate([-offsetHole,offsetHole,tXYMotorMount/2]) drawNemaScrewHole(motorXY,tXYMotorMount+2*eps);
				translate([offsetHole,-offsetHole,tXYMotorMount/2]) drawNemaScrewHole(motorXY,tXYMotorMount+2*eps);
				translate([-offsetHole,-offsetHole,tXYMotorMount/2]) drawNemaScrewHole(motorXY,tXYMotorMount+2*eps);
			}

			offsetScrewHole = rAluScrew+calcScrewFlesh(rAluScrew)/2-tXYMotorMount;
			if (useHammerNuts) {
				translate([-wAlu1/2,0,-offsetScrewHole]) rotate([90,0,0]) drawAluOpenScrewHole();
				translate([-wAlu1/2,0,-offsetScrewHole-distXYMotorMountHoles]) rotate([90,0,0]) rotate([0,0,180]) drawAluOpenScrewHole();
			} else {
				translate([-wAlu1/2,0,-offsetScrewHole]) rotate([90,0,0]) drawAluScrewHole();
				translate([-wAlu1/2,0,-offsetScrewHole-distXYMotorMountHoles]) rotate([90,0,0]) drawAluScrewHole();
			}
			translate([0,-wAlu1/2,-offsetScrewHole-distXYMotorMountHoles]) rotate([0,90,0]) drawAluScrewHole();
		}
	}
}
module drawXYMaxMotorMountRight()
{
	drawXYMaxMotorMount(false);
}


module drawXYMaxMotorMountLeft()
{
	mirror([0,1,0]) drawXYMaxMotorMount(true);
}

module drawXCarriageBeltMask()
{
	translate([0,-GT2_P/2,GT2_H-clampForceXCarriageBelt]) rotate([-90,0,0]) rotate([0,90,0])
	for (i=[1:nrOfImprintTooth]) {
		translate([(i-1)*GT2_P,0,-wBelt/2-clearanceBeltSmall]) drawTimingBeltUnit(wBelt+2*clearanceBeltSmall);
	}
}


module drawXCarriageNutHoleMask()
{
	h = tNut + tNutHead + 2*clearanceNut;
	w = wNut + 2*clearanceNut;
	cube([w,wXCarriageBeltClamp+clearanceNut+eps,h],true);
}


module drawXCarriage()
{
	color(colorPlastic)
	difference()
	{
		union()
		{
			translate([0,0,hXCarriage/2]) cube([wXCarriage,lXCarriage,hXCarriage],true);
		}
		union()
		{			
			translate([-distBetweenXRods/2,lXCarriage/2-getLBearing(BearingX)/2-tXCarriageSmall,0]) rotate([90,0,0]) drawBearingMask(BearingX);
			mirror([0,1,0]) translate([-distBetweenXRods/2,lXCarriage/2-getLBearing(BearingX)/2-tXCarriageSmall,0]) rotate([90,0,0]) drawBearingMask(BearingX);
			translate([distBetweenXRods/2,0,0]) rotate([90,0,0]) drawBearingMask(BearingX);

			offsetX1 = distBetweenXRods/2-rScrew-calcScrewFlesh(rScrew)/2-getRBearingOuter(BearingX);
			offsetX2 = distBetweenXRods/2+rScrew+calcScrewFlesh(rScrew)/2+getRBearingOuter(BearingX);

			// top rod
			translate([-offsetX1,lXCarriage/4,hXCarriage/2]) drawScrewHole(hXCarriage+2*eps);
			translate([-offsetX2,lXCarriage/4,hXCarriage/2]) drawScrewHole(hXCarriage+2*eps);
			translate([-offsetX1,-lXCarriage/4,hXCarriage/2]) drawScrewHole(hXCarriage+2*eps);
			translate([-offsetX2,-lXCarriage/4,hXCarriage/2]) drawScrewHole(hXCarriage+2*eps);
			translate([-offsetX1,lXCarriage/4,hXCarriage-tNut+eps]) drawNutMask();
			translate([-offsetX2,lXCarriage/4,hXCarriage-tNut+eps]) drawNutMask();
			translate([-offsetX1,-lXCarriage/4,hXCarriage-tNut+eps]) drawNutMask();
			translate([-offsetX2,-lXCarriage/4,hXCarriage-tNut+eps]) drawNutMask();

			// bottom rod
			translate([offsetX1,0,hXCarriage/2]) drawScrewHole(hXCarriage+2*eps);
			translate([offsetX2,0,hXCarriage/2]) drawScrewHole(hXCarriage+2*eps);
			translate([offsetX1,0,hXCarriage-tNut+eps]) drawNutMask();
			translate([offsetX2,0,hXCarriage-tNut+eps]) drawNutMask();

			// belt mount
			offsetY = lXCarriage/2 - rScrew - calcScrewFlesh(rScrew)/2;
			offsetX3 = distYCarriageCenterFlangeBearingToCenterFlangeBearing/2 + wBelt/2 + clearanceBeltSmall + rScrew + calcScrewFlesh(rScrew)/2;
			translate([-offsetX3,offsetY,hXCarriage/2]) drawScrewHole(hXCarriage+2*eps);
			translate([0,offsetY,hXCarriage/2]) drawScrewHole(hXCarriage+2*eps);
			translate([offsetX3,offsetY,hXCarriage/2]) drawScrewHole(hXCarriage+2*eps);
//			translate([distYCarriageCenterFlangeBearingToCenterFlangeBearing/2,lXCarriage/2,-eps]) drawXCarriageBeltMask();
			translate([-distYCarriageCenterFlangeBearingToCenterFlangeBearing/2,lXCarriage/2,-eps]) drawXCarriageBeltMask();
			translate([-offsetX3,offsetY,hXCarriage/2]) drawXCarriageNutHoleMask();
			translate([0,offsetY,hXCarriage/2]) drawXCarriageNutHoleMask();
			translate([offsetX3,offsetY,hXCarriage/2]) drawXCarriageNutHoleMask();
			mirror([0,1,0]) {
				translate([-offsetX3,offsetY,hXCarriage/2]) drawScrewHole(hXCarriage+2*eps);
				translate([0,offsetY,hXCarriage/2]) drawScrewHole(hXCarriage+2*eps);
				translate([offsetX3,offsetY,hXCarriage/2]) drawScrewHole(hXCarriage+2*eps);
				translate([distYCarriageCenterFlangeBearingToCenterFlangeBearing/2,lXCarriage/2,-eps]) drawXCarriageBeltMask();
//				translate([-distYCarriageCenterFlangeBearingToCenterFlangeBearing/2,lXCarriage/2,-eps]) drawXCarriageBeltMask();
				translate([-offsetX3,offsetY,hXCarriage/2]) drawXCarriageNutHoleMask();
				translate([0,offsetY,hXCarriage/2]) drawXCarriageNutHoleMask();
				translate([offsetX3,offsetY,hXCarriage/2]) drawXCarriageNutHoleMask();
			}

			// extruder mount holes
			translate([-offsetX1/2,distExtruderMountHoles/2,0]) drawExtruderMountHole(true);
			translate([-offsetX1/2,0,0]) drawExtruderMountHole(true);
			translate([-offsetX1/2,-distExtruderMountHoles/2,0]) drawExtruderMountHole(true);
			translate([0,distExtruderMountHoles/2,0]) drawExtruderMountHole(true);
			translate([0,0,0]) drawExtruderMountHole(true);
			translate([0,-distExtruderMountHoles/2,0]) drawExtruderMountHole(true);			
			translate([offsetX1/2,distExtruderMountHoles/2,0]) drawExtruderMountHole(true);
			translate([offsetX1/2,0,0]) drawExtruderMountHole(true);
			translate([offsetX1/2,-distExtruderMountHoles/2,0]) drawExtruderMountHole(true);

			// extra mount holes
//			translate([offsetX2,offsetY,0]) drawExtruderMountHole(true);
//			translate([offsetX2,-offsetY,0]) drawExtruderMountHole(true);
		}
	}
}


module drawXCarriageBeltClamp()
{
	color(colorPlastic)
	difference()
	{
		union()
		{
			w = distYCarriageCenterFlangeBearingToCenterFlangeBearing + wBelt + 2*clearanceBeltSmall + 4*rScrew + 2*calcScrewFlesh(rScrew);
			translate([0,0,tXCarriageBeltClamp/2]) cube([w,wXCarriageBeltClamp,tXCarriageBeltClamp],true);
		}
		union()
		{
			offsetX = distYCarriageCenterFlangeBearingToCenterFlangeBearing/2 + wBelt/2 + clearanceBeltSmall + rScrew + calcScrewFlesh(rScrew)/2;
			translate([-offsetX,0,0]) drawScrewHole();
			drawScrewHole();
			translate([offsetX,0,0]) drawScrewHole();
			translate([offsetX/2,wXCarriageBeltClampImprintCorrected/2,0]) rotate([0,0,0]) drawXCarriageBeltMask();
		}
	}
}


module drawXEndstopMount()
{
	h = 2*rScrew+calcScrewFlesh(rScrew);
	color(colorPlastic)
	difference()
	{
		union()
		{
			cylinder(h,getRBearingInner(BearingX)+tXEndstopMount,getRBearingInner(BearingX)+tXEndstopMount,$fn=100);
			lx = getRBearingInner(BearingX) + tXEndstopMount + 2*rScrew+calcScrewFlesh(rScrew);
			translate([0,getRBearingInner(BearingX),0]) cube([lx,tXEndstopMount,h]);
			translate([0,getRBearingInner(BearingX)+tXEndstopMount-eps,0]) cube([lx,tXEndstopMount+eps,h]);
			translate([0,getRBearingInner(BearingX)-tXEndstopMount-tXEndstopClampForce,0]) cube([lx,tXEndstopMount,h]);
		}
		union()
		{			
			translate([0,0,-bigSize/2]) cylinder(bigSize,getRBearingInner(BearingX),getRBearingInner(BearingX),$fn=100);
			translate([0,getRBearingInner(BearingX)-tXEndstopClampForce,-bigSize/2]) cube([bigSize,tXEndstopClampForce,bigSize]);
			translate([getRBearingInner(BearingX)+tXEndstopMount+rScrew+calcScrewFlesh(rScrew)/2,0,h/2]) rotate([90,0,0]) drawScrewHole();
		}
	}
}


module drawYEndstopMount()
{
	color(colorPlastic)
	difference()
	{
		union()
		{
			cylinder(hMicroSwitch,getRBearingInner(BearingY)+tYEndstopMount,getRBearingInner(BearingY)+tYEndstopMount,$fn=100);
			lx = getRBearingInner(BearingY) + lMicroSwitch;
			translate([0,getRBearingInner(BearingY),0]) cube([lx,tYEndstopMount,hMicroSwitch]);
			translate([0,getRBearingInner(BearingY)-wMicroSwitch-tYEndstopMount,0]) cube([lx,tYEndstopMount,hMicroSwitch]);
		}
		union()
		{			
			translate([0,0,-bigSize/2]) cylinder(bigSize,getRBearingInner(BearingY),getRBearingInner(BearingY),$fn=100);
			translate([0,getRBearingInner(BearingY)-wMicroSwitch-tYEndstopClampForce,-bigSize/2]) cube([bigSize,wMicroSwitch+tYEndstopClampForce,bigSize]);
			xOffset = getRBearingInner(BearingY) + (lMicroSwitch-distMicroSwitchMountHoles)/2;
			translate([xOffset,0,offsetMicroSwitchMountHole]) rotate([90,0,0]) cylinder(bigSize,rMicroSwitchScrew,rMicroSwitchScrew,true,$fn=50);
			translate([xOffset+distMicroSwitchMountHoles,0,offsetMicroSwitchMountHole]) rotate([90,0,0]) cylinder(bigSize,rMicroSwitchScrew,rMicroSwitchScrew,true,$fn=50);
		}
	}
}


module drawWireHolderClip(prmUseTieRap)
{
	tBottom = (prmUseTieRap) ? 2*tWireHolderClipBottom : tWireHolderClipBottom;
	color(colorPlastic)
	difference()
	{
		union()
		{
			translate([0,0,tBottom/2]) cube([lWireHolderClip,wWireHolderClip,tBottom],true);
			translate([0,0,tBottom-eps]) cylinder(tWireHolderClipMid+2*eps,rWireHolderClip,rWireHolderClip,$fn=100);			
			translate([0,0,tBottom+tWireHolderClipMid]) cylinder(tWireHolderClipTopCone+eps,rWireHolderClip,rWireHolderClip+overlapWireHolderClip,$fn=100);
			translate([0,0,tBottom+tWireHolderClipMid+tWireHolderClipTopCone]) cylinder(tWireHolderClipTop,rWireHolderClip+overlapWireHolderClip,rWireHolderClip+overlapWireHolderClip,$fn=100);
		}
		union()
		{
			translate([-bigSize/2,rWireHolderClip,tBottom]) cube([bigSize,bigSize,bigSize]);
			mirror([0,1,0]) translate([-bigSize/2,rWireHolderClip,tBottom]) cube([bigSize,bigSize,bigSize]);
			if (prmUseTieRap) {
				translate([0,0,tBottom/2]) cube([bigSize,wTieRap,hTieRap],true);
				translate([0,0,tBottom/2]) cube([wTieRap,bigSize,hTieRap],true);
			}
		}
	}
}


module drawShockAbsorber()
{
	color(colorPlastic)
	hull()
	{
		translate([wShockAbsorber/2,wShockAbsorber/2,0]) cylinder(tShockAbsorber,rShockAbsorber,rShockAbsorber,$fn=50);
		translate([-wShockAbsorber/2,wShockAbsorber/2,0]) cylinder(tShockAbsorber,rShockAbsorber,rShockAbsorber,$fn=50);
		translate([-wShockAbsorber/2,-wShockAbsorber/2,0]) cylinder(tShockAbsorber,rShockAbsorber,rShockAbsorber,$fn=50);
		translate([wShockAbsorber/2,-wShockAbsorber/2,0]) cylinder(tShockAbsorber,rShockAbsorber,rShockAbsorber,$fn=50);
	}
}


module drawExtruder()
{
	color(colorBronze) 
	translate([0,0,-hHotEnd-hTipHotEnd]) {
		translate([-wExtruder/2,-dExtruder/2,hHotEnd+hTipHotEnd]) cube([wExtruder,dExtruder,hExtruder-hHotEnd-hTipHotEnd]);
		translate([0,0,hTipHotEnd-eps]) cylinder(hHotEnd+2*eps,rHotEnd,rHotEnd,$fn=50);
		cylinder(hTipHotEnd,0,rHotEnd,$fn=50);
	}
}


module drawLeadScrewNut()
{
	color(colorBronze)
	difference()
	{
		union()
		{
			translate([0,0,hLeadScrewNut2+hLeadScrewNut3-eps]) cylinder(hLeadScrewNut1+eps,rLeadScrewNut3,rLeadScrewNut3,$fn=50);
			translate([0,0,hLeadScrewNut3]) cylinder(hLeadScrewNut2,rLeadScrewNut1,rLeadScrewNut1,$fn=100);
			cylinder(hLeadScrewNut3+eps,rLeadScrewNut3,rLeadScrewNut3,$fn=50);
		}
		union()
		{
			translate([0,0,-bigSize/2]) cylinder(bigSize,rLeadScrewNut4,rLeadScrewNut4, $fn=50);
			for (i = [0:nrOfLeadScrewNutHoles-1]) {
				angle = i*360/nrOfLeadScrewNutHoles;
				rotate([0,0,angle]) translate([rLeadScrewNut2,0,-bigSize/2]) cylinder(bigSize,rLeadScrewNutHole,rLeadScrewNutHole, $fn=25);
			}
		}
	}
}


module drawCoupler()
{
	color(colorAlu)
	translate([0,0,-lCoupler/2]) difference()
	{
		union()
		{
			cylinder(lCoupler,rCouplerOuter,rCouplerOuter,$fn=100);
		}
		union()
		{
			translate([0,0,lCoupler/2]) cylinder(lCoupler/2+eps,rCouplerInner2,rCouplerInner2, $fn=50);
			translate([0,0,-eps]) cylinder(lCoupler/2+2*eps,rCouplerInner1,rCouplerInner1, $fn=50);
		}
	}
}


module drawNema(prmNemaType)
{
	translate([0,0,getHNema(prmNemaType)/2]) difference()
	{
		union()
		{
			cube([getW1Nema(prmNemaType),getW1Nema(prmNemaType),getHNema(prmNemaType)],true);
		}
		union()
		{
			rotate([0,0,45]) difference()
			{
				cube([bigSize,bigSize,bigSize],true);
				cube([getW2Nema(prmNemaType),getW2Nema(prmNemaType),getHNema(prmNemaType)],true);
			}
			offsetHole = getDistScrewHolesNema(prmNemaType)/2;
			hHole = getHScrewHoleNema(prmNemaType);
			translate([offsetHole,offsetHole,getHNema(prmNemaType)/2-hHole/2]) drawNemaScrewHole(prmNemaType, hHole+2*eps);
			translate([-offsetHole,offsetHole,getHNema(prmNemaType)/2-hHole/2]) drawNemaScrewHole(prmNemaType, hHole+2*eps);
			translate([-offsetHole,-offsetHole,getHNema(prmNemaType)/2-hHole/2]) drawNemaScrewHole(prmNemaType, hHole+2*eps);
			translate([offsetHole,-offsetHole,getHNema(prmNemaType)/2-hHole/2]) drawNemaScrewHole(prmNemaType, hHole+2*eps);
		}
	}
	translate([0,0,getHNema(prmNemaType)-eps]) cylinder(getHCylinderNema(prmNemaType)+eps,getRCylinderNema(prmNemaType),getRCylinderNema(prmNemaType), $fn=100);
	translate([0,0,getHNema(prmNemaType)+getHCylinderNema(prmNemaType)-eps]) cylinder(getHAxleNema(prmNemaType)+eps,getRAxleNema(prmNemaType),getRAxleNema(prmNemaType), $fn=50);
}


module drawAluCornerPieceFlat()
{	polygon([[-eps,-eps],[-eps,hAluCornerPiece+eps],[hAluCornerPiece+eps,-eps],[-eps,-eps]]);
}


module drawAluCornerPiece()
{
	color(colorSteel1)
	difference() {
		union()
		{
			rotate([90,0,0]) linear_extrude(height = hAluCornerPiece, center = true, convexity = 10, twist = 0, slices = 20, scale = 1.0) drawAluCornerPieceFlat();
		}
		union()
		{
			t = calcScrewFlesh(rAluScrew)/2;
			translate([t,0,t]) rotate([90,0,0]) linear_extrude(height = hAluCornerPiece-2*t, center = true, convexity = 10, twist = 0, slices = 20, scale = 1.0) drawAluCornerPieceFlat();
			if (useHammerNuts) {
				translate([hAluCornerPiece/2,0,0]) rotate([0,0,90]) drawAluHammerNutHole();
				translate([0,0,hAluCornerPiece/2]) rotate([0,90,0]) rotate([0,0,90]) drawAluHammerNutHole();
			} else {
				translate([hAluCornerPiece/2,0,0]) drawAluScrewHole();
				translate([0,0,hAluCornerPiece/2]) rotate([0,90,0]) drawAluScrewHole();
			}
		}
	}
}


module drawTrippleCornerPiece()
{
	color(colorPlastic)
	translate([-wAlu1/2,-wAlu1/2,0]) {
		t = (wAlu1 - hAluCornerPiece)/2 + 2*eps;
		translate([wAlu1/2,0,0]) {
			drawAluCornerPiece();
			translate([0,0.5*hAluCornerPiece+t-2*eps,0]) rotate([90,0,0]) linear_extrude(height = t, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) drawAluCornerPieceFlat();
		}
		translate([0,wAlu1/2,0]) rotate([0,0,90]) {
			drawAluCornerPiece();
			translate([0,-0.5*hAluCornerPiece+2*eps,0]) rotate([90,0,0]) linear_extrude(height = t, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) drawAluCornerPieceFlat();
		}
		translate([wAlu1/2,wAlu1/2,-wAlu1/2]) rotate([-90,0,0]) {
			drawAluCornerPiece();
			translate([0,-0.5*hAluCornerPiece+2*eps,0]) rotate([90,0,0]) linear_extrude(height = t, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) drawAluCornerPieceFlat();
		}
	}
	color(colorPlastic)
	difference() {
		union()
		{
			cylinder(hAluCornerPiece,hAluCornerPiece,0,$fn=4);
		}
		union()
		{
			translate([-smallSize/2,-smallSize,-smallSize/2]) cube([smallSize,smallSize,smallSize]);
			translate([-smallSize,-smallSize/2,-smallSize/2]) cube([smallSize,smallSize,smallSize]);
		}
	}
}


module drawTrippleCornerPiecePrintable()
{
	difference() {
		translate([0,0,0.5*hAluCornerPiece]) rotate([0,-35,0]) rotate([45,0,0]) drawTrippleCornerPiece();
		translate([0,0,-smallSize/2]) cube([smallSize,smallSize,smallSize],true);
	}
}


module drawGregMount()
{
	color(colorPlastic)
	difference() {
		union()
		{
			cube([wGregMount,hGregMount,tGregMount],true);
			translate([0,hGregMount-eps,0]) cube([wGregMountSupport,hGregMountSupport+eps,tGregMount],true);
			translate([0,-hGregMount,0]) cube([wGregMountSupport,hGregMountSupport+eps,tGregMount],true);
		}
		union()
		{
			translate([distExtruderMountHoles/2,0,0]) drawExtruderMountHole();
			translate([-distExtruderMountHoles/2,0,0]) drawExtruderMountHole();
			translate([0,hGregMount/2+hGregMountSupport,tGregMount/2]) rotate([0,90,0]) cylinder(wGregMountSupport+2*eps,hGregMountSupport,hGregMountSupport,$fn=100, true);
		}
	}
}


module drawSpoolholder()
{
	w = wAlu1;
	offsetAluScrew = tSpoolHolderBottom+rAluScrew+calcScrewFlesh(rAluScrew)/2;
	color(colorPlastic)
	difference() {
		union()
		{
			hull()
			{
				translate([-w/2,0,0]) cube([w,tSpoolHolderArm,tSpoolHolderBottom]);
				translate([-offsetSpoolholderHoleX,offsetSpoolholderHoleY,0]) cylinder(tSpoolHolderArm,w/2,w/2,$fn=100);
			}
			hull()
			{
				translate([-w/2,0,0]) cube([w,tSpoolHolderArm,tSpoolHolderBottom]);
				translate([0,tSpoolHolderBottom/2,offsetAluScrew-w/2+rAluScrew+calcScrewFlesh(rAluScrew)]) rotate([90,0,0]) cylinder(tSpoolHolderBottom,w/2,w/2,$fn=100,true);
			}
		}
		union()
		{
			translate([0,0,-bigSize/2]) cube([bigSize,bigSize,bigSize],true);
			translate([-offsetSpoolholderHoleX,offsetSpoolholderHoleY,-bigSize/2]) cylinder(bigSize,rSpoolholderHole,rSpoolholderHole,$fn=100);
			translate([0,0,offsetAluScrew]) rotate([90,0,0]) drawAluScrewHole();
		}
	}
}


module drawCameraMount()
{
	w = wAlu1;
	offsetAluScrew = tCameraMount+rAluScrew+calcScrewFlesh(rAluScrew)/2;
	color(colorPlastic)
	difference() {
		union()
		{
			hull()
			{
				translate([-w/2,0,0]) cube([w,tCameraMount,tCameraMount]);
				translate([offsetCameraMountX,offsetCameraMountY,0]) cylinder(tSpoolHolderArm,w/2,w/2,$fn=100);
			}
			hull()
			{
				translate([-w/2,0,0]) cube([w,tCameraMount,tCameraMount]);
				translate([0,tCameraMount/2,offsetAluScrew-w/2+rAluScrew+calcScrewFlesh(rAluScrew)]) rotate([90,0,0]) cylinder(tCameraMount,w/2,w/2,$fn=100,true);
			}
		}
		union()
		{
			translate([0,0,-bigSize/2]) cube([bigSize,bigSize,bigSize],true);
			translate([offsetCameraMountX,offsetCameraMountY,0]) drawAluScrewHole();
			translate([0,0,offsetAluScrew]) rotate([90,0,0]) drawAluScrewHole();
		}
	}
}


module drawSpoolholderLeft()
{
	mirror([1,0,0]) drawSpoolholder();
}


module drawSpoolholderRight()
{
	drawSpoolholder();
}


module drawHeatedBed()
{
	color(colorHeatedBed)
	difference()
	{
		union()
		{
			translate([0,0,tHeatedBed/2]) cube([wHeatedBedX,wHeatedBedY,tHeatedBed],true);
		}
		union()
		{
			translate([0,0,-eps]) cylinder(tHeatedBed+2*eps,rHeatedBedCenterHole,rHeatedBedCenterHole, $fn=25);
			translate([0,distHeatedBedHolesY/2,-eps]) cylinder(tHeatedBed+2*eps,rHeatedBedHole,rHeatedBedHole, $fn=25);
			translate([distHeatedBedHolesX/2,distHeatedBedHolesY/2,-eps]) cylinder(tHeatedBed+2*eps,rHeatedBedHole,rHeatedBedHole, $fn=25);
			translate([-distHeatedBedHolesX/2,distHeatedBedHolesY/2,-eps]) cylinder(tHeatedBed+2*eps,rHeatedBedHole,rHeatedBedHole, $fn=25);
			translate([-distHeatedBedHolesX/2,-distHeatedBedHolesY/2,-eps]) cylinder(tHeatedBed+2*eps,rHeatedBedHole,rHeatedBedHole, $fn=25);
			translate([distHeatedBedHolesX/2,-distHeatedBedHolesY/2,-eps]) cylinder(tHeatedBed+2*eps,rHeatedBedHole,rHeatedBedHole, $fn=25);
		}
	}
}


module drawProfileFlatCorner()
{
	difference()
	{
		union()
		{
			translate([lAluCorner,lAluCorner]) square([wAluCornerInner+2*tAluCorner1,wAluCornerInner+2*tAluCorner1]);
			rotate([0,0,45]) translate([0,-tAluCorner2/2]) square([sqrt(2)*lAluCorner+tAluCorner2/2+eps,tAluCorner2]);
			translate([0,wAluCorner1-tAluCorner2]) square([lAluCorner+eps,tAluCorner2]);
			translate([wAluCorner1-tAluCorner2,0]) square([tAluCorner2,lAluCorner+eps]);
		}
		union()
		{
			translate([lAluCorner+tAluCorner1,lAluCorner+tAluCorner1]) square([wAluCornerInner,wAluCornerInner]);
		}
	}
}


module drawProfileFlatCenter()
{
	difference()
	{
		union()
		{
			square([wAluCenter,wAluCenter],true);
		}
		union()
		{
			circle(rAlu);
			rotate([0,0,45]) square([lAluCenter,tAluCenter],true);
			rotate([0,0,-45]) square([lAluCenter,tAluCenter],true);
		}
	}
}


module drawProfileFlat()
{
	drawProfileFlatCenter();
	translate([wAlu2/2,wAlu2/2]) drawProfileFlatCorner();
	rotate([0,0,90]) translate([wAlu2/2,wAlu2/2]) drawProfileFlatCorner();
	rotate([0,0,180]) translate([wAlu2/2,wAlu2/2]) drawProfileFlatCorner();
	rotate([0,0,270]) translate([wAlu2/2,wAlu2/2]) drawProfileFlatCorner();
}



module drawProfile(prmLength)
{
	color(colorAlu)
	linear_extrude(height = prmLength, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0) drawProfileFlat();
}


module drawEnclosingPanel(prmWidth,prmHeight,prmThickness=tEnclosingPanel)
{
	color(colorEnclosingPanel, 0.5)
	difference()
	{
		union()
		{
			cube([prmWidth,prmHeight,prmThickness]);
		}
		union()
		{
			nrOfScrewsX = 1 + ceil((prmWidth - 2*cornerScrewDistanceEnclosingPanel) / maxScrewDistanceEnclosingPanel);
			screwDistanceX = (prmWidth - 2*cornerScrewDistanceEnclosingPanel)/(nrOfScrewsX - 1);
			for (x = [1 : nrOfScrewsX]) {
				translate([cornerScrewDistanceEnclosingPanel+(x-1)*screwDistanceX,wAlu1/2,0]) drawAluScrewHole();
				translate([cornerScrewDistanceEnclosingPanel+(x-1)*screwDistanceX,prmHeight-wAlu1/2,0]) drawAluScrewHole();
			}

			nrOfScrewsY = 1 + ceil((prmHeight - 2*cornerScrewDistanceEnclosingPanel) / maxScrewDistanceEnclosingPanel);
			screwDistanceY = (prmHeight - 2*cornerScrewDistanceEnclosingPanel)/(nrOfScrewsY - 1);
			for (y = [1 : nrOfScrewsY]) {
				translate([wAlu1/2, cornerScrewDistanceEnclosingPanel+(y-1)*screwDistanceY,0]) drawAluScrewHole();
				translate([prmWidth-wAlu1/2, cornerScrewDistanceEnclosingPanel+(y-1)*screwDistanceY,0]) drawAluScrewHole();
			}
		}
	}
}


module drawSidePanel()
{
	drawEnclosingPanel(sidePanelWidth,sidePanelHeight);
}


module drawBackPanel()
{
	drawEnclosingPanel(backPanelWidth,backPanelHeight);
}


module drawBottomPanel()
{
	color(colorBottomPanel)
	difference() {
		union()
		{
			cube([bottomPanelWidth,bottomPanelHeight,tBottomEnclosingPanel]);
		}
		union()
		{
			w = bottomPanelWidth - 2*wAlu1-2*clearanceBottomPanel;
			h = bottomPanelHeight - 2*wAlu1-2*clearanceBottomPanel;
			nrOfScrewsX = 1 + ceil((w - 2*cornerScrewDistanceEnclosingPanel) / maxScrewDistanceEnclosingPanel);
			screwDistanceX = (w - 2*cornerScrewDistanceEnclosingPanel)/(nrOfScrewsX - 1);
			for (x = [1 : nrOfScrewsX]) {
				translate([wAlu1+clearanceBottomPanel+cornerScrewDistanceEnclosingPanel+(x-1)*screwDistanceX,wAlu1/2,0]) drawAluScrewHole();
				translate([wAlu1+clearanceBottomPanel+cornerScrewDistanceEnclosingPanel+(x-1)*screwDistanceX,bottomPanelHeight-wAlu1/2,0]) drawAluScrewHole();
			}

			nrOfScrewsY = 1 + ceil((h - 2*cornerScrewDistanceEnclosingPanel) / maxScrewDistanceEnclosingPanel);
			screwDistanceY = (h - 2*cornerScrewDistanceEnclosingPanel)/(nrOfScrewsY - 1);
			for (y = [1 : nrOfScrewsY]) {
				translate([wAlu1/2, wAlu1+clearanceBottomPanel+cornerScrewDistanceEnclosingPanel+(y-1)*screwDistanceY,0]) drawAluScrewHole();
				translate([bottomPanelWidth-wAlu1/2, wAlu1+clearanceBottomPanel+cornerScrewDistanceEnclosingPanel+(y-1)*screwDistanceY,0]) drawAluScrewHole();
			}

			wa = wAlu1+clearanceBottomPanel+eps;
			translate([-eps,-eps,-smallSize/2]) cube([wa,wa,smallSize]);
			translate([bottomPanelWidth-wAlu1-clearanceBottomPanel,-eps,-smallSize/2]) cube([wa,wa,smallSize]);
			translate([-eps,bottomPanelHeight-wAlu1-clearanceBottomPanel,-smallSize/2]) cube([wa,wa,smallSize]);
			translate([bottomPanelWidth-wAlu1-clearanceBottomPanel,bottomPanelHeight-wAlu1-clearanceBottomPanel,-smallSize/2]) cube([wa,wa,smallSize]);

			scaleNema = (2*clearanceBottomPanel+getW1Nema(motorZ))/getW1Nema(motorZ);
			translate([bottomPanelWidth/2,bottomPanelHeight-distanceLeadScrewToAluProfile-wAlu1,-eps]) scale(scaleNema) drawNema(motorZ);
		}
	}
}


module drawTopPanel()
{
	difference() {
		union()
		{
			drawEnclosingPanel(topPanelWidth,topPanelHeight,tTopEnclosingPanel);
		}
		union()
		{
			distCenterHeatedBedToAluProfile = distHeatedBedHolesY/2 + distanceLeadScrewToBedHole + distanceLeadScrewToAluProfile;
			offsetY = -distCenterHeatedBedToAluProfile+extrusionLengthY+wAlu1;
			translate([topPanelWidth/2,offsetY,0]) {
				cylinder(smallSize,rTopDome,rTopDome,true);
				w = 2*rScrew + calcScrewFlesh(rScrew);
				rHoles = rTopDome+0.75*w;
				for (i = [1 : 4]) {
					rotate([0,0,(i-1)*90]) translate([0,rHoles,0]) drawScrewHole();
				}
			}
		}
	}
}


module drawFrontPanel()
{
	color(colorEnclosingPanel, 0.5)
	difference() {
		union()
		{
			cube([frontPanelWidth,frontPanelHeight,tFrontEnclosingPanel]);
		}
		union()
		{
			translate([frontPanelWidth-distanceDoorKnob,frontPanelHeight/2,0]) drawScrewHole();
			holeDistance = 2*rAluScrew + calcScrewFlesh(rAluScrew);
			for (i = [1 : nrOfHinges]) {
				translate([distHingeHolesToRotationAxis,(i-1)*distanceHinges+endDistanceHinge+holeDistance/2,tFrontEnclosingPanel]) drawAluScrewHole();
				translate([distHingeHolesToRotationAxis,(i-1)*distanceHinges+endDistanceHinge-holeDistance/2,tFrontEnclosingPanel]) drawAluScrewHole();
			} 
		}
	}
}


module drawTopDomeFlat(prmIsSolid = false)
{
	ts = tTopDome*sqrt(2);
	x1 = rTopDome+ts;
	y1 = 0;
	x2 = rTopDome;
	y2 = 0;
	x3 = rTopDomeFilamentEntry;
	y3 = rTopDome-rTopDomeFilamentEntry;
	x4 = rTopDomeFilamentEntry;
	y4 = rTopDome-rTopDomeFilamentEntry+ts;
	if (prmIsSolid) {
		polygon([[x1,y1],[x4,y1],[x4,y4],[x1,y1]]);
	} else {
		polygon([[x1,y1],[x2,y2],[x3,y3],[x4,y4],[x1,y1]]);
	}
}


module drawTopDomeMount()
{
	w = 2*rScrew + calcScrewFlesh(rScrew);
	l = 3*w;
	rHoles = rTopDome+0.75*w;
	difference() {
		union()
		{
			translate([-w/2,rHoles-l,0]) cube([w,l,tTopDomeMount]);
			translate([0,rHoles,0]) cylinder(tTopDomeMount,w/2,w/2);
		}
		union()
		{
			translate([0,rHoles,0]) drawScrewHole();
			translate([0,0,-eps]) rotate_extrude(angle = 360, convexity = 2) drawTopDomeFlat(true);
		}
	}
}


module drawTopDome()
{
	color(colorTopDome, 0.5) {	
		rotate_extrude(angle = 360, convexity = 2) drawTopDomeFlat();
		for (i = [1 : 4]) {
			rotate([0,0,(i-1)*90]) drawTopDomeMount();
		}
	}
}


module drawHinge(prmIsFixedPart)
{
	offset = rAluScrew+calcScrewFlesh(rAluScrew)/2;
	color(colorPlastic)
	translate([-offset,-lHinge/2,0]) difference() {
		union()
		{
			cube([wHinge,lHinge/2,tHinge]);
			translate([0,lHinge/2-eps,0]) cube([wHinge-rHingeOuter-clearanceHinge,lHinge/2+eps,tHinge]);
			translate([wHinge,lHinge/4,rHingeOuter]) rotate([90,0,0]) cylinder(lHinge/2,rHingeOuter,rHingeOuter,true,$fn=100);
			if (prmIsFixedPart) {
				translate([0,0,-tFrontEnclosingPanel+eps]) cube([wHinge-clearanceHinge,lHinge/2,tFrontEnclosingPanel+eps]);
				translate([0,lHinge/2-eps,-tFrontEnclosingPanel+eps]) cube([wHinge-rHingeOuter-clearanceHinge,lHinge/2+eps,tFrontEnclosingPanel+eps]);
				translate([wHinge,3*lHinge/4-eps,rHingeOuter]) rotate([90,0,0]) cylinder(lHinge/2+eps,rHingeInner,rHingeInner,true,$fn=50);
			}
		}
		union()
		{
			translate([offset,offset,0]) drawAluScrewHole();
			translate([offset,lHinge-offset,0]) drawAluScrewHole();
			if (!prmIsFixedPart) {
				translate([wHinge,lHinge/4,rHingeOuter]) rotate([90,0,0]) cylinder(smallSize,rHingeInner+clearanceHinge,rHingeInner+clearanceHinge,true,$fn=50);
			}
		}
	}
}


module drawDoorKnob()
{
	color(colorPlastic)
	difference() {
		union()
		{
			offset = hDoorKnob + sqrt(rSphereDoorKnob*rSphereDoorKnob-rDoorKnob*rDoorKnob);
			translate([0,0,offset]) sphere(rSphereDoorKnob);
			cylinder(hDoorKnob+eps,rDoorKnob,rDoorKnob,$fn=100);
		}
		union()
		{
			translate([0,0,-eps]) cylinder(hDoorKnob+rSphereDoorKnob+eps,rScrew,rScrew,$fn=100);
			depth = wNut/2 + rDoorKnob + eps;
			translate([-wNut/2-clearanceNut,-wNut/2,offsetDoorKnobNut+clearanceNut]) cube([wNut+2*clearanceNut,depth,tNut]);
		}
	}
}


module drawCornerPieces()
{
		translate([wAlu1/2,0,0]) drawAluCornerPiece();
		translate([extrusionLengthX+wAlu1/2,0,0]) rotate([0,0,180]) drawAluCornerPiece();		
		translate([wAlu1/2,extrusionLengthY+wAlu1,0]) drawAluCornerPiece();
		translate([extrusionLengthX+wAlu1/2,extrusionLengthY+wAlu1,0]) rotate([0,0,180]) drawAluCornerPiece();		

		translate([0,wAlu1/2,0]) rotate([0,0,90]) drawAluCornerPiece();
		translate([0,wAlu1/2+extrusionLengthY,0]) rotate([0,0,-90]) drawAluCornerPiece();
		translate([extrusionLengthX+wAlu1,wAlu1/2,0]) rotate([0,0,90]) drawAluCornerPiece();
		translate([extrusionLengthX+wAlu1,wAlu1/2+extrusionLengthY,0]) rotate([0,0,-90]) drawAluCornerPiece();

		translate([wAlu1/2,wAlu1/2,-wAlu1/2]) rotate([-90,0,0]) drawAluCornerPiece();
		translate([extrusionLengthX+wAlu1/2,wAlu1/2,-wAlu1/2]) rotate([0,0,90]) rotate([-90,0,0]) drawAluCornerPiece();
		translate([wAlu1/2,wAlu1/2+extrusionLengthY,-wAlu1/2]) rotate([90,0,0]) drawAluCornerPiece();
		translate([extrusionLengthX+wAlu1/2,wAlu1/2+extrusionLengthY,-wAlu1/2]) rotate([0,0,-90]) rotate([90,0,0]) drawAluCornerPiece();
}


module drawHingeAssembly(prmAngle=0)
{
	drawHinge(true);
	translate([distHingeHolesToRotationAxis,0,rHingeOuter]) rotate([0,prmAngle,0]) translate([distHingeHolesToRotationAxis,0,-rHingeOuter]) rotate([0,0,180]) drawHinge(false);
}


module drawFrontPanelAssembly(prmAngle=0)
{
	translate([0,0,rHingeOuter+tFrontEnclosingPanel]) rotate([0,prmAngle,0]) translate([0,0,-rHingeOuter-tFrontEnclosingPanel]){
		drawFrontPanel();
		translate([frontPanelWidth-distanceDoorKnob,frontPanelHeight/2,tFrontEnclosingPanel]) drawDoorKnob();
	}

	for (i = [1 : nrOfHinges]) {
		translate([wAlu1/2-reductionFrontPanelHinge,(i-1)*distanceHinges+endDistanceHinge,tFrontEnclosingPanel]) drawHingeAssembly(prmAngle);
	} 
}


module drawFrameAssembly(prmEnclosed)
{
	// x cariage position for testing
	xCarriagePos = 0;
//		xCarriagePos = -wHeatedBedX/2;
//		xCarriagePos = wHeatedBedX/2;

	// y cariage position for testing
	yCarriagePosMid = hXCarriage + dExtruder/2;
//	yCarriagePos = yCarriagePosMid;
//		yCarriagePos = yCarriagePosMid - wHeatedBedY/2;
		yCarriagePos = yCarriagePosMid + wHeatedBedY/2;


	distCenterHeatedBedToAluProfile = distHeatedBedHolesY/2 + distanceLeadScrewToBedHole + distanceLeadScrewToAluProfile; 
	zOffsetYRodMount = extrusionLengthZ-wAlu1-distanceYRodToTopAluProfile;
	translate([-extrusionLengthX/2-wAlu1/2,distCenterHeatedBedToAluProfile-extrusionLengthY-wAlu1/2,0])
	{
		// z extrusions
		drawProfile(extrusionLengthZ);
		translate([extrusionLengthX+wAlu1,0,0]) drawProfile(extrusionLengthZ);
		translate([extrusionLengthX+wAlu1,extrusionLengthY+wAlu1,0]) drawProfile(extrusionLengthZ);
		translate([0,extrusionLengthY+wAlu1,0]) drawProfile(extrusionLengthZ);

		// x extrusions
		translate([wAlu1/2,0,-wAlu1/2+distanceFloorToTopAluProfile]) rotate([0,90,0]) drawProfile(extrusionLengthX);
		translate([wAlu1/2,0,extrusionLengthZ-wAlu1/2]) rotate([0,90,0]) drawProfile(extrusionLengthX);
		translate([wAlu1/2,extrusionLengthY+wAlu1,-wAlu1/2+distanceFloorToTopAluProfile]) rotate([0,90,0]) drawProfile(extrusionLengthX);
		translate([wAlu1/2,extrusionLengthY+wAlu1,extrusionLengthZ-wAlu1/2]) rotate([0,90,0]) drawProfile(extrusionLengthX);

		// y extrusions
		translate([0,wAlu1/2,-wAlu1/2+distanceFloorToTopAluProfile]) rotate([-90,0,0]) drawProfile(extrusionLengthY);
		translate([0,wAlu1/2,extrusionLengthZ-wAlu1/2]) rotate([-90,0,0]) drawProfile(extrusionLengthY);
		translate([extrusionLengthX+wAlu1,wAlu1/2,-wAlu1/2+distanceFloorToTopAluProfile]) rotate([-90,0,0]) drawProfile(extrusionLengthY);
		translate([extrusionLengthX+wAlu1,wAlu1/2,extrusionLengthZ-wAlu1/2]) rotate([-90,0,0]) drawProfile(extrusionLengthY);

		// corner pieces bottom
		translate([0,0,distanceFloorToTopAluProfile]) drawCornerPieces();

		// corner pieces top
		translate([0,0,extrusionLengthZ-wAlu1]) mirror([0,0,1]) drawCornerPieces();

		// Y rod mounts
		translate([0,wAlu1/2,zOffsetYRodMount]) rotate([-90,0,0]) drawYRodMount();
		translate([extrusionLengthX+wAlu1,wAlu1/2,zOffsetYRodMount]) rotate([0,180,0]) rotate([-90,0,0]) drawYRodMount();
		translate([0,extrusionLengthY+wAlu1/2,zOffsetYRodMount]) rotate([90,0,0]) drawYRodMount();
		translate([extrusionLengthX+wAlu1,extrusionLengthY+wAlu1/2,zOffsetYRodMount]) rotate([0,180,0]) rotate([90,0,0]) drawYRodMount();

		// y rods
		translate([distYRodToMidSideAluProfile,extrusionLengthY+wAlu1/2+clearanceYRod,zOffsetYRodMount]) rotate([90,0,0]) drawRod(BearingY,YRodLength);
		translate([extrusionLengthX+wAlu1-distYRodToMidSideAluProfile,extrusionLengthY+wAlu1/2+clearanceYRod,zOffsetYRodMount]) rotate([90,0,0]) drawRod(BearingY,YRodLength);

		// y carriages
		yCarriagePos2 = yCarriagePos - (distCenterHeatedBedToAluProfile-extrusionLengthY-wAlu1/2);
		translate([distYRodToMidSideAluProfile,yCarriagePos2,zOffsetYRodMount]) rotate([180,0,0]) rotate([0,90,0]) drawYCarriageAssembly();
		translate([extrusionLengthX+wAlu1-distYRodToMidSideAluProfile,yCarriagePos2,zOffsetYRodMount]) rotate([0,-90,0]) drawYCarriageAssembly();

		// XY idlers
		translate([wAlu1/2,extrusionLengthY+wAlu1,zOffsetYRodMount]) rotate([-90,0,0]) rotate([0,90,0]) drawXYIdler();
		translate([extrusionLengthX+wAlu1/2,extrusionLengthY+wAlu1,zOffsetYRodMount]) rotate([90,0,0]) rotate([0,-90,0]) drawXYIdler();

		// x rods
		xPos = (XRodLength - extrusionLengthX-wAlu1)/2;
		translate([-xPos,yCarriagePos2,zOffsetYRodMount+distBetweenXRods/2]) rotate([0,90,0]) drawRod(BearingX,XRodLength);
		translate([-xPos,yCarriagePos2,zOffsetYRodMount-distBetweenXRods/2]) rotate([0,90,0]) drawRod(BearingX,XRodLength);

		// XY motor left
		translate([wAlu1/2,wAlu1/2,zOffsetYRodMount-distYRodToTopMotorLeft]) rotate([0,0,90]) {
			drawXYMotorMountLeft();
			translate([wXYMotorMount1-getW1Nema(motorXY)/2,-lXYMotorMount+getW1Nema(motorXY)/2,-getHNema(motorXY)+2*eps]) drawNema(motorXY);
			translate([wXYMotorMount1-getW1Nema(motorXY)/2,-lXYMotorMount+getW1Nema(motorXY)/2,getHCylinderNema(motorXY)+getHAxleNema(motorXY)-hPulley4]) drawGT2Pulley();
		}

		// XY motor right
		translate([wAlu1/2+extrusionLengthX,wAlu1/2,zOffsetYRodMount-distYRodToTopMotorRight]) rotate([0,0,90]) {
			drawXYMotorMountRight();
			translate([wXYMotorMount1-getW1Nema(motorXY)/2,lXYMotorMount-getW1Nema(motorXY)/2,-getHNema(motorXY)+2*eps]) drawNema(motorXY);
			translate([wXYMotorMount1-getW1Nema(motorXY)/2,lXYMotorMount-getW1Nema(motorXY)/2,getHCylinderNema(motorXY)+getHAxleNema(motorXY)-hPulley4]) drawGT2Pulley();
		}

		// enclosing panels
		if (prmEnclosed) {
			translate([-wAlu1/2-tEnclosingPanel,-wAlu1/2, distanceFloorToTopAluProfile-wAlu1]) rotate([90,0,0]) rotate([0,90,0]) drawSidePanel();
			translate([extrusionLengthX+1.5*wAlu1,-wAlu1/2, distanceFloorToTopAluProfile-wAlu1]) rotate([90,0,0]) rotate([0,90,0]) drawSidePanel();
			translate([-wAlu1/2,extrusionLengthY+1.5*wAlu1+tEnclosingPanel,distanceFloorToTopAluProfile-wAlu1]) rotate([90,0,0]) drawBackPanel();
			translate([-wAlu1/2,-wAlu1/2,distanceFloorToTopAluProfile-wAlu1-tBottomEnclosingPanel]) drawBottomPanel();
			translate([-wAlu1/2,-wAlu1/2,extrusionLengthZ]) drawTopPanel();
			translate([extrusionLengthX/2+wAlu1/2,-distCenterHeatedBedToAluProfile+extrusionLengthY+wAlu1/2,extrusionLengthZ+tTopEnclosingPanel]) drawTopDome();
			translate([-wAlu1/2+reductionFrontPanelHinge,-wAlu1/2,distanceFloorToTopAluProfile-wAlu1]) rotate([90,0,0]) drawFrontPanelAssembly(-30);
		}
	}

	// x carriage
	translate([xCarriagePos,yCarriagePos,zOffsetYRodMount]) {
		rotate([0,0,-90]) rotate([0,90,0]) drawXCarriageAssembly();
		zOffsetExtruder = hHotEnd + hTipHotEnd - overhangExtruderBeneathXCarriage;
		translate([0,-dExtruder/2-hXCarriage,zOffsetExtruder-wXCarriage/2]) drawExtruder();
	}
}

module drawXYAssemblyLeft(yCarriagePos = hXCarriage + dExtruder/2 + extrusionLengthY/2)
{
	distCenterHeatedBedToAluProfile = distHeatedBedHolesY/2 + distanceLeadScrewToBedHole + distanceLeadScrewToAluProfile; 
	zOffsetYRodMount = extrusionLengthZ-wAlu1-distanceYRodToTopAluProfile;
		// Y rod mount
   translate([0,wAlu1/2,zOffsetYRodMount]) rotate([-90,0,0]) drawYRodMount();
   translate([0,extrusionLengthY+wAlu1/2,zOffsetYRodMount]) rotate([90,0,0]) drawYRodMount();

   // y rod
   translate([distYRodToMidSideAluProfile,extrusionLengthY+wAlu1/2+clearanceYRod,zOffsetYRodMount]) rotate([90,0,0]) drawRod(BearingY,YRodLength);
   
   // y carriage
   translate([distYRodToMidSideAluProfile,yCarriagePos,zOffsetYRodMount]) rotate([180,0,0]) rotate([0,90,0]) drawYCarriageAssembly();

   // XY idlers
   translate([wAlu1/2,extrusionLengthY+wAlu1,zOffsetYRodMount]) rotate([-90,0,0]) rotate([0,90,0]) drawXYIdler();

   // XY motor left
   translate([wAlu1/2,wAlu1/2,zOffsetYRodMount-distYRodToTopMotorLeft]) rotate([0,0,90]) {
      drawXYMotorMountLeft();
			translate([wXYMotorMount1-getW1Nema(motorXY)/2,-lXYMotorMount+getW1Nema(motorXY)/2,-getHNema(motorXY)+2*eps]) drawNema(motorXY);
			translate([wXYMotorMount1-getW1Nema(motorXY)/2,-lXYMotorMount+getW1Nema(motorXY)/2,getHCylinderNema(motorXY)+getHAxleNema(motorXY)-hPulley4]) drawGT2Pulley();
   }
}

module drawXYAssemblyRight(yCarriagePos = hXCarriage + dExtruder/2 + extrusionLengthY/2)
{

	distCenterHeatedBedToAluProfile = distHeatedBedHolesY/2 + distanceLeadScrewToBedHole + distanceLeadScrewToAluProfile; 
	zOffsetYRodMount = extrusionLengthZ-wAlu1-distanceYRodToTopAluProfile;
   // Y rod mount
   translate([extrusionLengthX+wAlu1,wAlu1/2,zOffsetYRodMount]) rotate([0,180,0]) rotate([-90,0,0]) drawYRodMount();
   translate([extrusionLengthX+wAlu1,extrusionLengthY+wAlu1/2,zOffsetYRodMount]) rotate([0,180,0]) rotate([90,0,0]) drawYRodMount();

   // y rod
   translate([extrusionLengthX+wAlu1-distYRodToMidSideAluProfile,extrusionLengthY+wAlu1/2+clearanceYRod,zOffsetYRodMount]) rotate([90,0,0]) drawRod(BearingY,YRodLength);

   // y carriage
   translate([extrusionLengthX+wAlu1-distYRodToMidSideAluProfile,yCarriagePos,zOffsetYRodMount]) rotate([0,-90,0]) drawYCarriageAssembly();

   // XY idler
   translate([extrusionLengthX+wAlu1/2,extrusionLengthY+wAlu1,zOffsetYRodMount]) rotate([90,0,0]) rotate([0,-90,0]) drawXYIdler();

   // XY motor right
   translate([wAlu1/2+extrusionLengthX,wAlu1/2,zOffsetYRodMount-distYRodToTopMotorRight]) rotate([0,0,90]) {
      drawXYMotorMountRight();
   }
}
module drawXYAssembly()
{
	// x cariage position for testing
	xCarriagePos = 0;
//		xCarriagePos = -wHeatedBedX/2;
//		xCarriagePos = wHeatedBedX/2;

	// y cariage position for testing
	yCarriagePosMid = hXCarriage + dExtruder/2;
//	yCarriagePos = yCarriagePosMid;
//		yCarriagePos = yCarriagePosMid - wHeatedBedY/2;
		yCarriagePos = yCarriagePosMid + wHeatedBedY/2;


	distCenterHeatedBedToAluProfile = distHeatedBedHolesY/2 + distanceLeadScrewToBedHole + distanceLeadScrewToAluProfile; 
	zOffsetYRodMount = extrusionLengthZ-wAlu1-distanceYRodToTopAluProfile;
	translate([-extrusionLengthX/2-wAlu1/2,distCenterHeatedBedToAluProfile-extrusionLengthY-wAlu1/2,0])
	{
		yCarriagePos2 = yCarriagePos - (distCenterHeatedBedToAluProfile-extrusionLengthY-wAlu1/2);
      
      drawXYAssemblyLeft(yCarriagePos2);
      drawXYAssemblyRight(yCarriagePos2);

		// x rods
		xPos = (XRodLength - extrusionLengthX-wAlu1)/2;
		translate([-xPos,yCarriagePos2,zOffsetYRodMount+distBetweenXRods/2]) rotate([0,90,0]) drawRod(BearingX,XRodLength);
		translate([-xPos,yCarriagePos2,zOffsetYRodMount-distBetweenXRods/2]) rotate([0,90,0]) drawRod(BearingX,XRodLength);
	}

	// x carriage
	translate([xCarriagePos,yCarriagePos,zOffsetYRodMount]) {
		rotate([0,0,-90]) rotate([0,90,0]) drawXCarriageAssembly();
		zOffsetExtruder = hHotEnd + hTipHotEnd - overhangExtruderBeneathXCarriage;
	}
}

module drawXYMaxAssemblyLeft(yCarriagePos = hXCarriage + dExtruder/2+extrusionLengthY/2)
{
	distCenterHeatedBedToAluProfile = distHeatedBedHolesY/2 + distanceLeadScrewToBedHole + distanceLeadScrewToAluProfile; 
	zOffsetYRodMount = extrusionLengthZ-wAlu1-distanceYRodToTopAluProfile;
	zOffsetYRodMountT = extrusionLengthZ-wAlu1-distanceYRodToTopAluProfile+distBetweenYMaxRods/2;
	zOffsetYRodMountB = extrusionLengthZ-wAlu1-distanceYRodToTopAluProfile-distBetweenYMaxRods/2;
		// Y rod mount
   translate([0,wAlu1/2,zOffsetYRodMount]) rotate([-90,0,0]) drawYMaxRodMount();
   translate([0,extrusionLengthY+wAlu1/2,zOffsetYRodMount]) rotate([90,0,0]) drawYMaxRodMount();
//   translate([0,wAlu1/2,zOffsetYRodMountB]) rotate([-90,0,0]) drawYRodMount();
 //  translate([0,extrusionLengthY+wAlu1/2,zOffsetYRodMountB]) rotate([90,0,0]) drawYRodMount();

   // y rod
   translate([distYRodToMidSideAluProfile,extrusionLengthY+wAlu1/2+clearanceYRod,zOffsetYRodMount]) rotate([90,0,0]) drawRod(BearingY,YRodLength);
  // translate([distYRodToMidSideAluProfile,extrusionLengthY+wAlu1/2+clearanceYRod,zOffsetYRodMountB]) rotate([90,0,0]) drawRod(BearingY,YRodLength);
   
   // y carriage
   translate([distYRodToMidSideAluProfile,yCarriagePos,zOffsetYRodMount]) rotate([180,0,0]) rotate([0,90,0]) drawYMaxCarriageAssembly();

   // XY idlers
   translate([wAlu1/2,extrusionLengthY+wAlu1,zOffsetYRodMount]) rotate([-90,0,0]) rotate([0,90,0]) drawXYIdler();

   // XY motor left
   translate([wAlu1/2,wAlu1/2,zOffsetYRodMount-distYRodToTopMotorLeft]) rotate([0,0,90]) {
      drawXYMaxMotorMountLeft();
			translate([wXYMotorMount1-getW1Nema(motorXY)/2,-lXYMotorMount+getW1Nema(motorXY)/2,-getHNema(motorXY)+2*eps]) drawNema(motorXY);
			translate([wXYMotorMount1-getW1Nema(motorXY)/2,-lXYMotorMount+getW1Nema(motorXY)/2,getHCylinderNema(motorXY)+getHAxleNema(motorXY)-hPulley4]) drawGT2Pulley();
   }
}
module drawXYMaxAssembly()
{
	// x cariage position for testing
	xCarriagePos = 0;
//		xCarriagePos = -wHeatedBedX/2;
//		xCarriagePos = wHeatedBedX/2;

	// y cariage position for testing
	yCarriagePosMid = hXCarriage + dExtruder/2;
//	yCarriagePos = yCarriagePosMid;
//		yCarriagePos = yCarriagePosMid - wHeatedBedY/2;
		yCarriagePos = yCarriagePosMid + wHeatedBedY/2;


	distCenterHeatedBedToAluProfile = distHeatedBedHolesY/2 + distanceLeadScrewToBedHole + distanceLeadScrewToAluProfile; 
	zOffsetYRodMount = extrusionLengthZ-wAlu1-distanceYRodToTopAluProfile;
	translate([-extrusionLengthX/2-wAlu1/2,distCenterHeatedBedToAluProfile-extrusionLengthY-wAlu1/2,0])
	{
		yCarriagePos2 = yCarriagePos - (distCenterHeatedBedToAluProfile-extrusionLengthY-wAlu1/2);
      
      drawXYMaxAssemblyLeft(yCarriagePos2);
   //   drawXYMaxAssemblyRight(yCarriagePos2);

		// x rods
		xPos = (XRodLength - extrusionLengthX-wAlu1)/2;
		translate([-xPos,yCarriagePos2,zOffsetYRodMount+distBetweenXRods/2]) rotate([0,90,0]) drawRod(BearingX,XRodLength);
		translate([-xPos,yCarriagePos2,zOffsetYRodMount-distBetweenXRods/2]) rotate([0,90,0]) drawRod(BearingX,XRodLength);
	}

	// x carriage
	translate([xCarriagePos,yCarriagePos,zOffsetYRodMount]) {
		rotate([0,0,-90]) rotate([0,90,0]) drawXCarriageAssembly();
		zOffsetExtruder = hHotEnd + hTipHotEnd - overhangExtruderBeneathXCarriage;
	}
}

module drawZCarriageAssembly()
{
	drawZCarriage();
	translate([0,lZCarriage/4,hZCarriage]) {
		rotate([90,0,0]) drawBearing(BearingZ);
		drawZCarriageClamp();
	}
	translate([0,-lZCarriage/4,hZCarriage]) {
		rotate([90,0,0]) drawBearing(BearingZ);
		drawZCarriageClamp();
	}
}


module drawYCarriageAssembly()
{
	drawYCarriage();
	translate([0,lYCarriage/4,0]) {
		rotate([90,0,0]) drawBearing(BearingY);
		rotate([0,180,0]) drawYCarriageClamp();
	}

	translate([0,-lYCarriage/4,0]) {
		rotate([90,0,0]) drawBearing(BearingY);
		rotate([0,180,0]) drawYCarriageClamp();
	}
}

module drawYMaxCarriageAssembly()
{
	drawYMaxCarriage();
	translate([0,lYCarriage/4,0]) {
		rotate([90,0,0]) drawBearing(BearingY);
		rotate([0,180,0]) drawYCarriageClamp();
	}

	translate([0,-lYCarriage/4,0]) {
		rotate([90,0,0]) drawBearing(BearingY);
		rotate([0,180,0]) drawYCarriageClamp();
	}
/*	translate([-distBetweenYMaxRods/2,lYCarriage/4,0]) {
		rotate([90,0,0]) drawBearing(BearingY);
		rotate([0,180,0]) drawYCarriageClamp();
	}

	translate([-distBetweenYMaxRods/2,-lYCarriage/4,0]) {
		rotate([90,0,0]) drawBearing(BearingY);
		rotate([0,180,0]) drawYCarriageClamp();
	}*/
   
   
}


module drawXCarriageAssembly()
{
	drawXCarriage();

	translate([0,lXCarriage/2-rScrew-calcScrewFlesh(rScrew)/2,-tXCarriageSmall]) drawXCarriageBeltClamp();
	translate([0,-lXCarriage/2+rScrew+calcScrewFlesh(rScrew)/2,-tXCarriageSmall]) drawXCarriageBeltClamp();

	translate([-distBetweenXRods/2,lXCarriage/4,0]) {
		rotate([90,0,0]) drawBearing(BearingX);
		rotate([0,180,0]) drawXCarriageClamp(true);
	}

	translate([-distBetweenXRods/2,-lXCarriage/4,0]) {
		rotate([90,0,0]) drawBearing(BearingX);
		rotate([0,180,0]) drawXCarriageClamp(false);
	}

	translate([distBetweenXRods/2,0,0]) {
		rotate([90,0,0]) drawBearing(BearingX);
		rotate([0,180,0]) drawXCarriageClamp(false);
	}
}


module drawBedAssembly()
{
	offsetLeadScrewAxisY = distanceLeadScrewToBedHole + distHeatedBedHolesY/2;
	translate([0,0,distHeatedBedtoBedClamp+wAlu1]) drawHeatedBed();
	translate([distHeatedBedHolesX/2,-distHeatedBedHolesY/2,wAlu1-tBedClamp]) rotate([0,0,90]) drawBedClamp();
	translate([-distHeatedBedHolesX/2,-distHeatedBedHolesY/2,wAlu1-tBedClamp]) rotate([0,0,-90]) drawBedClamp();
	translate([distHeatedBedHolesX/2,distHeatedBedHolesY/2,wAlu1-tBedClamp]) mirror([0,1,0]) rotate([0,0,90]) drawBedClamp();
	translate([-distHeatedBedHolesX/2,distHeatedBedHolesY/2,wAlu1-tBedClamp]) mirror([0,1,0]) rotate([0,0,-90]) drawBedClamp();

	// x extrusions
	offsetProfileY = distHeatedBedHolesY/2-wAlu1/2+wBedClamp/2;
	translate([-extrusionLengthBedX/2,offsetLeadScrewAxisY-rLeadScrewNut1-tLeadScrewNutMount-wAlu1/2,wAlu1/2]) rotate([0,90,0]) drawProfile(extrusionLengthBedX);
	translate([-extrusionLengthBedX/2,-offsetProfileY,wAlu1/2]) rotate([0,90,0]) drawProfile(extrusionLengthBedX);

	// y extrusions
	offsetProfileX = distHeatedBedHolesX/2-offsetBedClampHole-tBedClamp-wAlu1/2;
	translate([offsetProfileX,-distHeatedBedHolesY/2-wBedClamp/2,wAlu1/2]) rotate([-90,0,0]) drawProfile(extrusionLengthBedY);
	translate([-offsetProfileX,-distHeatedBedHolesY/2-wBedClamp/2,wAlu1/2]) rotate([-90,0,0]) drawProfile(extrusionLengthBedY);

	// corner pieces
	translate([-extrusionLengthBedX/2,-offsetProfileY+wAlu1/2,wAlu1/2]) rotate([-90,0,0]) drawAluCornerPiece();
	mirror([1,0,0]) translate([-extrusionLengthBedX/2,-offsetProfileY+wAlu1/2,wAlu1/2]) rotate([-90,0,0]) drawAluCornerPiece();
	translate([-extrusionLengthBedX/2,offsetLeadScrewAxisY-rLeadScrewNut1-tLeadScrewNutMount,wAlu1/2]) rotate([-90,0,0]) drawAluCornerPiece();
	mirror([1,0,0]) translate([-extrusionLengthBedX/2,offsetLeadScrewAxisY-rLeadScrewNut1-tLeadScrewNutMount,wAlu1/2]) rotate([-90,0,0]) drawAluCornerPiece();
	translate([-extrusionLengthBedX/2,offsetLeadScrewAxisY-rLeadScrewNut1-tLeadScrewNutMount-wAlu1,wAlu1/2]) rotate([90,0,0]) drawAluCornerPiece();
	mirror([1,0,0]) translate([-extrusionLengthBedX/2,offsetLeadScrewAxisY-rLeadScrewNut1-tLeadScrewNutMount-wAlu1,wAlu1/2]) rotate([90,0,0]) drawAluCornerPiece();

	// lead screw + mount
	translate([0,offsetLeadScrewAxisY,wAlu1]) {
		translate([0,0,tLeadScrewNutMount-hLeadScrewNut3]) drawLeadScrewNut();
		rotate([0,0,180]) drawLeadScrewNutMount();
	}

	translate([extrusionLengthBedX/2+wAlu1,offsetLeadScrewAxisY,wAlu1/2]) rotate([0,0,90]) rotate([90,0,0]) drawZCarriageAssembly();
	mirror([1,0,0]) translate([extrusionLengthBedX/2+wAlu1,offsetLeadScrewAxisY,wAlu1/2]) rotate([0,0,90]) rotate([90,0,0]) drawZCarriageAssembly();
}


module drawTotalAssembly(prmEnclosed = false)
{
	translate([0,0,0]) drawFrameAssembly(prmEnclosed);
	zCarriagePosMid = distanceFloorToTopAluProfile + tZRodMount + lZCarriage/2 + maxBuildHeight/2 - wAlu1/2 + 0;
	zCarriagePos = zCarriagePosMid;
//	zCarriagePos = zCarriagePosMid+maxBuildHeight/2;
//	zCarriagePos = zCarriagePosMid-maxBuildHeight/2;
	translate([0,0,zCarriagePos]) drawBedAssembly();

	translate([0,distanceLeadScrewToBedHole + distHeatedBedHolesY/2,distanceFloorToTopAluProfile]) {
		translate([0,0,tZMotorMount]) rotate([0,180,0]) drawZMotorMount();
		translate([0,0,-getHNema(motorZ)]) drawNema(motorZ);
		translate([0,0,getHAxleNema(motorZ)+getHCylinderNema(motorZ)]) drawCoupler();
		translate([0,0,getHAxleNema(motorZ)+getHCylinderNema(motorZ)]) drawLeadScrew();
	}
	translate([0,distanceLeadScrewToBedHole + distHeatedBedHolesY/2,extrusionLengthZ-wAlu1-tZBearingMount]) drawZBearingMount();
	
	translate([0,distanceLeadScrewToBedHole + distHeatedBedHolesY/2,distanceFloorToTopAluProfile]) {
		translate([distanceLeadScrewToZRod,0,tZRodMount]) rotate([0,180,0]) drawZRodMount();
		translate([-distanceLeadScrewToZRod,0,tZRodMount]) rotate([0,180,0]) drawZRodMount();
		translate([distanceLeadScrewToZRod,0,-tZRodMountThick+tZRodMount-extraLengthZRod/2]) drawRod(BearingZ,ZRodLength);
		translate([-distanceLeadScrewToZRod,0,-tZRodMountThick+tZRodMount-extraLengthZRod/2]) drawRod(BearingZ,ZRodLength);
		translate([distanceLeadScrewToZRod,0,distanceBetweenAluProfilesZ-tZRodMount]) drawZRodMount();
		translate([-distanceLeadScrewToZRod,0,distanceBetweenAluProfilesZ-tZRodMount]) drawZRodMount();
	}
}
module plate1()
{
   translate([60,-40,-5]) drawYRodMount();
   translate([60,40,-5]) drawYRodMount();
   translate([85,-40,-5]) drawYRodMount();
   translate([85,40,-5]) drawYRodMount();
   translate([-15,5,-5]) rotate([0,0,-90]) drawXYIdler();
   translate([60,-5,-5]) rotate([0,0,90]) drawXYIdler();
   rotate([180,0,0]) translate([0,-25,0]) drawXYMotorMountLeft();
   rotate([180,0,0]) translate([0,25,0]) drawXYMotorMountRight();
}

module plate2()
{

   translate([0,-lYCarriage/2-10,0])  drawYCarriage();
   translate([0, lYCarriage/2+10,0])  drawYCarriage();
   translate([-40, 0,-1])  drawYCarriageClamp();
   translate([40, 0,-1])  drawYCarriageClamp();
   translate([-40, -lYCarriage-20,-1])  drawYCarriageClamp();
   translate([40, -lYCarriage-20,-1])  drawYCarriageClamp();
   
}

// tests
//drawScrew(20);
//drawScrewHeadMaskFlat(rScrew);
//drawScrewHeadMask();
//drawNut();
//drawWasher();
//drawBearing(BearingZ);
//drawBearingMask(BearingZ);
//drawFlangeBearing(smallFB);
//drawFlangeBearing(bigFB);
//drawFlangeBearingNutMask(smallFB);
//drawRod(BearingZ,100);
//drawNema(NEMA14);
//drawNema(NEMA17);
//drawNema(NEMA23);
//drawHeatedBed();
//drawProfileFlatCorner();
//drawProfileFlatCenter();
//drawProfileFlat();
//drawProfile(300);
//drawLeadScrewNut();
//drawCoupler();
//drawFancyRounding(rAluScrew);
//drawCornerFillet(5, 20);
//drawZMotorMountPlateFlat();
//drawZMotorMountPlate();
//drawAluCornerPiece();
//drawFlangeBearingHole(smallFB);
//drawYCarriageTopPart();
//drawGT2Pulley();
//drawYRodMount(true);
//drawXCarriageBeltMask();
//drawExtruder();
//drawAluHammerNutHole();
//drawAluOpenScrewHole();
//drawSidePanel();
//drawBackPanel();
//drawBottomPanel();
//drawTopPanel();
//drawFrontPanel();


// printed parts
//rotate([0,90,0]) drawBedClamp();
//rotate([180,0,0]) drawLeadScrewNutMount();
//rotate([180,0,0]) drawLeadScrewNutMount(true);
//drawZCarriage();
//drawZCarriage(true,45);
//rotate([180,0,0]) drawZCarriageClamp();
//drawZMotorMount();
//drawZBearingMount();
//drawZRodMount();
//drawYRodMount();
//drawYCarriage();
//rotate([180,0,0]) drawYCarriageClamp();
//drawXYIdler();
//rotate([180,0,0]) drawXYMotorMountLeft();
//rotate([180,0,0]) drawXYMotorMountRight();
//rotate([180,0,0]) drawXCarriage();
//rotate([180,0,0]) drawXCarriageClamp();
//rotate([180,0,0]) drawXCarriageClamp(true);
//rotate([180,0,0]) drawXCarriageBeltClamp();
//drawTrippleCornerPiecePrintable();
//rotate([90,0,0]) drawHinge(true);
//rotate([90,0,0]) drawHinge(false);
//drawDoorKnob();
//drawGregMount();
//drawXEndstopMount();
//drawYEndstopMount();
//drawWireHolderClip();
//drawWireHolderClip(true);
//drawTopDome();
//drawSpoolholderLeft();
//drawSpoolholderRight();
//drawCameraMount();
//drawShockAbsorber();


// assemblies
//drawHingeAssembly();
//drawFrontPanelAssembly();
//drawFrameAssembly();
//drawXYAssembly();
//drawXYAssemblyRight();
//drawXYAssemblyLeft();
//drawZCarriageAssembly();
//drawYCarriageAssembly();
//drawXCarriageAssembly();
//drawBedAssembly();
//drawTotalAssembly();
//drawTotalAssembly(true);

//plate1();
plate2();

//HyperCubeMax
//drawYMaxRodMount();
//drawYMaxCarriage();

// assemblies
//drawYMaxCarriageAssembly();
//drawXYMaxAssembly();
//drawXYMaxAssemblyLeft();