local thickness = -3
local usteps = 80*1
local wsteps = 60*1
local colorSampler2 = ImageSampler.new({Filename='profile_1024_768.png'})
local colorSampler1 = checkerboard:new({Columns=usteps, Rows=wsteps})

local stagesize=100
local gcp4 = {{-stagesize,stagesize,-stagesize,1}, {-stagesize/2,stagesize,0,1}, {stagesize/2,stagesize,0,1}, {stagesize,stagesize,-stagesize,1}};
local gcp3 = {{-stagesize,stagesize/2,stagesize/2,1}, {-stagesize/2,stagesize/2,-stagesize/3,1}, {stagesize/2,stagesize/2,-stagesize/3,1}, {stagesize,stagesize/2,stagesize/2,1}};
local gcp2 = {{-stagesize,-stagesize/2,stagesize/2,1}, {-stagesize/2,-stagesize/2,0,1}, {stagesize,-stagesize/2,0,1}, {stagesize,-stagesize/2,stagesize/2,1}};
local gcp1 = {{-stagesize,-stagesize,-stagesize,1}, {-stagesize/2,-stagesize,0,1}, {stagesize,-stagesize,0,1}, {stagesize,-stagesize,-stagesize,1}};

local mesh = {gcp1, gcp2, gcp3, gcp4}


local lshape1 = shape_bicubicsurface.new({
		M=cubic_bezier_M(),
		UMult=1,
		Mesh = mesh,
		Thickness = thickness,
		USteps = usteps,
		WSteps = wsteps,
		ColorSampler = colorSampler1,
		})

local lshape2 = shape_bicubicsurface.new({
		M=cubic_bezier_M(),
		UMult=1,
		Mesh = mesh,
		Thickness = thickness,
		USteps = usteps*4,
		WSteps = wsteps*4,
		ColorSampler = colorSampler2,
		})

local lshape3 = shape_bicubicsurface.new({
		M=cubic_bezier_M(),
		UMult=1,
		Mesh = mesh,
		Thickness = thickness,
		USteps = 16,
		WSteps = 16,
		})



--addshape(lshape1)

--translate({stagesize*2, 0, 0})
--addshape(lshape2)

color("Yellow")
--translate({stagesize*-2, 0, 0})
addshape(lshape3)

local lshape4 = shape_bicubicsurface.new({
		Thickness = -3,
		USteps = 8,
		WSteps = 8,
		ColorSampler = colorSampler2,
		})

--addshape(lshape4)