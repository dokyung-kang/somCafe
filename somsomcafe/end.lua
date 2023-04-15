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
	local background = display.newImage("img/end_background/background.png", display.contentCenterX, display.contentCenterY)
    --게임종료 (임시로 작게 만듦)
	local out = display.newImage("img/fail_background/out.png", display.contentCenterX, display.contentCenterY)
	out.x = 1042
	out.y = 2350
    --다시하기 (임시로 작게 만듦)
	local retry = display.newImage("img/fail_background/retry.png", display.contentCenterX, display.contentCenterY)
	retry.x = 397
	retry.y = 2350
	--진엔딩 조건 팁
	local gameTip = display.newText("Tip : 함께 노력해서 A+ 를 받아보자!", display.contentCenterX, display.contentCenterY)
	gameTip.size = 70
	gameTip:setFillColor(0)
	gameTip.y = gameTip.y + 750
	--진엔딩 조건 팁 상단
	local gameTipUp = display.newText("", display.contentCenterX, display.contentCenterY)
	gameTipUp.size = 60
	gameTipUp:setFillColor(0)
	gameTipUp.y = gameTipUp.y + 675
	--진엔딩 조건 팁 하단
	local gameTipDown = display.newText("", display.contentCenterX, display.contentCenterY)
	gameTipDown.size = 60
	gameTipDown:setFillColor(0)
	gameTipDown.y = gameTipDown.y + 825
	-- 출력하는 학점
	local grade = display.newText("F", display.contentCenterX, display.contentCenterY)
	grade.size = 100
	grade:setFillColor(0)
	--grade.x = grade.x - 150
	grade.y = grade.y + 550
	--출력하는 평균 시간
	local avgTimeN = display.newText("1.9", display.contentCenterX, display.contentCenterY)
	avgTimeN.size = 100
	avgTimeN:setFillColor(0)
	avgTimeN.y = avgTimeN.y + 400
	-- 타이틀
	local titleImg
	-- 딸기 이미지
	local strawberryImg = display.newImage("img/recipe/strawberry.png", display.contentCenterX, display.contentCenterY)
	strawberryImg.x = 1098
	strawberryImg.y = 1682
	strawberryImg.alpha = 0
	-- 받아오는 평균 소요 시간
	--첫째날
	local firstDay = composer.getVariable("firstDay")
	--둘째날
	local secondDay = composer.getVariable("secondDay")
	--셋째날
	local thirdDay = composer.getVariable("thirdDay")
	-- 받아오는 평균 소요 시간
	local avgTime = 9
	-- 학교 건물 사진
	local schoolImg
	-- 클리어 소리
	local clear_page = audio.loadSound("sound/clear_page.mp3")
	audio.play(clear_page, {channel=3})
	-- 특별한 손님 특별한 음료 성공 여부
	-- 첫째날
	local specialSuccess1 = 0
	-- 둘째날
	local specialSuccess2 = 0
	-- 셋째날
	local specialSuccess3 = 0

	audio.setVolume( 0, { channel=2 } ) 
	audio.setVolume( 1, { channel=3 } ) 


	sceneGroup:insert(background)
	sceneGroup:insert(retry)
	sceneGroup:insert(out)
	sceneGroup:insert(grade)
	sceneGroup:insert(avgTimeN)
	sceneGroup:insert(gameTip)
	sceneGroup:insert(gameTipUp)
	sceneGroup:insert(gameTipDown)
	sceneGroup:insert(strawberryImg)

	-- 특별한 손님 성공 확인
	specialSuccess1 = composer.getVariable("specialSuccess1")
	specialSuccess2 = composer.getVariable("specialSuccess2")
	specialSuccess3 = composer.getVariable("specialSuccess3")

	print("특별한 손님1 성공 확인 유뮤" .. specialSuccess1)
	print("특별한 손님2 성공 확인 유뮤" .. specialSuccess2)
	print("특별한 손님3 성공 확인 유뮤" .. specialSuccess3)

	---- 평균 소요 시간 계산
	avgTime = math.floor((firstDay + secondDay + thirdDay) / 32 * 10) / 10
	print("평균 소요 시간: " .. avgTime)

	--------------------평균 소요 시간에 따른 결과 화면 출력-------------------------------------

	if specialSuccess1 == 1 or specialSuccess2 == 1 or specialSuccess3 == 1 then		-- 특별 음료 제공 성공
		titleImg = display.newImage("img/end_background/thank_you.png", display.contentCenterX, display.contentCenterY)
		titleImg.x = 718
		titleImg.y = 351
		grade.text = '학점 : S++'
		avgTimeN.text = "평균 소요 시간 : "
		avgTimeN.x = avgTimeN.x - 70
		gameTipUp.text = '플레이 해주셔서 감사합니다!'
		gameTip.text = '학점별로 학교의 다양한 위치를 담았습니다.'
		gameTipDown.text = '지금까지 동덕여대 솜솜피움 팀이었습니다'
		gameTip.size = 60
		--추후 수정 필요
		schoolImg = display.newImageRect("img/school/bonguan.jpg", 1200, 900)	-- 궁극의 레시피로 변경
		schoolImg.x = 720
		schoolImg.y = 1080
		sceneGroup:insert(schoolImg)
		sceneGroup:insert(titleImg)
		strawberryImg.alpha = 1
		strawberryImg:toFront()
	else
		if avgTime <= 5 then
			titleImg = display.newImage("img/end_background/end2.png", display.contentCenterX, display.contentCenterY)
			titleImg.x = 718
			titleImg.y = 351
			grade.text = '학점 : A+'
			avgTimeN.text = "평균 소요 시간 : ".. avgTime .. ' 초'
			gameTipUp.text = 'Tip : 이건 김딸기 교수님께서'
			gameTip.text = '제일 좋아하시는 레시피잖아?'
			gameTipDown.text = '교수님께 만들어드리자!'
			gameTip.size = 60
			--추후 수정 필요
			schoolImg = display.newImage("img/school/u_smoothie_recipe.png", display.contentCenterX, display.contentCenterY)	-- 궁극의 레시피로 변경
			schoolImg.x = 720
			schoolImg.y = 1080
			sceneGroup:insert(schoolImg)
			sceneGroup:insert(titleImg)
		elseif avgTime <= 6 then
			titleImg = display.newImage("img/end_background/end.png", display.contentCenterX, display.contentCenterY)
			titleImg.x = 718
			titleImg.y = 351
			grade.text = '학점 : A'		
			avgTimeN.text = "평균 소요 시간 : ".. avgTime .. ' 초'
			--추후 수정 필요
			schoolImg = display.newImageRect("img/school/inmoon.jpg", 1200, 900)	-- 인문관
			schoolImg.x = 720
			schoolImg.y = 1080
			sceneGroup:insert(schoolImg)
			sceneGroup:insert(titleImg)
		elseif avgTime <= 6.5 then
			titleImg = display.newImage("img/end_background/end.png", display.contentCenterX, display.contentCenterY)
			titleImg.x = 718
			titleImg.y = 351
			grade.text = '학점 : B+'
			avgTimeN.text = "평균 소요 시간 : ".. avgTime .. ' 초'
			--추후 수정 필요
			schoolImg = display.newImageRect("img/school/soongin.jpg", 1200, 900)	-- 숭인관
			schoolImg.x = 720
			schoolImg.y = 1080
			sceneGroup:insert(schoolImg)
			sceneGroup:insert(titleImg)
		elseif avgTime <= 7 then
			titleImg = display.newImage("img/end_background/end.png", display.contentCenterX, display.contentCenterY)
			titleImg.x = 718
			titleImg.y = 351
			grade.text = '학점 : B'
			avgTimeN.text = "평균 소요 시간 : ".. avgTime .. ' 초'
			--추후 수정 필요
			schoolImg = display.newImageRect("img/school/music.jpg", 1200, 900)		-- 음악관
			schoolImg.x = 720
			schoolImg.y = 1080
			sceneGroup:insert(schoolImg)
			sceneGroup:insert(titleImg)
		elseif avgTime <= 7.5 then
			titleImg = display.newImage("img/end_background/end.png", display.contentCenterX, display.contentCenterY)
			titleImg.x = 718
			titleImg.y = 351
			grade.text = '학점 : C+'
			avgTimeN.text = "평균 소요 시간 : ".. avgTime .. ' 초'
			--추후 수정 필요
			schoolImg = display.newImageRect("img/school/daehak.jpg", 1200, 900)	-- 대학원
			schoolImg.x = 720
			schoolImg.y = 1080
			sceneGroup:insert(schoolImg)
			sceneGroup:insert(titleImg)
		elseif avgTime <= 8 then
			titleImg = display.newImage("img/end_background/end.png", display.contentCenterX, display.contentCenterY)
			titleImg.x = 718
			titleImg.y = 351
			grade.text = '학점 : C'
			avgTimeN.text = "평균 소요 시간 : ".. avgTime .. ' 초'
			--추후 수정 필요
			schoolImg = display.newImageRect("img/school/yakhak.jpg", 1200, 900)	-- 약학관
			schoolImg.x = 720
			schoolImg.y = 1080
			sceneGroup:insert(schoolImg)
			sceneGroup:insert(titleImg)
		elseif avgTime <= 8.5 then
			titleImg = display.newImage("img/end_background/end.png", display.contentCenterX, display.contentCenterY)
			titleImg.x = 718
			titleImg.y = 351
			grade.text = '학점 : D+'
			avgTimeN.text = "평균 소요 시간 : ".. avgTime .. ' 초'
			--추후 수정 필요
			schoolImg = display.newImageRect("img/school/yeji.jpg", 1200, 900)		-- 예지관
			schoolImg.x = 720
			schoolImg.y = 1080
			sceneGroup:insert(schoolImg)
			sceneGroup:insert(titleImg)
		else
			titleImg = display.newImage("img/end_background/end.png", display.contentCenterX, display.contentCenterY)
			titleImg.x = 718
			titleImg.y = 351
			grade.text = '학점 : D'
			avgTimeN.text = "평균 소요 시간 : ".. avgTime .. ' 초'
			--추후 수정 필요
			schoolImg = display.newImageRect("img/school/baekju.jpg", 1200, 900)	-- 백주년
			schoolImg.x = 720
			schoolImg.y = 1080
			sceneGroup:insert(schoolImg)
			sceneGroup:insert(titleImg)
		end
	end



	local function retry_button(event)
		print("시작화면으로")
		audio.setVolume( 0.3, { channel=2 } ) 
		audio.rewind( { channel=2 } )
		audio.setVolume( 0, { channel=3 } ) 
		composer.gotoScene('start')
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
		composer.removeScene('end')
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