-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local group = display.newGroup()
	local tableGroup = display.newGroup()
	
	--------------------------------------------------------------------------------------------------------------------
	-- 게임 시작 시 팝업 출력 (작업자 : 박주희)        완료

	-- 배경이미지 삽입
	local background = display.newImageRect(group, "img/main_background.png", display.contentWidth, display.contentHeight)
 	background.x, background.y = display.contentWidth/2, display.contentHeight/2


	-- 팝업 이미지1 삽입 (배경 설명)
	local popup = display.newImage(group, "img/main_popup/popup.png")
 	popup.x, popup.y = 735, 2000
	popup.alpha = 1

	-- 팝업 이미지2 삽입 (게임방법 설명)
	local popup2 = display.newImage(group, "img/main_popup/popup2.png")
 	popup2.x, popup2.y = 735, 2000
	popup2.alpha = 0
	 

	-- 팝업 버튼 이미지 삽입
	local popup_button = display.newImage(group, "img/main_popup/popup_button.png")
 	popup_button.x, popup_button.y = 1176, 2242
	popup_button.alpha = 1


	-- 팝업 닫기 이벤트
	local function popupOff( event )  
 		if( event.phase == "began") then 
			if(popup.alpha == 1) then
 				popup.alpha = 0
				popup2.alpha = 1
			else
				popup2.alpha = 0
				popup_button.alpha = 0
			end
 		end  
 	end
	 
	-- 팝업 닫기 이벤트 적용
	popup_button:addEventListener("touch", popupOff)
	 --------------------------------------------------------------------------------------------------------------------


	 	--------------------------------------------------------------------------------------------------------------------
	-- 레시피 팝업 출력 (작업자 : 이현아)

	-- 레시피 북 이미지 삽입
 	local recipe = display.newImage(group, 'img/main/button/recipe_book.png')
	recipe.x, recipe.y = display.contentWidth*0.18, display.contentHeight * 0.55
	recipe.alpha = 1

	-- 레시피 팝업 이미지 삽입 

		tableGroup.alpha = 0

		local recipe_popup 
		recipe_popup = display.newImageRect(tableGroup, "img/recipe_background.png", display.contentWidth, display.contentHeight)
		recipe_popup.x, recipe_popup.y = display.contentWidth/2, display.contentHeight/2

		--레시피 닫기 이미지 삽입
		local recipe_x
		recipe_x = display.newImage(tableGroup, "img/recipe/recipe_out.png")
		recipe_x.x, recipe_x.y = display.contentWidth *0.87, display.contentHeight*0.08

		--재료 이미지 삽입
	 	local in_table = {}
	 	local line = {}
	 	local drink = {}
	 	local ingredient = {}

		-- americano
 		in_table[1] = display.newImage(tableGroup, "img/recipe/ingredient_table.png", display.contentWidth*0.62, display.contentHeight*0.199)
 		line[1] = display.newImage(tableGroup, "img/recipe/line.png", display.contentWidth*0.49, display.contentHeight*0.255)
 		drink[1] = display.newImage(tableGroup, "img/recipe/americano.png", display.contentWidth*0.18, display.contentHeight*0.199)
		ingredient[1] = display.newImage(tableGroup, "img/recipe/espresso.png", display.contentWidth*0.5, display.contentHeight*0.199)
		ingredient[2] = display.newImage(tableGroup, "img/recipe/water.png", display.contentWidth*0.75, display.contentHeight*0.199)
		-- vanilla_latte
		in_table[2] = display.newImage(tableGroup, "img/recipe/ingredient_table.png", display.contentWidth*0.62, display.contentHeight*0.33)
 		line[2] = display.newImage(tableGroup, "img/recipe/line.png", display.contentWidth*0.49, display.contentHeight*0.385)
 		drink[2] = display.newImage(tableGroup, "img/recipe/vanilla_latte.png", display.contentWidth*0.18, display.contentHeight*0.33)
		ingredient[3] = display.newImage(tableGroup, "img/recipe/espresso.png", display.contentWidth*0.45, display.contentHeight*0.33)
		ingredient[4] = display.newImage(tableGroup, "img/recipe/milk.png", display.contentWidth*0.63, display.contentHeight*0.33)
		ingredient[5] = display.newImage(tableGroup, "img/recipe/syrup.png", display.contentWidth*0.8, display.contentHeight*0.33)
		-- cafe_moca
		in_table[3] = display.newImage(tableGroup, "img/recipe/ingredient_table.png", display.contentWidth*0.62, display.contentHeight*0.46)
 		line[3] = display.newImage(tableGroup, "img/recipe/line.png", display.contentWidth*0.49, display.contentHeight*0.51)
 		drink[3] = display.newImage(tableGroup, "img/recipe/vanilla_latte.png", display.contentWidth*0.18, display.contentHeight*0.46)
		ingredient[6] = display.newImage(tableGroup, "img/recipe/espresso.png", display.contentWidth*0.45, display.contentHeight*0.46)
		ingredient[7] = display.newImage(tableGroup, "img/recipe/milk.png", display.contentWidth*0.63, display.contentHeight*0.46)
		ingredient[8] = display.newImage(tableGroup, "img/recipe/choco.png", display.contentWidth*0.8, display.contentHeight*0.46)
		-- blueberry_smoothie
		in_table[4] = display.newImage(tableGroup, "img/recipe/ingredient_table.png", display.contentWidth*0.62, display.contentHeight*0.59)
 		line[4] = display.newImage(tableGroup, "img/recipe/line.png", display.contentWidth*0.49, display.contentHeight*0.64)
 		drink[4] = display.newImage(tableGroup, "img/recipe/blueberry_smoothie.png", display.contentWidth*0.16, display.contentHeight*0.59)
		ingredient[9] = display.newImage(tableGroup, "img/recipe/ice.png", display.contentWidth*0.45, display.contentHeight*0.59)
		ingredient[10] = display.newImage(tableGroup, "img/recipe/blueberry.png", display.contentWidth*0.63, display.contentHeight*0.59)
		ingredient[11] = display.newImage(tableGroup, "img/recipe/syrup.png", display.contentWidth*0.8, display.contentHeight*0.59)
		-- strawberry_smoothie
		in_table[5] = display.newImage(tableGroup, "img/recipe/ingredient_table.png", display.contentWidth*0.62, display.contentHeight*0.715)
 		line[5] = display.newImage(tableGroup, "img/recipe/line.png", display.contentWidth*0.49, display.contentHeight*0.77)
 		drink[5] = display.newImage(tableGroup, "img/recipe/strawberry_smoothie.png", display.contentWidth*0.16, display.contentHeight*0.715)
		ingredient[12] = display.newImage(tableGroup, "img/recipe/ice.png", display.contentWidth*0.45, display.contentHeight*0.715)
		ingredient[13] = display.newImage(tableGroup, "img/recipe/strawberry.png", display.contentWidth*0.63, display.contentHeight*0.715)
		ingredient[14] = display.newImage(tableGroup, "img/recipe/syrup.png", display.contentWidth*0.8, display.contentHeight*0.715)
		-- banna_smoothie
		in_table[6] = display.newImage(tableGroup, "img/recipe/ingredient_table.png", display.contentWidth*0.62, display.contentHeight*0.84)
 		line[6] = display.newImage(tableGroup, "img/recipe/line.png", display.contentWidth*0.49, display.contentHeight*0.895)
 		drink[6] = display.newImage(tableGroup, "img/recipe/banana_smoothie.png", display.contentWidth*0.16, display.contentHeight*0.84)
		ingredient[15] = display.newImage(tableGroup, "img/recipe/ice.png", display.contentWidth*0.45, display.contentHeight*0.84)
		ingredient[16] = display.newImage(tableGroup, "img/recipe/banana.png", display.contentWidth*0.63, display.contentHeight*0.84)
		ingredient[17] = display.newImage(tableGroup, "img/recipe/syrup.png", display.contentWidth*0.8, display.contentHeight*0.84)

	--레시피 북 클릭 구현
	function recipe:tap( event )

		tableGroup.alpha = 1
		--레시피 닫기 이벤트
		local function recipe_off( event )  
 			if( event.phase == "began" ) then  
				tableGroup.alpha = 0
	 		end  
		end
	 
		-- 레시피 닫기 이벤트 적용
		recipe_x:addEventListener("touch", recipe_off)
	end

	recipe:addEventListener("tap", recipe)

	
	 -------------------------------------------------------------------------------------------------------------------
	 sceneGroup:insert(group)
	 sceneGroup:insert(tableGroup)
	
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