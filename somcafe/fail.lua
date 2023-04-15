-----------------------------------------------------------------------------------------
--
-- fail.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	
	--------------------------------------------------------------------------------------------------------------------
	-- 게임 시작 페이지 (작업자 : 박주희) 

	-- 배경이미지 삽입
	local background = display.newImageRect("img/fail_background/background.png", display.contentWidth, display.contentHeight)
 	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	-- 재시작 버튼 이미지 삽입
	local restart_button = display.newImage("img/fail_background/retry.png")
 	restart_button.x, restart_button.y = 397, 2057
 	
 	-- 종료하기
 	local exit_button = display.newImage("img/fail_background/out.png", display.contentWidth, display.contentHeight)
 	exit_button.x, exit_button.y = 1042, 2058
	
	-- 실패 소리
	local fail_page = audio.loadSound("sound/fail_page.mp3")
	audio.play(fail_page, {channel=3})

	audio.setVolume( 0, { channel=2 } ) 
	audio.setVolume( 1, { channel=3 } ) 

	-- 시작 버튼 이벤트
	local function restart_button_event( event )  
 		if( event.phase == "began" ) then  
			audio.setVolume( 0.3, { channel=2 } )
			audio.rewind( { channel=2 } ) 
			audio.setVolume( 0, { channel=3 } ) 
 			composer.gotoScene( "game1" )
 		end  
 	end
	-- 팝업 닫기 이벤트 적용
	restart_button:addEventListener("touch", restart_button_event)


	-- 종료 버튼 이벤트
	 local function out_button(event)
		native.requestExit()
 	end
 	exit_button:addEventListener("tap", out_button)

	 --------------------------------------------------------------------------------------------------------------------

	  sceneGroup:insert(background)
	  sceneGroup:insert(restart_button)
	  sceneGroup:insert(exit_button)

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
		composer.removeScene('fail')
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