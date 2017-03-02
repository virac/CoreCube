// Nema Types
NEMA14 = 1;
NEMA17 = 2;
NEMA23 = 3;


// Nema dimensions
hNEMA14 = 41.0;
w1NEMA14 = 35.0;
w2NEMA14 = sqrt(2*w1NEMA14*w1NEMA14) - 5.4;
rCylinderNEMA14 = 22.0/2;
hCylinderNEMA14 = 2.0;
rAxleNEMA14 = 5.0/2;
hAxleNEMA14 = 19.0;
rScrewHoleNEMA14 = 3.0/2;
hScrewHoleNEMA14 = 3.5;
distScrewHolesNEMA14 = 25.9;
wScrewSlotNEMA14 = 1.5;

hNEMA17 = 47.3;
w1NEMA17 = 42.3;
w2NEMA17 = sqrt(2*w1NEMA17*w1NEMA17) - 6.4;
rCylinderNEMA17 = 22.0/2;
hCylinderNEMA17 = 2.0;
rAxleNEMA17 = 5.0/2;
hAxleNEMA17 = 22.0;
rScrewHoleNEMA17 = 3.0/2;
hScrewHoleNEMA17 = 5.5;
distScrewHolesNEMA17 = 31.0;
wScrewSlotNEMA17 = 2.0;

hNEMA23 = 56.0;
w1NEMA23 = 56.4;
w2NEMA23 = sqrt(2*w1NEMA23*w1NEMA23) - 6.4;
rCylinderNEMA23 = 38.1/2;
hCylinderNEMA23 = 1.6;
rAxleNEMA23 = 6.0/2;
hAxleNEMA23 = 20.6;
rScrewHoleNEMA23 = 4.0/2;
hScrewHoleNEMA23 = 5.0;
distScrewHolesNEMA23 = 47.1;
wScrewSlotNEMA23 = 2.0;


function getHNema(prmNemaType) = (prmNemaType==NEMA14)?hNEMA14:(prmNemaType==NEMA17)?hNEMA17:hNEMA23;

function getW1Nema(prmNemaType) = (prmNemaType==NEMA14)?w1NEMA14:(prmNemaType==NEMA17)?w1NEMA17:w1NEMA23;

function getW2Nema(prmNemaType) = (prmNemaType==NEMA14)?w2NEMA14:(prmNemaType==NEMA17)?w2NEMA17:w2NEMA23;

function getRCylinderNema(prmNemaType) = (prmNemaType==NEMA14)?rCylinderNEMA14:(prmNemaType==NEMA17)?rCylinderNEMA17:rCylinderNEMA23;

function getHCylinderNema(prmNemaType) = (prmNemaType==NEMA14)?hCylinderNEMA14:(prmNemaType==NEMA17)?hCylinderNEMA17:hCylinderNEMA23;

function getRAxleNema(prmNemaType) = (prmNemaType==NEMA14)?rAxleNEMA14:(prmNemaType==NEMA17)?rAxleNEMA17:rAxleNEMA23;

function getHAxleNema(prmNemaType) = (prmNemaType==NEMA14)?hAxleNEMA14:(prmNemaType==NEMA17)?hAxleNEMA17:hAxleNEMA23;

function getRScrewHoleNema(prmNemaType) = (prmNemaType==NEMA14)?rScrewHoleNEMA14:(prmNemaType==NEMA17)?rScrewHoleNEMA17:rScrewHoleNEMA23;

function getHScrewHoleNema(prmNemaType) = (prmNemaType==NEMA14)?hScrewHoleNEMA14:(prmNemaType==NEMA17)?hScrewHoleNEMA17:hScrewHoleNEMA23;

function getDistScrewHolesNema(prmNemaType) = (prmNemaType==NEMA14)?distScrewHolesNEMA14:(prmNemaType==NEMA17)?distScrewHolesNEMA17:distScrewHolesNEMA23;

function getWScrewSlotNema(prmNemaType) = (prmNemaType==NEMA14)?wScrewSlotNEMA14:(prmNemaType==NEMA17)?wScrewSlotNEMA17:wScrewSlotNEMA23;

