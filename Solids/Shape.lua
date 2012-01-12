
local class = require "pl.class"

-- Create a base class, Shape
class.Shape()

-- The primary function of a shape
function Shape.RenderBegin(self, renderer)
	if self.Transform ~= nil then
		renderer:SaveTransform()

		if self.Transform.Translation ~= nil then
			renderer:Translate(self.Transform.Translation)
		end

		if self.Transform.Scale ~= nil then
			renderer:Scale(self.Transform.Scale)
		end
	end

	if self.Material ~= nil then
		renderer:ApplyMaterial(self.Material)
	end
end

function Shape.RenderSelf(self, renderer)
end

function Shape.Render(self, renderer)
	self:RenderBegin(renderer)


	self:RenderSelf(renderer)

	self:RenderEnd(renderer)
end

function Shape.RenderEnd(self, renderer)
	if self.Transform ~= nil then
		renderer:RestoreTransform()
	end
end

function Shape.SetTransform(self, atrans)
	self.Transform = atrans
end

function Shape.Update(self, toTime)
	--print("Shape.Update: ", toTime)
end

function Shape.__tostring(self)
	return "Shape"
end


--====================================
--	USEFUL FUNCTIONS
--====================================
function sortvertices(v1, v2)
	local xmin = math.min(v1[1], v2[1])
	local xmax = math.max(v1[1], v2[1])

	local ymin = math.min(v1[2], v2[2])
	local ymax = math.max(v1[2], v2[2])

	local zmin = math.min(v1[3], v2[3])
	local zmax = math.max(v1[3], v2[3])

	return vec3(xmin,ymin,zmin), vec3(xmax, ymax, zmax)
end


return Shape
