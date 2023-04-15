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
	local background = display.newImage("img/clear_background.png", display.contentCenterX, display.contentCenterY)
 
    --다시하기 
	local retry = display.newImage("img/clear/retry.png", display.contentCenterX, display.contentCenterY)
	retry.x = 751
	retry.y = 1723
	
	sceneGroup:insert(background)
	sceneGroup:insert(retry)
	sceneGroup:insert(out)

	
	local function retry_button(event)
		print("시작화면으로")
		composer.gotoScene('end')
	end
 	retry:addEventListener("tap", retry_button) -- 다시하기 누르면 게임화면으로

 	local function out_button(event)
		native.requestExit()
 	end
 	out:addEventListener("tap", out_button)
	
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
		composer.removeScene('clear')
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