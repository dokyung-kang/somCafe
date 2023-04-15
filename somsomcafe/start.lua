-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	
	--------------------------------------------------------------------------------------------------------------------
	-- 게임 시작 페이지 (작업자 : 박주희) 


	-- 배경이미지 삽입
	local background = display.newImageRect("img/start_background.png", display.contentWidth, display.contentHeight)
 	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	-- 시작 버튼 이미지 삽입
	local start_button = display.newImage("img/start/start.png")
 	start_button.x, start_button.y = 724, 2143

	-- 시작 버튼 이벤트
	local function start_button_event( event )  
 		if( event.phase == "began" ) then  
 			composer.gotoScene( "game1" )
 		end  
 	end
	 
	-- 팝업 닫기 이벤트 적용
	start_button:addEventListener("touch", start_button_event)
	 --------------------------------------------------------------------------------------------------------------------

	  sceneGroup:insert(background)
	  sceneGroup:insert(start_button)

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
		composer.removeScene('start')
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