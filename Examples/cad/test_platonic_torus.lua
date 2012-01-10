pradius = 2

color(crayola.rgb("Purple"))
tetrahedron(pradius)

color(crayola.rgb("Yellow"))
translate({-3, 3, 0})
icosahedron(pradius)


color(crayola.rgb("Cerulean"))
translate({-3, -3, 0})
hexahedron(pradius)

color(crayola.rgb("Cranberry"))
translate({3, 3, 0})
octahedron(pradius)

color(crayola.rgb("Inchworm"))
translate({3, -3, 0})
dodecahedron(pradius)


color(crayola.rgb("Blue Bell"))
translate({0, 0, pradius})
torus({
	HoleRadius=3.5,
	ProfileRadius=1.5,
	USteps = 90,
	WSteps = 180})