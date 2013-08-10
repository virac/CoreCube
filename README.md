CoreCube
========

OpenScad design for an Hbot Reprap

Current design is to use aluminum extrusions to create a 500mm cube that has approximatly 350mm x 400mm build area. (May be down to 300mm square once complete.)

Current known parts:
	4x 500mm mitsumi aluminum 20x20mm
	9x 460mm mitsumi aluminum 20x20mm
	2x 500mm 10mm dia precision rod (mcmaster carr)
	2x 400mm 10mm dia presision rod (mcmaster carr)
	8x LM10UU linear bearing (ebay)
	12x bearing small ( for belt travel )
	102xish m5 10mm SHCS (socket head cap screw)
	6x m5 30mm SHCS	( for bearing belt travel )
	8x m5 20mm SHCS ( for top to hold down 10mm rod )
	116xish m5 washer
	116xish m5 tslot nut ( or m5 nut with plastic printed adaptor )
	
planned added parts
	8x DryLin R Solid polymer bearing RJM-01-10; replace the LM10UU in the xy axis
	4x 10mm dia precision rod; for z-axis
	alotx m5 SHCS

possible parts
	2x 460mm mitsumi aluminum 20x20mm; added support/mount points on the vertical axis
	2x 220mm mitsumi aluminum 20x20mm; complete the support/add mount points on the bottom
	
possible problems so far
	the plastic tslot nuts that i am using may not hold the stress from the GT2 belt once tightend

problem found so far and overcome
	corexy belt system using 2 shorter belts. complicated the design. Having to have the 2 belt systems on 2 separate levels when deigning the parts in openscad was overly complicated teying to maintain parametricness. redesigned to only use a single belt after sourcing a long enough single belt from sdp-si
	x-ends no aligning correctly with extension and bearing stop. placed bearings ontop of each other and bearings lined up better, still not perfect; cause is bearing housing is built along the axis of motion so any z-wobble found in the building device will compound the error, may redesign again
