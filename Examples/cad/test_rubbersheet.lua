local size = {(256),(256)}
local res = {1,1}

local checkem = checkerboard:new({Columns=size[1], Rows=size[2], LowColor={0,0,0,1}, HighColor={1,1,1,1}})
--local checkers = checkerboard.new({Columns=size[1], Rows=size[2]})
--local colorSampler = ImageSampler.new({Filename='profile_1024_768.png'})
--local colorSampler	= ImageSampler.new({Filename='profile_80_60.png'})

local colorSampler = ImageSampler.new({
--	Filename='firstheightmap.png',
--	Filename='profile_80_60.png',
	Filename='Gandhi.png',
	Size = size,
	Resolution = res,
	MaxHeight=12,
})



function test_heightmap()

local lshape = RubberSheet.new({
	Size=size,
	Resolution=res,
--	ColorSampler = checkem,
	ColorSampler = colorSampler,
	VertexSampler = colorSampler,	
--	Thickness = -10,
	})

	translate({-size[1]/2, -size[2]/2, 0})
	addshape(lshape)
end


test_heightmap()