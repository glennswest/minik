// ramps 1.4 mounting plate - a OpenSCAD 
// Copyright (C) 2015  Gerard Valade

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.


$fn=30;

module arduinomega()
{
	width=53.3;
	length=101.6;
	
	x1 = 14;
	x2 = x1 + 1.3;
	x3 = x2 + 50.8;
	x4 = x3 + 24.1;
	x5 = x1+ 82.5;
	y1 = 2.5;
	y2 = y1 + 5.1;
	y3 = y2 + 27.9;
	y4 = y3 + 15.2;
	
	module spacers(d=2, h=6)
	{
		module spacer()
		{
			cylinder(d=d, h=h);
		}
		
		translate([x1, y4, 0]) 	spacer();
		translate([x4, y4, 0]) 	spacer();
		translate([x3, y3, 0]) 	spacer();
		translate([x3, y2, 0]) 	spacer();
		translate([x2, y1, 0]) 	spacer();
		translate([x5, y1, 0]) 	spacer();
		translate([x1+82.5, y1, 0]) 	spacer();
	}
	
	module joints()
	{
		module hullCylinder()
		{
			cylinder(d=8, h=2);
		}
		hull()
		{
			translate([x1, y4, 0]) 	hullCylinder();
			translate([x3, y3, 0]) 	hullCylinder();
		}
		hull()
		{
			translate([x4, y4, 0]) 	hullCylinder();
			translate([x3, y3, 0]) 	hullCylinder();
		}
		hull()
		{
			translate([x3, y3, 0]) 	hullCylinder();
			translate([x3, y2, 0]) 	hullCylinder();
		}
		hull()
		{
			translate([x3, y2, 0]) 	hullCylinder();
			translate([x2, y1, 0]) 	hullCylinder();
		}
		hull()
		{
			translate([x3, y2, 0]) 	hullCylinder();
			translate([x5, y1, 0]) 	hullCylinder();
		}
	}
	
	difference() {
		union() {
			//color([0.2,0.2,0.2]) cube([101.6, 53.3, 0.6]);
			joints();
			spacers(d=5, h=16);
			spacers(d=6.2, h=14);
		}	
		translate([0,0,-1]) spacers(d=2.3, h=18);
	}
	
}




use <MCAD/nuts_and_bolts.scad>;
use <basek.scad>;

$fn=128;

space=135.52;
psux = 89;
psuy = 34;
module ramps_body()
{
    translate([-2-space/2,-78,5])  arduinomega();
    translate([space/2-19,-58,0]) rotate([0,0,-120+90]) cube([8,80,40]);
    translate([space/2-19,-20,0]) cube([30,8,20]);
   
    
    
    translate([-2-space/2,-80,0]) cube([127,60,8]);
   
    translate([ space/2-20.5,-80,8]) cube([10,60,12]);
    
}

module standoff()
{
    
    difference(){
        translate([0,0,7.9]) cylinder(r=4,h=12);
        boltHole(3.3,length=20);
    }
    
}

module standoff_hole()
{
        
        boltHole(3.3,length=20);
}

module ramps_holes()
{
    translate([space/2+21,-1,32]) rotate([0,90,-120-90]) boltHole(3.5,length=15);
    translate([space/2+21,-1,20]) rotate([0,90,-120-90]) boltHole(3.5,length=15);
    translate([space/2+21,-1,08]) rotate([0,90,-120-90]) boltHole(3.5,length=15);
 
    
}


module ramps_bracket()
{
    difference(){
        ramps_body();
        ramps_holes();
    }
    
}

%cut_vslot();
translate([33,-45,0]) rotate([0,0,90+120+180+1]) ramps_bracket();