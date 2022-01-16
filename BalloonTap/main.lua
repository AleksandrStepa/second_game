-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Загрузка фона и установка его в центр
local background = display.newImageRect( "background.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

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
