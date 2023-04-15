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


	-- 배경이미지 삽입
	local background = display.newImageRect("img/end_background/background.png", display.contentWidth, display.contentHeight)
 	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	-- 나가기이미지 삽입
	local dev_out = display.newImage("img/recipe/recipe_out.png")
 	dev_out.x, dev_out.y = 1267, 175

	-- 이름 삽입
	local creator = display.newText("CREATOR", display.contentWidth/2, display.contentHeight*0.22)
   creator:setFillColor(0)
   creator.size = 120
   local planner = display.newText("기획", display.contentWidth/2, display.contentHeight*0.32)
   planner:setFillColor(0)
   planner.size = 120
   local name = display.newText("박주희", display.contentWidth/2, display.contentHeight*0.37)
   name:setFillColor(0.4)
   name.size = 120
   local develop = display.newText("개발", display.contentWidth/2, display.contentHeight*0.47)
   develop:setFillColor(0)
   develop.size = 120
   local name1 = display.newText("강도경    송예림    이현아", display.contentWidth/2, display.contentHeight*0.52)
   name1:setFillColor(0.4)
   name1.size = 120
   local name2 = display.newText("박주희    임지수    황지민", display.contentWidth/2, display.contentHeight*0.57)
   name2:setFillColor(0.4)
   name2.size = 120
   local disign = display.newText("디자인", display.contentWidth/2, display.contentHeight*0.67)
   disign:setFillColor(0)
   disign.size = 120
   local name3 = display.newText("김지윤", display.contentWidth/2, display.contentHeight*0.72)
   name3:setFillColor(0.4)
   name3.size = 120


	-- 시작 버튼 이벤트
	local function dev_out_button_event( event )  
 		if( event.phase == "began" ) then  
 			composer.gotoScene( "start" )
 		end  
 	end
	dev_out:addEventListener("touch", dev_out_button_event)
	 
	 --------------------------------------------------------------------------------------------------------------------

	  sceneGroup:insert(background)
	  sceneGroup:insert(creator)
	  sceneGroup:insert(planner)
	  sceneGroup:insert(name)
	  sceneGroup:insert(develop)
	  sceneGroup:insert(name1)
	  sceneGroup:insert(name2)
	  sceneGroup:insert(disign)
	  sceneGroup:insert(name3)
	  sceneGroup:insert(dev_out)

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
		composer.removeScene('dev')
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