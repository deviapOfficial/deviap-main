-- Copyright 2020 - Deviap (deviap.com)
-- Author(s): Sanjay-B(Sanjay), utrain

-- Home (default) page-view

local button = require("devgit:source/libraries/UI/components/primaryButton.lua")
--[[props =
{
	parent
	containerBackgroundColour
	containerBackgroundAlpha
	secondaryColour
	borderWidth
	borderAlpha
	borderInset
}
]]
return function(parent)

	local b = button {
		parent = parent,
		iconId = "plus",
		text = "Primary button"
	}

	b.container.position = guiCoord(0.5, -0, 0.5, -0)

	b.render()

	--[[
    -- Example Button Constructor
    local infoButton = checkBox {
        parent = parent,
        position = guiCoord(0.5, -60, 0.5, -20),
        size = guiCoord(0, 120, 0, 18)
    }

    -- When the button is pressed, say hello!
    --[[infoButton.states.subscribe(function(newState)
        if newState.active then
            print("Hello world!")
        end
    end)]]--
end