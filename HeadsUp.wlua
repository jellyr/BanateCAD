--
-- BanateProcessing.wlua
--
-- The main interface file
-- Copyright (c) 2011  Microsoft
--

require ("BAppContext")

-- Create the main window we will be using
local AppName = "Heads Up";

-- Construct the application object
local appctx = BAppContext({
		Modules={
			"HeadsUp",
			"UI",
			"Rendering",
			"geometry",
			"core",
		}
	})

require "BApplication"
require "ProcessingWindow"


local pWindow = ProcessingWindow({Name=AppName})

function pWindow.Window.keypress_cb(c, press)
--print("ProcessingWindow.keypress_cb: ", c, press)
	return iup.CONTINUE;
end

function pWindow.Window.close_cb(self)
	--print("ProcessingWindow.close_cb")
	-- Make sure to stop the animation
	Processing.StopAnimation()
	return iup.CLOSE
end

--print("pWindow: ", pWindow)

Application = BApplication({
	AppContext = appctx,
	Name=AppName,
	Window = pWindow
	});


-- Run the application
Application:Run();


