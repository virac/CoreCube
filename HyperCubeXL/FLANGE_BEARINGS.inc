// Flange Bearing Types
F608ZZ = 1;
F623ZZ = 2;
Pully2GT16T = 3;

// Bearing dimensions
wFlangeBearingF608ZZ = 7.0;
tFlangeBearingF608ZZ = 1.5;
rFlangeBearingOuterF608ZZ = 22.0/2;
rFlangeBearingInnerF608ZZ = 8.0/2;
rFlangeBearingF608ZZ = 25.5/2;
rFlangeBearingWasherOuterF608ZZ = 15.7/2;
rFlangeBearingWasherInnerF608ZZ = 8.4/2;
tFlangeBearingWasherF608ZZ = 1.9;
rFlangeBearingNutF608ZZ = 14.6/2;
tFlangeBearingNutF608ZZ = 6.3;

wFlangeBearingF623ZZ = 4.0;
tFlangeBearingF623ZZ = 1.0;
rFlangeBearingOuterF623ZZ = 10.0/2;
rFlangeBearingInnerF623ZZ = 3.0/2;
rFlangeBearingF623ZZ = 11.5/2;
rFlangeBearingWasherOuterF623ZZ = 5.7/2;
rFlangeBearingWasherInnerF623ZZ = 3.3/2;
tFlangeBearingWasherF623ZZ = 0.5;
rFlangeBearingNutF623ZZ = 6.1/2;
tFlangeBearingNutF623ZZ = 2.3;

wFlangeBearing2GT16T = 9.0/2;
tFlangeBearing2GT16T = 1.0;
rFlangeBearingOuter2GT16T = 9.5/2;
rFlangeBearingInner2GT16T = 3.0/2;
rFlangeBearing2GT16T = 13/2;
rFlangeBearingWasherOuter2GT16T = 5.7/2;
rFlangeBearingWasherInner2GT16T = 3.3/2;
tFlangeBearingWasher2GT16T = 0.5;
rFlangeBearingNut2GT16T = 6.1/2;
tFlangeBearingNut2GT16T = 2.3;

function getWFlangeBearing(prmBearingType) = (prmBearingType==F608ZZ)?wFlangeBearingF608ZZ:(prmBearingType==F623ZZ)?wFlangeBearingF623ZZ:wFlangeBearing2GT16T;

function getTFlangeBearing(prmBearingType) = (prmBearingType==F608ZZ)?tFlangeBearingF608ZZ:(prmBearingType==F623ZZ)?tFlangeBearingF623ZZ:tFlangeBearing2GT16T;

function getRFlangeBearingOuter(prmBearingType) = (prmBearingType==F608ZZ)?rFlangeBearingOuterF608ZZ:(prmBearingType==F623ZZ)?rFlangeBearingOuterF623ZZ:rFlangeBearingOuter2GT16T;

function getRFlangeBearingInner(prmBearingType) = (prmBearingType==F608ZZ)?rFlangeBearingInnerF608ZZ:(prmBearingType==F623ZZ)?rFlangeBearingInnerF623ZZ:rFlangeBearingInner2GT16T;

function getRFlangeBearing(prmBearingType) = (prmBearingType==F608ZZ)?rFlangeBearingF608ZZ:(prmBearingType==F623ZZ)?rFlangeBearingF623ZZ:rFlangeBearing2GT16T;

function getRFlangeBearingWasherOuter(prmBearingType) = (prmBearingType==F608ZZ)?rFlangeBearingWasherOuterF608ZZ:(prmBearingType==F623ZZ)?rFlangeBearingWasherOuterF623ZZ:rFlangeBearingWasherOuter2GT16T;

function getRFlangeBearingWasherInner(prmBearingType) = (prmBearingType==F608ZZ)?rFlangeBearingWasherInnerF608ZZ:(prmBearingType==F623ZZ)?rFlangeBearingWasherInnerF623ZZ:rFlangeBearingWasherInner2GT16T;

function getTFlangeBearingWasher(prmBearingType) = (prmBearingType==F608ZZ)?tFlangeBearingWasherF608ZZ:(prmBearingType==F623ZZ)?tFlangeBearingWasherF623ZZ:tFlangeBearingWasher2GT16T;

function getHeightFlangeBearing(prmBearingType) = 2*getWFlangeBearing(prmBearingType) + 2*getTFlangeBearingWasher(prmBearingType);

function getRFlangeBearingNut(prmBearingType) = (prmBearingType==F608ZZ)?rFlangeBearingNutF608ZZ:(prmBearingType==F623ZZ)?rFlangeBearingNutF623ZZ:rFlangeBearingNut2GT16T;

function getTFlangeBearingNut(prmBearingType) = (prmBearingType==F608ZZ)?tFlangeBearingNutF608ZZ:(prmBearingType==F623ZZ)?tFlangeBearingNutF623ZZ:tFlangeBearingNut2GT16T;