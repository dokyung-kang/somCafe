-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"

-- 배경 소리
local somsomcafebgm = audio.loadSound("sound/somsomcafebgm.mp3", { loops=-1 })
audio.play(somsomcafebgm, {channel=2})
audio.setVolume( 0.3, { channel=2 } ) 

-- event listeners for tab buttons:
local function onFirstView( event )
	composer.gotoScene( "start" )
end


onFirstView()	-- invoke first tab button's onPress event manually
