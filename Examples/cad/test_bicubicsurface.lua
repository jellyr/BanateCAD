local gcp4 = {{0,30,0,1}, {10,40,0,1}, {20,40,0,1}, {30,30,0,1}};
local gcp3 = {{5,20,10,1}, {10,20,20,1}, {15,25,15,1}, {20,20,5,1}};
local gcp2 = {{5,10,10,1}, {10,10,20,1}, {15,5,15,1}, {20,10,5,1}};
local gcp1 = {{0,0,0,1}, {10,-10,0,1}, {20,-10,0,1}, {30,0,0,1}};

local usteps = 30
local wsteps = 30

local columnsize = 30
local rowsize = 45
local numrows = 2
local numcolumns = 2

function test_surfaces()
for row = 1, numrows do
	for column = 1, numcolumns do
		local r = column/numcolumns
		local b = row/numrows
		local g = r*b

		color({r, g, b, 1})
		translate({(column-1)*columnsize, (row-1)*rowsize, 0})
		bicubicsurface({gcp1, gcp2, gcp3, gcp4}, 1, usteps, wsteps)

		-- Do these Icosahedrons just for kicks
		--color("Yellow")
		--translate({(column-1)*columnsize+columnsize/2, (row-1)*rowsize+rowsize/2, -10})
		--icosahedron(10)
	end
end
end

function test_heel()
	local hh=60;

	local fcp4 = {{0,-20,hh,1},{30,-20,hh+10,1}, {30,20,hh+10,1}, {0,20,hh,1}}; 
	local fcp3 = {{0,-20,50,1}, {30,-20,60,1}, {30,20,60,1}, {0,20,50,1}}; 
	local fcp2 = {{0,-1,40,1}, {10,-1,40,1}, {10,1,40,1}, {0,1,40,1}}; 
	local fcp1 = {{0,-1,0,1}, {10,-1,0,1}, {10,1,0,1}, {0,1,0,1}}; 

	color("Caribbean Green")
	bicubicsurface({fcp1, fcp2, fcp3, fcp4}, 1, usteps, wsteps)
end

translate({10,10,10})
test_heel()
--test_surfaces()