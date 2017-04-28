

thickness = 2;

paper_width = 57;
paper_length = 87;

box_height = 50;

slit = true;
slit_width = 20;

base_width = 67;
base_length = 97;
base_height = 2;

box_length = paper_length + thickness * 2; 
box_width = paper_width + thickness * 2;

module slit(){
	translate([0, slit_width/2, 0]) cylinder(d=slit_width, h=thickness*3, center=false);
	translate([-slit_width/2, slit_width/2, 0]) cube([slit_width, box_height-slit_width/2, thickness*3]);
}

module base(){
	cube([base_length, base_width, base_height]);
}

module container(){
	difference(){
		cube([box_length, box_width, box_height + thickness]);
		translate([thickness, thickness, thickness]) cube([paper_length, paper_width, box_height]);
		if (slit){
			rotate([90, 0, 0]) translate([(box_length/2), base_height, -(base_width - box_width)/2]) slit();
		}
	}
}
base();
translate([(base_length - box_length)/2, (base_width - box_width)/2, 0]) container();
