-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- Переменная для хранения счета
local tapCount = 0

-- Загрузка фона и установка его в центр
local background = display.newImageRect( "background.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

-- Объект отображающий счет (колличество касаний мяча)
local tapText = display.newText( tapCount, display.contentCenterX, 20, native.systemFont, 40 )
tapText:setFillColor( 0.3, 0.6, 0 )

-- Загрузка платформы и установка ее в центр и ниже на 25 пикселей
local platform = display.newImageRect( "platform.png", 300, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

-- Загрузка шарика в центр, настройка прозрачности
local balloon = display.newImageRect( "balloon.png", 112, 112 )
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8

-- Подключение библиотеки с физическим движком
local physics = require( "physics" )
physics.start()

-- Конветирование изображений в физический объект
physics.addBody( platform, "static" )
physics.addBody( balloon, "dynamic", { radius=50, bounce=0.3 } )

-- Функция касания мяча
local function pushBalloon()
  -- Метод применения импульса к объекту шар
  balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )

  -- При касании мяча переменная увеличивается на 1
  tapCount = tapCount + 1

  -- В атрибут объекта tapText подставоляется обновленная переменная
  tapText.text = tapCount
end

-- Когда проиходит касание, запускается функция pushBalloon
balloon:addEventListener( "tap", pushBalloon )
