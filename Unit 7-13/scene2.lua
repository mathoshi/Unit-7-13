-----------------------------------------------------------------------------------------
--
-- Created by: Matsuru Hoshi
-- Created on: May 7, 2019
--
-- This file plays with scene 2
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 local function showScene3()

    local options = {
            effect = "fade",
            time = 500
    }
    composer.gotoScene( "scene3", options)
end
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    print("scene2 create")

    local background  = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    background:setFillColor( 1/255, 123/255, 33/255)
    sceneGroup:insert(background)

    local Title = display.newText( "Menu", display.contentCenterX, 50, "Arial", 25)
    Title:setFillColor( 1, 1, 1)
    sceneGroup:insert(Title)

    local startButton = display.newRect( display.contentCenterX, display.contentCenterY, 200, 100)
    sceneGroup:insert(startButton)

    local startText = display.newText( "Start", display.contentCenterX, display.contentCenterY, "Arial", 50)
    startText:setFillColor( 0, 0, 0)
    sceneGroup:insert(startText)
    -- Code here runs when the scene is first created but has not yet appeared on screen
    
    function start( event )
            composer.gotoScene("scene3")
        end

    startButton:addEventListener( "touch", start)

 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

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
