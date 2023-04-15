-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	------ 변수 설정 ------
	-- 배경
	local background = display.newImage("img/main_background.png",display.contentCenterX, display.contentCenterY)
	--local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
	-- 선택 재료 칸
	local box = display.newImage("img/main/what_I_choose.png", display.contentCenterX, display.contentCenterY)
	box.x = box.x - 156
	box.y = box.y - 986
	-- 만들기 버튼
	local makeButton = display.newImage("img/main/button/make.png", display.contentCenterX, display.contentCenterY)
	makeButton.x = 1232
	makeButton.y = 303
	--픽업대 화살표
	local arrow = display.newImage("img/main/arrow.png", display.contentCenterX, display.contentCenterY)
	arrow.x = 1134
	arrow.y = 1610
	-- 쓰레기 통
	local trash = display.newImage("img/main/trash.png", display.contentCenterX, display.contentCenterY)
	trash.x, trash.y = 470, 924
	local stopGroup = display.newGroup()
	-- 일시정지 버튼
	local pause = display.newImage(stopGroup, "img/main/pause.png", display.contentCenterX, display.contentCenterY)
	pause.x, pause.y = 115, 75
	pause.alpha = 0
	-- 시간 멈춤 여부
	local timestop = 0
	-- 일시정지 팝업
	local stop_background 
	stop_background = display.newImage(stopGroup, "img/stop_background/background.png", display.contentCenterX, display.contentCenterY)
	stop_background.x, stop_background.y = display.contentWidth/2, display.contentHeight/2
	stop_background.alpha = 0
	-- 일시정지 타이블
	local pauseTitle = display.newImage(stopGroup, "img/stop_background/pause.png", display.contentCenterX, display.contentCenterY)
	pauseTitle.alpha = 0
	-- 재생 버튼
	local continue = display.newImage(stopGroup, "img/stop_background/continue.png", display.contentCenterX, display.contentCenterY)
	continue.y = 1723
	continue.alpha = 0
	-- 물 버튼
	local waterB = display.newImage("img/recipe/water.png", display.contentCenterX, display.contentCenterY)
	waterB.x = 257
	waterB.y = 681
	-- 우유 버튼
	local milkB = display.newImage("img/recipe/milk.png",display.contentCenterX, display.contentCenterY)
	milkB.x = 257
	milkB.y = 882
	-- 시럽 버튼
	local syrupB = display.newImage("img/recipe/syrup.png", display.contentCenterX, display.contentCenterY)
	syrupB.x = 257
	syrupB.y = 1080
	-- 에스프레소 버튼
	local espressoB = display.newImage("img/recipe/espresso.png", display.contentCenterX, display.contentCenterY)
	espressoB.x = 587
	espressoB.y = 710
	-- 얼음 버튼
	local iceB = display.newImage("img/recipe/ice.png",display.contentCenterX, display.contentCenterY)
	iceB.x = 861
	iceB.y = 710
	-- 초코 버튼
	local chocoB = display.newImage("img/recipe/choco.png", display.contentCenterX, display.contentCenterY)
	chocoB.x = 1200
	chocoB.y = 720
	-- 딸기 버튼
	local strawberryB = display.newImage("img/recipe/strawberry.png", display.contentCenterX, display.contentCenterY)
	strawberryB.x = 1200
	strawberryB.y = 930
	-- 바나나 버튼 
	local bananaB = display.newImage("img/recipe/banana.png", display.contentCenterX, display.contentCenterY)
	bananaB.x = 1200
	bananaB.y = 1141
	-- 블루베리 버튼
	local blueberryB = display.newImage("img/recipe/blueberry.png", display.contentCenterX, display.contentCenterY)
	blueberryB.x = 1200
	blueberryB.y = 1370
	blueberryB.alpha = 0
	--물
	local water = display.newImageRect("img/recipe/water.png", 176, 178)
	water.x = 220
	water.y = 290
	water:toBack()
	--우유
	local milk = display.newImage("img/recipe/milk.png", display.contentCenterX, display.contentCenterY)
	milk.y = 290
	milk:toBack()
	--시럽
	local syrup = display.newImage("img/recipe/syrup.png", display.contentCenterX, display.contentCenterY)
	syrup.y = 290
	syrup:toBack()
	--에스프레소
	local espresso = display.newImageRect("img/recipe/espresso.png", 210, 142)
	espresso.x = 220
	espresso.y = 290
	espresso:toBack()
	--얼음
	local ice = display.newImageRect("img/recipe/ice.png", 210, 159)
	ice.x = 220
	ice.y = 290
	ice:toBack()
	--초코
	local choco = display.newImage("img/recipe/choco.png", display.contentCenterX, display.contentCenterY)
	choco.y = 290
	choco:toBack()
	--딸기
	local strawberry = display.newImage("img/recipe/strawberry.png", display.contentCenterX, display.contentCenterY)
	strawberry.y = 290
	strawberry:toBack()
	--바나나 (임시 딸기 이미지 사용)
	local banana = display.newImage("img/recipe/banana.png", display.contentCenterX, display.contentCenterY)
	banana.y = 290
	banana:toBack()
	--블루베리
	local blueberry = display.newImage("img/recipe/blueberry.png", display.contentCenterX, display.contentCenterY)
	blueberry.y = 290
	blueberry:toBack()
	--아메리카노 (추후 알맞은 이미지로 대체)
	local americano = display.newImage("img/recipe/americano.png", display.contentCenterX, display.contentCenterY)
	americano.x = americano.x + 200
	americano.alpha = 0
	americano:toBack()
	--바닐라라떼 (추후 알맞은 이미지로 대체)
	local latte = display.newImage("img/recipe/vanilla_latte.png", display.contentCenterX, display.contentCenterY)
	latte.x = latte.x + 200
	latte.alpha = 0
	latte:toBack()
	--카페모카 (추후 알맞은 이미지로 대체)
	local mocha = display.newImage("img/recipe/cafe_moca.png", display.contentCenterX, display.contentCenterY)
	mocha.x = mocha.x + 200
	mocha.alpha = 0
	mocha:toBack()
	--딸기 스무디 (추후 알맞은 이미지로 대체)
	local smoothie_s = display.newImage("img/recipe/strawberry_smoothie.png", display.contentCenterX, display.contentCenterY)
	smoothie_s.x = smoothie_s.x + 200
	smoothie_s.alpha = 0
	smoothie_s:toBack()
	--바나나 스무디 (추후 알맞은 이미지로 대체)
	local smoothie_ba = display.newImage("img/recipe/banana_smoothie.png", display.contentCenterX, display.contentCenterY)
	smoothie_ba.x = smoothie_ba.x + 200
	smoothie_ba:toBack()
	smoothie_ba.alpha = 0
	--블루베리 스무디 (추후 알맞은 이미지로 대체)
	local smoothie_b = display.newImage("img/recipe/blueberry_smoothie.png", display.contentCenterX, display.contentCenterY)
	smoothie_b.x = smoothie_b.x + 200
	smoothie_b:toBack()
	smoothie_b.alpha = 0
	--딸기바나나 스무디 (추후 알맞은 이미지로 대체)
	local smoothie_sb = display.newImage("img/main/drink/smoothie_img.png", display.contentCenterX, display.contentCenterY)
	smoothie_sb.x = smoothie_sb.x + 200
	smoothie_sb:toBack()
	smoothie_sb.alpha = 0
	-- 재료 팝업 위한 변수 (selected[i]로 담겨진거 구분)
	------- 물: 1 / 우유: 2 / 시럽: 3
	------- 에스프레소: 4 / 얼음: 5
	------- 초코: 6 / 딸기: 7 / 바나나: 8 / 블루베리: 9
	local selected = {}
	for i = 1, 4 do
		selected[i] = 0
	end
	--설정된 음료 구분
	------- 아메리카노: 1 / 바닐라라떼: 2 / 카페모카: 3
	------- 딸기스무디: 4 / 바나나스무디: 5 
	------- 딸기바나나스무디: 6
	local drinkMade = 0
	--숫자 세는 변수
	local cntNum
	-- 문 오픈 여부
	local doorOpen = 0
	--팝업 닫았는지 여부
	local popupClose = 0
	--레시피 닫았는지 여부
	local recipeClose = 1
	--특별한 손님 등장
	local specialCustomer = 0
	--특별한 메뉴 
	local specialCnt = 0
	--특별한 손님 특별한 메뉴 제공 성공
	local specialSuccess2 = 0
	composer.setVariable("specialSuccess2", specialSuccess2)
	-- 성공 소요 시간 합산
	local secondDay = 0
	------------------------------------
	-- 문
	local door = display.newImage("img/main/button/door.png")
 	door.x = 52
 	door.y = 2162
 	------------------------------------
 	-- 손님
 	local customer = {} 					-- 손님 배열로 화면의 왼쪽부터 차례대로 1, 2, 3번. 
	local customerGroup = display.newGroup()
	local success = 0						-- 게임 성공 횟수.
	local fail = 0							-- 게임 실패 횟수.
	local pickMenu = 0
	local drinkImage = {"americano", "vanilla_latte", "cafe_moca", "strawberry_smoothie", "banana_smoothie", "smoothie_img"}	-- 음료 이미지 주소. 나중에 모든 음료 이미지가 완성되면 수정 및 추가가 필요합니다. (랜덤 함수를 활용하기 위한 변수입니다.)
	local customerImage = {"customer1", "customer2", "customer3", "customer4"}					-- 손님 이미지 주소. 나중에 모든 손님 이미지가 완성되면 수정 및 추가가 필요합니다. (랜덤 함수를 활용하기 위한 변수입니다.)
	local timeBar = nil						-- 음료 위에 표시되는 시간 제한 바.
	local count = 0							-- 시간 제한 카운트 변수.
	local menu = nil						-- 손님 위에 표시되는 음료 이미지.
	local dialog = nil						-- 손님이 음료를 요구하는 대화창 이미지.
	local bar = nil							-- 진행상황 이미지.
	local timeAttack
 	------------------------------------
	--제조성공시 점수
	local score_s = display.newText("성공 : " .. 0 .. " /  10", 660, 660) --성공시 점수
	score_s.x = 410
	score_s.y = 520
	score_s.size = 80
	score_s:setFillColor(0)
	--score_s.alpha = 0.5
	--성공주문수
	local order_success = display.newImage("img/main/success_count.png", display.contentCenterX, display.contentCenterY)
	order_success.x = order_success.x - 322
	order_success.y = order_success.y - 763
	--제조 실패시 점수
	local score_f = display.newText("실패 : " .. 0 .. " /  5", 660, 660) --성공시 점수
	score_f.x = 1056
	score_f.y = 520
	score_f.size = 80
	score_f:setFillColor(0)
	--score_f.alpha = 0.5
	--실패 주문 수
	local order_fail = display.newImage("img/main/success_count.png", display.contentCenterX, display.contentCenterY)
	order_fail.x = order_fail.x + 327
	order_fail.y = order_fail.y - 763
 	------------------------------------
 	local group = display.newGroup()
	local tableGroup = display.newGroup()
	-- 레시피 북 이미지 삽입
 	local recipe = display.newImage(group, 'img/main/button/recipe_book.png')
	recipe.x, recipe.y = 253, 1444
	recipe.alpha = 1
	-- 팝업 이미지1 삽입 (배경 설명)
	local popup = display.newImage(group, "img/main_popup/popup_secondday.png")
 	popup.x, popup.y = 725, 1908
	popup.alpha = 1
	-- 팝업 이미지2 삽입 (게임방법 설명)
	--local popup2 = display.newImage(group, "img/main_popup/popup2.png")
 	--popup2.x, popup2.y = 725, 1908
	--popup2.alpha = 0
	-- 팝업 버튼 이미지 삽입
	local popup_button = display.newImage(group, "img/main_popup/popup_button.png")
 	popup_button.x, popup_button.y = 1154, 2149
	popup_button.alpha = 1
 	------------------------------------
	-- 레시피 팝업 이미지 삽입 
	tableGroup.alpha = 0
	local recipe_popup 
	recipe_popup = display.newImage(tableGroup, "img/recipe_background2.png", display.contentCenterX, display.contentCenterY)
	recipe_popup.x, recipe_popup.y = display.contentWidth/2, display.contentHeight/2
	--레시피 닫기 이미지 삽입
	local recipe_x
	recipe_x = display.newImage(tableGroup, "img/recipe/recipe_out.png")
	recipe_x.x, recipe_x.y = 1282, 182
	--재료 이미지 삽입
	local in_table = {}
	local line = {}
	local drink = {}
	local ingredient = {}
	----효과음
	--재료 클릭 시 
	local ingred_clink = audio.loadSound("sound/ingred_click.mp3")
	-- 만들기 버튼
	local make_button_click = audio.loadSound("sound/make_button_click_trash_can.mp3")
	-- 음료 건넸을 때
	local coffee_down = audio.loadSound("sound/new_somsom_in.mp3")
	-- 레시피 북 열기
	local recipebook_open = audio.loadSound("sound/recipebook_open.mp3")
	-- 레시피 북 닫기
	local recipebook_close = audio.loadSound("sound/recipebook_close.mp3")
-----------------------------------------------------------

	sceneGroup:insert(water)
	sceneGroup:insert(milk)
	sceneGroup:insert(syrup)
	sceneGroup:insert(espresso)
	sceneGroup:insert(ice)
	sceneGroup:insert(choco)
	sceneGroup:insert(strawberry)
	sceneGroup:insert(banana)
	sceneGroup:insert(blueberry)
	sceneGroup:insert(americano)
	sceneGroup:insert(latte)
	sceneGroup:insert(mocha)
	sceneGroup:insert(smoothie_s)
	sceneGroup:insert(smoothie_ba)
	--sceneGroup:insert(smoothie_b)
	sceneGroup:insert(background)
	sceneGroup:insert(box)
	sceneGroup:insert(makeButton)
	sceneGroup:insert(arrow)
	sceneGroup:insert(order_success)
	sceneGroup:insert(order_fail)
	sceneGroup:insert(waterB)
	sceneGroup:insert(milkB)
	sceneGroup:insert(syrupB)
	sceneGroup:insert(espressoB)
	sceneGroup:insert(iceB)
	sceneGroup:insert(chocoB)
	sceneGroup:insert(strawberryB)
	sceneGroup:insert(bananaB)
	sceneGroup:insert(blueberryB)
	sceneGroup:insert(score_s)
	sceneGroup:insert(score_f)
	sceneGroup:insert(trash)
	sceneGroup:insert(door)
	sceneGroup:insert(group)
	sceneGroup:insert(tableGroup)
	sceneGroup:insert(stopGroup)
-----------------------------------------------------------

--------------------일시정지------------------------------

	local function stop( event )
		if( event.phase == "began") then 
			if timestop == 0 then
				audio.play(make_button_click, {channel=1})
				recipeClose = 0
				recipe.alpha = 0
 				timer.pause(timeAttack)
				timestop = 1
				--타임바 안보이게
				if timeBar ~= nil then
					timeBar.alpha = 0
				end
				--손님 안 보이게
				customerGroup.alpha = 0
				--음료 안 보이게
				if menu ~= nil then
					menu.alpha = 0
					dialog.alpha = 0
					bar.alpha = 0
				end
				pause.alpha = 0

				stop_background.alpha = 1
				pauseTitle.alpha = 1
				continue.alpha = 1
				-- 맨 앞에 출력 되게
				stopGroup:toFront()
			end	
		end
	 end
pause:addEventListener("touch", stop)

--------------------계속하기------------------------------

	local function keep( event )
		if( event.phase == "began") then 
			if timestop == 1 then
				audio.play(make_button_click, {channel=1})
				recipeClose = 1
				timer.resume(timeAttack)
				timestop = 0
				recipe.alpha = 1
				--타임바 보이게
				if timeBar ~= nil then
					timeBar.alpha = 1
				end
				--닫을 때 손님 다시 보이게
				customerGroup.alpha = 1
				--닫을 때 음료 다시 보이게
				if menu ~= nil then
					menu.alpha = 1
					dialog.alpha = 1
					bar.alpha = 1
				end
				pause.alpha = 1

				stop_background.alpha = 0
				pauseTitle.alpha = 0
				continue.alpha = 0
			end	
		end
	 end
continue:addEventListener("touch", keep)


----------------------팝업 닫기-----------------------------
	-- 팝업 닫기 이벤트
	local function popupOff( event )  
 		if( event.phase == "began") then 
			audio.play(ingred_clink, {channel=1})
			if(popup.alpha == 1) then
 				popup.alpha = 0
				popup_button.alpha = 0
				--팝업 내려야 문 열림 확인 변수
				popupClose = 1
			end
 		end  
 	end
	 
	-- 팝업 닫기 이벤트 적용
	popup_button:addEventListener("touch", popupOff)

----------------------레시피북 열기/닫기---------------------
	--레시피 북 클릭 구현
	function recipe:tap( event )
		--레시피 엶
		recipeClose = 0
		pause.alpha = 0
		audio.play(recipebook_open, {channel=1})
		--타임바 안보이게
		if timeBar ~= nil then
			timeBar.alpha = 0
		end
		tableGroup.alpha = 1
		-- 맨 앞에 출력 되게
		tableGroup:toFront()
		--레시피 닫기 이벤트
		local function recipe_off( event )  
 			if( event.phase == "began" ) then  
				audio.play(recipebook_close, {channel=1})
				--레시피 닫음
				recipeClose = 1
				if doorOpen == 1 then
					pause.alpha = 1
				end
				--타임바 보이게
				if timeBar ~= nil then
					timeBar.alpha = 1
				end
				-- 문 안 보이게
				door.alpha = 0
				--닫을 때 손님 다시 보이게
				customerGroup.alpha = 1
				--닫을 때 음료 다시 보이게
				if menu ~= nil then
					menu.alpha = 1
				end
				tableGroup.alpha = 0
				-- 문 보이게
				door.alpha = 1
	 		end  
		end
	 
		-- 레시피 닫기 이벤트 적용
		recipe_x:addEventListener("touch", recipe_off)
	end

	recipe:addEventListener("tap", recipe)


----------------------10초 타이머---------------------------

 	--- 시간 제한 카운터 함수.
	local function counter( event )		
		count = count + 1

		if timeBar == nil then 				-- 시간 소요를 나타내는 바 생성. 시간이 지날 수록 바의 크기가 줄어들게 설정했습니다. (10초)
			timeBar = display.newRect(836, 1594, 353 - 35.3*count, 64)
			sceneGroup:insert(timeBar)
			bar:toFront()
		elseif count == 10 then
			timeBar.width, timeBar.x = 340 - 35.3, 836 
		else
			timeBar.width, timeBar.x = 353 - 35.3 * (count + 1), 836 - 16 * count
		end

		timeBar:setFillColor(1, 0, 0, 1)		-- 바의 색깔은 빨강색으로 했습니다. 

		print("count: " .. count)
		if count == 10 then
			count = 0						-- 10초가 지났기 때문에 count를 다시 0으로 바꿉니다. (0초부터 다시 세기)
			fail = fail + 1					-- 타임 아웃으로 실패 횟수 늘립니다. 
			-- 5번 실패 시 이동
 			score_f.text = "실패 : " .. fail .. " /  5"
			if (fail == 5) then
				timeBar.alpha = 0
				composer.gotoScene('fail')
			end
			print("성공 횟수: " .. success)
			print("실패 횟수: " .. fail)
			newCustomerEnter()				-- 타임 아웃 후 새 손님을 받습니다. 
		end
	end


----------------------주문 랜덤 생성 ------------------------

	--- 메뉴를 랜덤으로 생성합니다. 현재는 이미지가 coffee와 smoothie 총 2개라 랜덤을 2로 돌렸습니다. 
	local function orderMenu() 				
		if menu ~= nil then					-- 음료 이미지가 이미 화면에 있다면 이를 먼저 지우고 시작합니다. 
			display.remove(menu)
		end

		if dialog == nil and bar == nil then	-- 대화창 이미지와 시간제한 이미지가 화면에 생성되어 있지 않다면 먼저 생성하고 시작합니다. 
			dialog = display.newImage("img/main/talk_space/demand.png")
			dialog.x, dialog.y = 835, 1729

			bar = display.newImage("img/main/talk_space/time_limit.png")
			bar.x, bar.y = 836, 1594

			sceneGroup:insert(dialog)
			sceneGroup:insert(bar)
			timeAttack = timer.performWithDelay(1000, counter, 11)
		elseif success < 10 and fail < 5 then									-- 성공 횟수와 실패 횟수가 각각 20번, 5번 미만이라면 타이머를 시작합니다. (게임 종료 시 타이머 기능을 사용하지 않기 위해서 조건문 사용.)
			timeAttack = timer.performWithDelay(1000, counter, 10)			-- 10초 카운트 시작 
		end


		pickMenu = math.random(5) 		-- 음료 이미지가 추가되면 수정이 필요합니다. (음료 이미지 개수로 수정해야 함.)
		
		print("고른 음료: " .. pickMenu)

		-- 커피류 음료와 스무디류 음료의 이미지 크기가 다르기 때문에 위치를 따로 잡아줬습니다. 
		if pickMenu == 4 or pickMenu == 5 then					-- 스무디류 음료를 뽑았을 때. 나중에 음료 이미지가 추가되면 수정이 필요합니다.(drinkImage array의 스무디류 인덱스 추가.)
			menu = display.newImageRect("img/recipe/"..drinkImage[pickMenu]..".png", 100, 199)
			menu.x, menu.y = 836, 1733
		else									-- 커피류 음료를 뽑았을 때. 
			menu = display.newImageRect("img/recipe/"..drinkImage[pickMenu]..".png", 155, 192)
			menu.x, menu.y = 836, 1733
		end

		sceneGroup:insert(menu)

		--레시피 열었을 때 안보이게 생성
		if recipeClose ~= 1 then
			menu.alpha = 0
		end
	end


------------------손님 이동----------------------------------

	-- 새 손님 넣기. 음료 제조에 성공했을 때에도 newCustomerEnter 함수를 호출해야 합니다. 
	function newCustomerEnter() 
		local pickCustomer
		-- 효과음
		audio.play(coffee_down, {channel=1})
		-- 스페셜 손님 온지 얼마나 지났는지 확인용
		if specialCustomer == 1 then
			specialCnt = specialCnt + 1
		end

		-- 3번 칸에 손님 이미지가 있다면 이를 먼저 지웁니다. 
		if customer[3] ~= null then			
			display.remove(customer[3])
		end
			
		-- 2번 칸에 있던 손님 이미지를 3번 칸 위치로 옮기고 customer[3]이 3번 칸으로 이동된 customer[2]를 가리키게 합니다. 
		customer[2].x, customer[2].y = 1140, 2124	
		customer[3] = customer[2]
		--3번째 손님 스르르 사라짐
		transition.fadeOut(customer[3], {time = 1500})	

		-- 1번 칸에 있던 손님 이미지를 2번 칸 위치로 옮기고 customer[2]가 2번 칸으로 이동된 customer[1]을 가리키게 합니다. 
		customer[1].x, customer[1].y = 750, 2124
		customer[2] = customer[1]

		-- 특별한 손님 유뮤
		if success == 7 and specialCustomer == 0 then
			specialCustomer = 1
			customer[1] = display.newImage(customerGroup, "img/main/character/customer.png")
		else	
			pickCustomer = math.random(4)		-- 나중에 손님 이미지가 추가되면 수정이 필요합니다. (손님 이미지 개수로 수정해야 함.)
			customer[1] = display.newImage(customerGroup, "img/main/character/"..customerImage[pickCustomer]..".png")
		end
		customer[1].x, customer[1].y = 355, 2124

		sceneGroup:insert(customerGroup)

		--레시피 열었을 때 안보이게 생성
		if recipeClose ~= 1 then
			customerGroup.alpha = 0
		end
		orderMenu()
	end


------------------문 클릭시 손님 등장----------------------------------

 	--- 문을 클릭하면 손님 2명의 이미지가 화면에 나타남
 	local function tapEventListener( event )
 		--문 이미 열었는지 여부
 		if doorOpen == 0 then
	 		if popupClose == 1 then
	 			--효과음
				audio.play(coffee_down, {channel=1})
		 		doorOpen = 1
				pause.alpha = 1

		 		customer[1] = display.newImage(customerGroup, "img/main/character/customer1.png", display.contentCenterX, display.contentCenterY)
		 		customer[1].x , customer[1].y = 355, 2124
		 		customer[2] = display.newImage(customerGroup, "img/main/character/customer2.png", display.contentCenterX, display.contentCenterY)
		 		customer[2].x , customer[2].y = 750, 2124

				-- 메뉴를 받기 전 손님 2명을 먼저 받아야 합니다. (손님 이미지 2개 화면에 추가)
				orderMenu()				-- 처음 손님이 들어온 후 메뉴를 주문합니다. 

				sceneGroup:insert(customerGroup)
			end
		end
 	end

 	door:addEventListener("tap",tapEventListener)



--------------재료 선택 및 취소---------------------------
	-- 물 선택 버튼
	local function water_button(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			cntNum = 0
			for i = 1, 4 do
				if selected[i] == 1 then
					cntNum = cntNum + 1
				end
			end
			if cntNum == 0 then
				for i = 1, 4 do
					if selected[i] == 0 then
						selected[i] = 1
						water:toFront()
						if i == 1 then
							water.x = 220
						elseif i == 2 then
							water.x = 440
						elseif i == 3 then
							water.x = 660
						elseif i == 4 then
							water.x = 880
						end
						break
					end
				end
			end
		end
	end
	waterB:addEventListener("tap", water_button)
	
	-- 물 선택 취소
	local function water_delete(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			for i = 1, 5 do
				if selected[i] == 1 then
					selected[i] = 0
					water:toBack()
					break
				end
			end
		end
	end
	water:addEventListener("tap", water_delete)


	-- 우유 선택 버튼
	local function milk_button(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			cntNum = 0
			for i = 1, 4 do
				if selected[i] == 2 then
					cntNum = cntNum + 1
				end
			end
			if cntNum == 0 then
				for i = 1, 4 do
					if selected[i] == 0 then
						selected[i] = 2
						milk:toFront()
						if i == 1 then
							milk.x = 220
						elseif i == 2 then
							milk.x = 440
						elseif i == 3 then
							milk.x = 660
						elseif i == 4 then
							milk.x = 880
						end
						break
					end
				end
			end
		end
	end
	milkB:addEventListener("tap", milk_button)
	
	-- 우유 선택 취소
	local function milk_delete(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			for i = 1, 5 do
				if selected[i] == 2 then
					selected[i] = 0
					milk:toBack()
					break
				end
			end
		end
	end
	milk:addEventListener("tap", milk_delete)


	-- 시럽 선택 버튼
	local function syrup_button(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			cntNum = 0
			for i = 1, 4 do
				if selected[i] == 3 then
					cntNum = cntNum + 1
				end
			end
			if cntNum == 0 then
				for i = 1, 4 do
					if selected[i] == 0 then
						selected[i] = 3
						syrup:toFront()
						if i == 1 then
							syrup.x = 220
						elseif i == 2 then
							syrup.x = 440
						elseif i == 3 then
							syrup.x = 660
						elseif i == 4 then
							syrup.x = 880
						end
						break
					end
				end
			end
		end
	end
	syrupB:addEventListener("tap", syrup_button)
	
	-- 시럽 선택 취소
	local function syrup_delete(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			for i = 1, 5 do
				if selected[i] == 3 then
					selected[i] = 0
					syrup:toBack()
					break
				end
			end
		end
	end
	syrup:addEventListener("tap", syrup_delete)

	
	-- 에스프레소 선택 버튼
	local function espresso_button(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			cntNum = 0
			for i = 1, 4 do
				if selected[i] == 4 then
					cntNum = cntNum + 1
				end
			end
			if cntNum == 0 then
				for i = 1, 4 do
					if selected[i] == 0 then
						selected[i] = 4
						espresso:toFront()
						if i == 1 then
							espresso.x = 220
						elseif i == 2 then
							espresso.x = 440
						elseif i == 3 then
							espresso.x = 660
						elseif i == 4 then
							espresso.x = 880
						end
						break
					end
				end
			end
		end
	end
	espressoB:addEventListener("tap", espresso_button)
	
	-- 에스프레소 선택 취소
	local function espresso_delete(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			for i = 1, 5 do
				if selected[i] == 4 then
					selected[i] = 0
					espresso:toBack()
					break
				end
			end
		end
	end
	espresso:addEventListener("tap", espresso_delete)


	-- 얼음 선택 버튼
	local function ice_button(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			cntNum = 0
			for i = 1, 4 do
				if selected[i] == 5 then
					cntNum = cntNum + 1
				end
			end
			if cntNum == 0 then
				for i = 1, 4 do
					if selected[i] == 0 then
						selected[i] = 5
						ice:toFront()
						if i == 1 then
							ice.x = 220
						elseif i == 2 then
							ice.x = 440
						elseif i == 3 then
							ice.x = 660
						elseif i == 4 then
							ice.x = 880
						end
						break
					end
				end
			end
		end
	end
	iceB:addEventListener("tap", ice_button)
	
	-- 얼음 선택 취소
	local function ice_delete(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			for i = 1, 5 do
				if selected[i] == 5 then
					selected[i] = 0
					ice:toBack()
					break
				end
			end
		end
	end
	ice:addEventListener("tap", ice_delete)


	-- 초코 선택 버튼
	local function choco_button(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			cntNum = 0
			for i = 1, 4 do
				if selected[i] == 6 then
					cntNum = cntNum + 1
				end
			end
			if cntNum == 0 then
				for i = 1, 4 do
					if selected[i] == 0 then
						selected[i] = 6
						choco:toFront()
						if i == 1 then
							choco.x = 220
						elseif i == 2 then
							choco.x = 440
						elseif i == 3 then
							choco.x = 660
						elseif i == 4 then
							choco.x = 880
						end
						break
					end
				end
			end
		end
	end
	chocoB:addEventListener("tap", choco_button)
	
	-- 초코 선택 취소
	local function choco_delete(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			for i = 1, 5 do
				if selected[i] == 6 then
					selected[i] = 0
					choco:toBack()
					break
				end
			end
		end
	end
	choco:addEventListener("tap", choco_delete)


	-- 딸기 선택 버튼
	local function strawberry_button(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			cntNum = 0
			for i = 1, 4 do
				if selected[i] == 7 then
					cntNum = cntNum + 1
				end
			end
			if cntNum == 0 then
				for i = 1, 4 do
					if selected[i] == 0 then
						selected[i] = 7
						strawberry:toFront()
						if i == 1 then
							strawberry.x = 220
						elseif i == 2 then
							strawberry.x = 440
						elseif i == 3 then
							strawberry.x = 660
						elseif i == 4 then
							strawberry.x = 880
						end
						break
					end
				end
			end
		end
	end
	strawberryB:addEventListener("tap", strawberry_button)
	
	-- 딸기 선택 취소
	local function strawberry_delete(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			for i = 1, 5 do
				if selected[i] == 7 then
					selected[i] = 0
					strawberry:toBack()
					break
				end
			end
		end
	end
	strawberry:addEventListener("tap", strawberry_delete)


	-- 바나나 선택 버튼
	local function banana_button(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			cntNum = 0
			for i = 1, 4 do
				if selected[i] == 8 then
					cntNum = cntNum + 1
				end
			end
			if cntNum == 0 then
				for i = 1, 4 do
					if selected[i] == 0 then
						selected[i] = 8
						banana:toFront()
						if i == 1 then
							banana.x = 220
						elseif i == 2 then
							banana.x = 440
						elseif i == 3 then
							banana.x = 660
						elseif i == 4 then
							banana.x = 880
						end
						break
					end
				end
			end
		end
	end
	bananaB:addEventListener("tap", banana_button)
	
	-- 바나나 선택 취소
	local function banana_delete(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			for i = 1, 5 do
				if selected[i] == 8 then
					selected[i] = 0
					banana:toBack()
					break
				end
			end
		end
	end
	banana:addEventListener("tap", banana_delete)


	-- 블루베리 선택 버튼
	local function blueberry_button(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			cntNum = 0
			for i = 1, 4 do
				if selected[i] == 9 then
					cntNum = cntNum + 1
				end
			end
			if cntNum == 0 then
				for i = 1, 4 do
					if selected[i] == 0 then
						selected[i] = 9
						blueberry:toFront()
						if i == 1 then
							blueberry.x = 220
						elseif i == 2 then
							blueberry.x = 440
						elseif i == 3 then
							blueberry.x = 660
						elseif i == 4 then
							blueberry.x = 880
						end
						break
					end
				end
			end
		end
	end
	blueberryB:addEventListener("tap", blueberry_button)
	
	-- 블루베리 선택 취소
	local function blueberry_delete(event)
		if recipeClose == 1 then			--레시피 안열려 있으면
			audio.play(ingred_clink, {channel=1})
			for i = 1, 5 do
				if selected[i] == 9 then
					selected[i] = 0
					blueberry:toBack()
					break
				end
			end
		end
	end
	blueberry:addEventListener("tap", blueberry_delete)
--------------------------------------------------------


--------------만들기 버튼--------------------------------	
	local function make_drink(event)
		if doorOpen == 1 then					--문을 클릭해서 열었다면
			if recipeClose == 1 then			--레시피 안열려 있으면
				if drinkMade == 0 then			--음료 없다면
					audio.play(make_button_click, {channel=1})
					local waterCnt = 0
					local milkCnt = 0
					local syrupCnt = 0
					local espressoCnt = 0
					local iceCnt = 0
					local chocoCnt = 0
					local strawberryCnt = 0
					local bananaCnt = 0
					local blueberryCnt = 0 
					--재료 선택 여부 확인
					for i = 1, 4 do
						if selected[i] == 1 then
							waterCnt = waterCnt + 1
						elseif selected[i] == 2 then
							milkCnt = milkCnt + 1
						elseif selected[i] == 3 then
							syrupCnt = syrupCnt + 1
						elseif selected[i] == 4 then
							espressoCnt = espressoCnt + 1
						elseif selected[i] == 5 then
							iceCnt = iceCnt + 1
						elseif selected[i] == 6 then
							chocoCnt = chocoCnt  + 1 
						elseif selected[i] == 7 then
							strawberryCnt = strawberryCnt + 1
						elseif selected[i] == 8 then
							bananaCnt = bananaCnt + 1
						elseif selected[i] == 9 then
							blueberryCnt = blueberryCnt + 1
						end	
					end
					--아메리카노
					if waterCnt ~= 0 and milkCnt == 0 and syrupCnt == 0 and espressoCnt ~= 0 and iceCnt == 0
					 and chocoCnt == 0 and strawberryCnt == 0 and bananaCnt == 0 and blueberryCnt == 0 then
						drinkMade = 1
						water:toBack()
						espresso:toBack()
						americano:toFront()
						americano.alpha = 1
					end
					--바닐라라떼
					if waterCnt == 0 and milkCnt ~= 0 and syrupCnt ~= 0 and espressoCnt ~= 0 and iceCnt == 0
					 and chocoCnt == 0 and strawberryCnt == 0 and bananaCnt == 0 and blueberryCnt == 0 then
						drinkMade = 2
						milk:toBack()
						syrup:toBack()
						espresso:toBack()
						latte:toFront()
						latte.alpha = 1
					end
					--카페모카
					if waterCnt == 0 and milkCnt ~= 0 and syrupCnt == 0 and espressoCnt ~= 0 and iceCnt == 0
					 and chocoCnt ~= 0 and strawberryCnt == 0 and bananaCnt == 0 and blueberryCnt == 0 then
						drinkMade = 3
						milk:toBack()
						espresso:toBack()
						choco:toBack()
						mocha:toFront()
						mocha.alpha = 1
					end
					--딸기스무디
					if waterCnt == 0 and milkCnt == 0 and syrupCnt ~= 0 and espressoCnt == 0 and iceCnt ~= 0
					 and chocoCnt == 0 and strawberryCnt ~= 0 and bananaCnt == 0 and blueberryCnt == 0 then
						drinkMade = 4
						syrup:toBack()
						ice:toBack()
						strawberry:toBack()
						smoothie_s:toFront()
						smoothie_s.alpha = 1
					end
					--바나나스무디
					if waterCnt == 0 and milkCnt == 0 and syrupCnt ~= 0 and espressoCnt == 0 and iceCnt ~= 0
					 and chocoCnt == 0 and strawberryCnt == 0 and bananaCnt ~= 0 and blueberryCnt == 0 then
						drinkMade = 5
						syrup:toBack()
						ice:toBack()
						banana:toBack()
						smoothie_ba:toFront()
						smoothie_ba.alpha = 1
					end
					--[[
					--블루베리스무디
					if waterCnt == 0 and milkCnt == 0 and syrupCnt ~= 0 and espressoCnt == 0 and iceCnt ~= 0
					 and chocoCnt == 0 and strawberryCnt == 0 and bananaCnt == 0 and blueberryCnt ~= 0 then
						drinkMade = 6
						syrup:toBack()
						ice:toBack()
						blueberry:toBack()
						smoothie_b:toFront()
						smoothie_b.alpha = 1
					end
					]]
					--히든 레시피 (궁극의 딸기바나나 스무디)
					if waterCnt == 0 and milkCnt == 0 and syrupCnt ~= 0 and espressoCnt == 0 and iceCnt ~= 0
					 and chocoCnt == 0 and strawberryCnt ~= 0 and bananaCnt ~= 0 and blueberryCnt == 0 then
						drinkMade = 6
						syrup:toBack()
						ice:toBack()
						strawberry:toBack()
						banana:toBack()
						smoothie_sb:toFront()
						smoothie_sb.alpha = 1
					end
					--초기화
					if drinkMade ~= 0 then
						for i = 1, 4 do
							selected[i] = 0
						end
					end
				end
			end
		end
	end
	makeButton:addEventListener("tap", make_drink)

------------------ 쓰레기통 클릭 시 음료 버림 -----------------------------------------
	local function drink_delete( event )
		if drinkMade ~= 0 then
			audio.play(make_button_click, {channel=1})
			if drinkMade == 1 then
 				drinkMade = 0
 				americano.alpha = 0
 			elseif drinkMade == 2 then
 				drinkMade = 0
 				latte.alpha = 0
 			elseif drinkMade == 3 then
 				drinkMade = 0
 				mocha.alpha = 0
 			elseif drinkMade == 4 then
 				drinkMade = 0
 				smoothie_s.alpha = 0
 			elseif drinkMade == 5 then
 				drinkMade = 0
 				smoothie_ba.alpha = 0
 			--elseif drinkMade == 6 then
 			--	drinkMade = 0
 			--	smoothie_b.alpha = 0
 			elseif drinkMade == 6 then
 				drinkMade = 0
 				smoothie_sb.alpha = 0
 			end
		end
	end
	trash:addEventListener("tap", drink_delete)


------------------음료 건네기-----------------------------------------

	local function catchDrink( event )
	 	if (event.phase == "began") then

	 		display.getCurrentStage():setFocus( event.target )
	 		event.target.isFocus = true
 			-- 드래그 시작할 때
 			event.target.initX = event.target.x
 			event.target.initY = event.target.y
	 	elseif (event.phase == "moved" ) then
	 		if (event.target.isFocus ) then
	 			event.target.x = event.xStart + event.xDelta
	 			event.target.y = event.yStart + event.yDelta

	 		end
	 	elseif (event.phase == "ended" or event.phase == "cancelled" ) then
	 		if (event.target.isFocus ) then
	 			--테이블에 놓으면
	 			if  987 < event.target.x and event.target.x < 1320
 					and 1600 < event.target.y  and event.target.y < 1840 then
					--audio.play(coffee_down, {channel=1})
 					----------- 알맞은/틀린 음료 건네면 성공/실패 카운트
 					if pickMenu == drinkMade and count ~= 10 then
 						-- 소요 시간 더하기
 						secondDay = secondDay + count
 						print("소요 시간: " .. secondDay)
 						success = success + 1
 						--- 20번 성공 시 이동
						score_s.text = "성공 : " .. success .. " /  10"
						if (success == 10) then
							-- 소요 시간 전달
							print("다음날로 이동")
							composer.setVariable( "secondDay", secondDay )
							timeBar:setFillColor(0, 0, 0, 0)
							timeBar.alpha = 0
							timer.cancel(timeAttack)
							composer.gotoScene('clear2')
						end
					----------- 특별한 손님 특별한 메뉴 성공
					elseif specialCnt == 1 and drinkMade == 6 and count ~= 10 then
						--특별한 손님 특별한 메뉴 제공 성공
						specialSuccess2 = 1
						composer.setVariable("specialSuccess2", specialSuccess2)
						-- 소요 시간 더하기
 						secondDay = secondDay + count
 						print("소요 시간: " .. secondDay)
 						success = success + 1
 						--- 20번 성공 시 이동
						score_s.text = "성공 : " .. success .. " /  10"
						if (success == 10) then
							-- 소요 시간 전달
							print("다음날로 이동")
							composer.setVariable( "secondDay", secondDay )
							timeBar:setFillColor(0, 0, 0, 0)
							timeBar.alpha = 0
							timer.cancel(timeAttack) 
							composer.gotoScene('clear2')
						end
 					else
 						fail = fail + 1
 						--- 5번 실패 시 이동
 						score_f.text = "실패 : " .. fail .. " /  5"
						if (fail == 5) then
							timeBar.alpha = 0
							timer.cancel(timeAttack) 
							if timeBar ~= nil then
								timeBar.alpha = 0
							end
							composer.gotoScene('fail')
						end
 					end

 					--타이머 초기화
					timeBar.width, timeBar.x = 340 - 35.3, 836
 					timer.cancel(timeAttack)
 					count = 0
					newCustomerEnter()

					sceneGroup:insert(customerGroup)

					print("성공 횟수: " .. success)
					print("실패 횟수: " .. fail)
 			
 					if drinkMade == 1 then
 						drinkMade = 0
 						americano.alpha = 0
 					elseif drinkMade == 2 then
 						drinkMade = 0
 						latte.alpha = 0
 					elseif drinkMade == 3 then
 						drinkMade = 0
 						mocha.alpha = 0
 					elseif drinkMade == 4 then
 						drinkMade = 0
 						smoothie_s.alpha = 0
 					elseif drinkMade == 5 then
 						drinkMade = 0
 						smoothie_ba.alpha = 0
 					--elseif drinkMade == 6 then
 					--	drinkMade = 0
 					--	smoothie_b.alpha = 0
 					elseif drinkMade == 6 then
 						drinkMade = 0
 						smoothie_sb.alpha = 0
 					end
	 				-- 원래 자리로 돌아감
	 				event.target.x = event.target.initX
 					event.target.y = event.target.initY
	 			else
					audio.play(ingred_clink, {channel=1})
	 				-- 원래 자리로 돌아감
	 				event.target.x = event.target.initX
 					event.target.y = event.target.initY
	 			end

	 		display.getCurrentStage():setFocus(nil)
	 		event.target.isFocus = false
	 		end
	 		display.getCurrentStage():setFocus(nil)
	 		event.target.isFocus = false
	 	end
	 end
	 americano:addEventListener("touch", catchDrink)
	 latte:addEventListener("touch", catchDrink)
	 mocha:addEventListener("touch", catchDrink)
	 smoothie_s:addEventListener("touch", catchDrink)
	 smoothie_ba:addEventListener("touch", catchDrink)
--	 smoothie_b:addEventListener("touch", catchDrink)
	 smoothie_sb:addEventListener("touch", catchDrink)
----------------------------------------------------------------------------


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
		composer.removeScene('game2')
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