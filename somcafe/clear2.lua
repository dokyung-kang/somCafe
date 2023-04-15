-----------------------------------------------------------------------------------------
--
-- clear.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
    --클리어 화면 출력
	local background = display.newImage("img/clear_background/background.png", display.contentCenterX, display.contentCenterY)
 	-- 클리어 타이틀
 	local clearTitle = display.newImage("img/clear_background/clear.png", display.contentCenterX, display.contentCenterY)
    --넘어가기
	local goNext = display.newImage("img/clear_background/next.png", display.contentCenterX, display.contentCenterY)
	goNext.y = 1723
	-- 클리어 소리
	local clear_page = audio.loadSound("sound/clear_page.mp3")
	audio.play(clear_page, {channel=3})

	audio.setVolume( 0, { channel=2 } ) 
	audio.setVolume( 1, { channel=3 } ) 

	sceneGroup:insert(background)
	sceneGroup:insert(clearTitle)
	sceneGroup:insert(goNext)

	
	local function retry_button(event)
		print("3일차로")

		audio.setVolume( 0.3, { channel=2 } ) 
		audio.rewind( { channel=2 } )
		audio.setVolume( 0, { channel=3 } ) 

		composer.gotoScene('game3')

	end
 	goNext:addEventListener("tap", retry_button) -- 2일차로
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		composer.removeScene('clear2')
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene