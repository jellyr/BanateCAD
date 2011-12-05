--require("glsl")

--[[
    // Construction and destruction.  This class represents a set of N-1
    // springs connecting N masses that lie on a curve.  Spring i connects
    // masses i-1 and i for 1 <= i <= N-1.
--]]

MassSpringCurve = inheritsFrom(ParticleSystem)
function MassSpringCurve.new(params)
	local new_inst = MassSpringCurve.create()

	ParticleSystem.Init(new_inst, params)

	new_inst.NumSprings =  self.NumParticles -1 or 0;
	new_inst.Constant = {};	-- numsprings
	new_inst.Length = {};	-- numsprints

	return new_inst
end


function MassSpringCurve.GetConstant(i)	-- spring constant
	return self.Constant[i];
end

function MassSpringCurve.GetLength(i)		-- spring resting length
	return self.Length[i];
end

function MassSpringCurve.RenderSelf(self, renderer)
	assert(false, "MassSpringCurve.RenderSelf, not implemented")
end

function MassSpringCurve.InitializeParticle(index)
	assert(false, "MassSpringCurve.InitializeParticle, not implemented")
end

--[[
        // Callback for acceleration
        // (ODE solver uses x" = F/m) applied to particle i.
        // The positions and velocities are not necessarily
        // m_akPosition and m_akVelocity since the ODE solver evaluates the
        // impulse function at intermediate positions.
--]]
function Acceleration(i, fTime, akPosition, akVelocity)
--[[
	// Compute spring forces on position X[i].  The positions are not
	// necessarily m_akPosition since the RK4 solver in ParticleSystem
	// evaluates the acceleration function at intermediate positions.  The end
	// points of the curve of masses must be handled separately since each
	// has only one spring attached to it.
--]]

    local kAcceleration = ExternalAcceleration(i, fTime, akPosition, akVelocity);

	local kDiff = vec3(0,0,0);
	local kForce = vec3(0,0,0);
	local fRatio = 0;

	if i > 1 then
		local iM1 = i - 1;
		kDiff = akPosition[iM1] - akPosition[i];
		fRatio = self.Length[iM1] / kDiff.length();
		kForce = self.Constant[iM1] * (1.0 - fRatio) * kDiff;
		kAcceleration = kAcceleration + self.MassInverse[i] * kForce;
	end

	local iP1 = i + 1;
	if iP1 < NumParticles-1 then
		kDiff = akPosition[iP1] - akPosition[i];
		fRatio = self.Length[i] / kDiff.length();
		kForce = self.Constant[i] * (1.0 - fRatio) * kDiff;
		kAcceleration = kAcceleration + self.MassInverse[i] * kForce;
	end

	return kAcceleration;
end

--[[
        /// <summary>
        /// The default external force is zero.
        ///
        /// To provide nonzero external forces, a subclass can override this method
        /// and supply forces such as gravity, wind, friction, and the like.
        ///
        /// This function is called from the Acceleration()... method, to append
        /// the acceleration F/m generated by the external force F.
        /// </summary>
        /// <param name="i"></param>
        /// <param name="fTime"></param>
        /// <param name="akPosition"></param>
        /// <param name="akVelocity"></param>
        /// <returns></returns>
--]]
function ExternalAcceleration(i, fTime, akPosition, akVelocity)
	return vec.Zero;
end
