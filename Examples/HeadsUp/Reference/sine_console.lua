--[[
/** Sine Console
* Processing: Creative Coding and
* Computational Art
* By Ira Greenberg */
--]]

local px = 0;
local py = 0;
local px2 = 0;
local py2 = 0;
local angle = 0;
local angle2 = 0;
local radius = 100;
local frequency = 2;
local frequency2 = 2;
local x = 0;
local x2 = 0;

-- used to create font
-- PFont myFont;

function setup()
  size(600, 200);
  background (127);

  -- generate processing font from system font
  --myFont = createFont("verdana", 12);
  --textFont(myFont);
end

function draw()
  background (127);
  noStroke();
  fill(0,0,128);
  ellipse(width/8, 75, radius, radius);

  -- rotates rectangle around circle
  px = width/8 + cos(radians(angle))*(radius/2);
  py = 75 + sin(radians(angle))*(radius/2);
  --rectMode(CENTER);
  fill(0);

  -- draw rectangle
  rect (px, py, 5, 5);
  stroke(200, 200, 53);
  line(width/8, 75, px, py);
  stroke(200);

  -- keep reinitializing to 0, to avoid
  -- flashing during redrawing
  angle2 = 0;

  -- draw static curve - y = sin(x)
  for i = 0, width-1 do
    px2 = width/8 + cos(radians(angle2))*(radius/2);
    py2 = 75 + sin(radians(angle2))*(radius/2);
    point(width/8+radius/2+i, py2);
    angle2 = angle2 - frequency2;
  end

  -- send small ellipse along sine curve
  -- to illustrate relationship of circle to wave
  noStroke();
  ellipse(width/8+radius/2+x, py, 5, 5);
  angle = angle - frequency;
  x = x+1;

  -- when little ellipse reaches end of window
  -- reinitialize some variables
  if (x >= width-60) then
    x = 0;
    angle = 0;
  end

  -- draw dynamic line connecting circular
  -- path with wave
  stroke(50);
  line(px, py, width/8+radius/2+x, py);

  -- output some calculations
  --text("y = sin x", 35, 185);
  --text("px = " + px, 105, 185);
  --text("py = " + py, 215, 185);
end