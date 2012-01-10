-- Set the color scheme to "Cornfield"
defaultviewer.colorscheme = colorschemes.Cornfield

stagesize = 100

-- Demo
function show_spiralring()
funangle = math.rad(137.5)
radius = 100
anglesteps = 360/1
lathigh = math.pi * .55
latlow = math.pi - lathigh
latrange = lathigh-latlow
tetrasize = 1

for i=0,anglesteps do
	v = i/anglesteps
	local long = i*funangle;
	local lat = latlow + v*latrange;
	local pos = sph_to_cart({long, lat, radius})

	color({1-v,lat/math.pi,v,1})
	translate(pos)
	tetrahedron(tetrasize)
end
end


-- Showing all crayola colors
function show_crayola()
local row = 1
local column = 1
local size = 5
local width = 10

for v in pairs(crayola) do
	if type(v) == "string"  and type(crayola[v]) == "table" then
		--print(v)
		color(crayola.rgb(v))
		translate({column*size, row*size, 0})
		octahedron(3)
		column = column + 1
		if column > width then
			column = 1
			row = row + 1
		end
	end
end
end

function show_platonics()
local gm = 1.618
local size = 8
local offset = {-size*4, -size*4, 0}

	translate(offset)
	tetrahedron(size)

	-- color literals will default to Crayola naming
	color("Purple")
	translate(vec3_add(offset, {-size*2, size*2, 0}))
	icosahedron(size)

	color("Inchworm")
	translate(vec3_add(offset, {size*2, -size*2, 0}))	
	dodecahedron(size)


	color(crayola.rgb("Cerulean"))
	translate(vec3_add(offset, {-size*2, -size*2, 0}))
	hexahedron(size)

	-- Crayola explicit color including alpha/transparency
	-- using .rgba instead of .rgb
	color(crayola.rgba("Cranberry", 0.75))
	translate(vec3_add(offset, {size*2, size*2, 0}))
	octahedron(size)

end

function show_bicubic()
	local gcp4 = {{-stagesize,stagesize,-stagesize,1}, {-stagesize/2,stagesize,0,1}, {stagesize/2,stagesize,0,1}, {stagesize,stagesize,-stagesize,1}};
	local gcp3 = {{-stagesize,stagesize/2,stagesize,1}, {-stagesize/2,stagesize/2,-stagesize/3,1}, {stagesize/2,stagesize/2,-stagesize/3,1}, {stagesize,stagesize/2,-stagesize,1}};
	local gcp2 = {{-stagesize,-stagesize/2,-stagesize,1}, {-stagesize/2,-stagesize/2,0,1}, {stagesize,-stagesize/2,0,1}, {stagesize,-stagesize/2,stagesize,1}};
	local gcp1 = {{-stagesize,-stagesize,-stagesize,1}, {-stagesize/2,-stagesize,0,1}, {stagesize,-stagesize,0,1}, {stagesize,-stagesize,-stagesize,1}};

	local usteps = 30
	local wsteps = 30
	
	color(crayola.rgba("Robin's Egg Blue", 0.35))
	bicubicsurface({gcp1, gcp2, gcp3, gcp4}, 1, usteps, wsteps)
end


function show_blobs()
	local offset = {35, -25, 0}
	local triballs = {
		{-10,-5,12,5},		-- eye
		{10,-5,12,5},		-- eye

		--{0,10,0,5},
		{0,-30,0,5},		-- snout

		{0,0,5,5}
		}

	local radius = 30

	color("Yellow")
	translate(offset)
	blobs(triballs, radius, 30, 30)



end

function show_supershape()
color(crayola.rgb("Jazzberry Jam"))
translate({-30,30,0})
supershape({
		shape1 = {m = 7, n1 = 0.2, n2 = 1.7, n3 = 1.7, a = 1.2, b = 1.25},
		shape2 = {m = 7, n1 = 0.2, n2 = 1.7, n3 = 1.7, a = 1.2, b = 1.25},
		phisteps = 180,
		thetasteps = 180
		})
end

function show_torus()
	color(crayola.rgba("Blue Bell", 0.25))
	translate({0, 0, 0})
	torus({
		HoleRadius=100,
		ProfileRadius=15,	-- 20,5
		USteps = 90,
		WSteps = 180})
end

show_spiralring()
show_crayola()
show_platonics()
show_bicubic()
show_blobs()
show_supershape()
show_torus()