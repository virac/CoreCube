// Bearing Types
LM8UU = 1;
LM10UU = 2;
LM12UU = 3;


// Bearing dimensions
lBearingLM8UU = 24.0;
rBearingOuterLM8UU = 15.0/2;
rBearingInnerLM8UU = 8.0/2;

lBearingLM10UU = 29.0;
rBearingOuterLM10UU = 19.0/2;
rBearingInnerLM10UU = 10.0/2;

lBearingLM12UU = 30.0;
rBearingOuterLM12UU = 21.0/2;
rBearingInnerLM12UU = 12.0/2;


function getLBearing(prmBearingType) = (prmBearingType==LM8UU)?lBearingLM8UU:(prmBearingType==LM10UU)?lBearingLM10UU:lBearingLM12UU;

function getRBearingOuter(prmBearingType) = (prmBearingType==LM8UU)?rBearingOuterLM8UU:(prmBearingType==LM10UU)?rBearingOuterLM10UU:rBearingOuterLM12UU;

function getRBearingInner(prmBearingType) = (prmBearingType==LM8UU)?rBearingInnerLM8UU:(prmBearingType==LM10UU)?rBearingInnerLM10UU:rBearingInnerLM12UU;

function getRBearingRodMask(prmBearingType) = getRBearingInner(prmBearingType) + 1.0;


