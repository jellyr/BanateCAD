--
-- FabuWindow.lua
--
-- The primary window for BanateCAD
--
-- Copyright (c) 2011  William Adams
--

-- Global namespace


require "iuplua"
require "iupluagl"
require "luagl"
require "luaglu"

require "MenuManager"
require "MenuController"
require "FileManager"
require "HeadsUpLanguage"

intext = iup.text({
	expand = 'YES',
	MULTILINE = 'YES',
	TABSIZE = "4",
	WORDWRAP = "YES",
	FONTFACE = "MS Shell Dlg 2",
	FONTSIZE = 8,
	})

viewinsplit = iup.split({
	defaultglcanvas,
	intext;
	orientation = "HORIZONTAL",
	showgrip = "FALSE",
	VALUE = "800",
})

local class = require "pl.class"

class.ProcessingWindow()
function ProcessingWindow:_init(o)
	o = o or {}		-- create object if user does not provide one


	self.Name = o.Name or "Application"
	self.menuman = MenuManager()
	self.Window = iup.dialog({
			viewinsplit;	-- The primary content

			-- Initial attributes of window
			--size='HALFxHALF',
			RASTERSIZE = "1024x768",
			TITLE=o.Name,
			SHRINK= "YES",
		})

	self.menucontrol = MenuController({Window=self.Window})
	self.Window.MENU = self.menuman:GetMainMenu(self.menucontrol)

end

function ProcessingWindow.Show(self)
	self.Window:show();
end

function ProcessingWindow.SetFilename(self,filename)
	local name = filename or "File"

	self.Window.TITLE = self.Name..' - '..name;
end

--function defaultglcanvas.map_cb(self)
	-- Do whatever we want once
	-- we are actually mapped to a real window
--end

return ProcessingWindow
