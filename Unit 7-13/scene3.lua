-----------------------------------------------------------------------------------------
--
-- Created by: Matsuru Hoshi
-- Created on: May 7, 2019
--
-- This file plays with scene 2
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
local physics = require("physics")
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 local function showScene1()

    local options = {
            effect = "fade",
            time = 500
    }
    composer.gotoScene( "scene1", options)
end
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )

    local sceneGroup = self.view
    print("scene2 create")

    physics.start()
    physics.setGravity(0, 32)

    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

        local background  = display.newRect(  display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    background:setFillColor( 234/255, 123/255, 33/255)
    sceneGroup:insert(background)

    local ground = display.newRect( display.contentCenterX, 500, 500, 40)
    physics.addBody( ground, "static", {
        friction = 0.5,
        bounce = 0.4
        })
    sceneGroup:insert(ground)

    local ball = display.newCircle( display.contentCenterX, display.contentCenterY, 20)
    physics.addBody( ball, "dynamic", {
        friction = 0.5,
        bounce = 0.3
        })
    sceneGroup:insert(ball)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        timer.performWithDelay( 5000, showScene1)
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    print("scene2 hide")
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
    print("scene2 destroy")
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene
