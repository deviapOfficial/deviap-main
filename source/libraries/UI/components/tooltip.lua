-- Copyright 2020 - Deviap (deviap.com)
-- Author(s): Sanjay-B(Sanjay)
-- Creates a tooltip instance
local newBaseComponent = require("devgit:source/libraries/UI/components/baseComponent.lua")
local newState = require("devgit:source/libraries/state/main.lua")

local function reducer(state, action)
	--[[
		@description
			Reducers action to a new state
		@parameter
			any, state
			table, action
		@returns
			any, state
	]]
	state = state or {enabled = false}
	local newState = {enabled = state.enabled}

	if action.type == "enable" then
		newState.enabled = true
	elseif action.type == "disable" then
		newState.enabled = false
	end

	return newState
end

return function(props)
	--[[
		@description
			Creates a base component
		@parameter
			table, props
		@returns
			table, component
	]]
	props.text = props.text or ""

	local self = newBaseComponent(props)
	self.container.size = guiCoord(0, 58, 0, 29)
	self.container.backgroundAlpha = 0

	local textBox = core.construct("guiTextBox", {
		name = "textBox",
		parent = self.container,
		active = false
	})

	self.state = newState(reducer)

	self.render = function()
		--[[
			@description
				Renders the component
			@parameter
				nil
			@returns
				nil
        ]]

		textBox.size = guiCoord(1, 0, 1, 0)
		textBox.position = guiCoord(0, 0, 0, 0)
		textBox.textWrap = true
		textBox.textSize = 14
		textBox.textColour = colour.hex("#ffffff")
		textBox.textAlign = "middle"
		textBox.backgroundColour = colour.hex("#212121")
		textBox.strokeRadius = 3
		textBox.text = props.text
	end

	self.state.subscribe(function(state)
		if state.enabled then
			self.container.visible = true
		else -- disabled
			self.container.visible = false
		end

		self.render()
	end)

	self.render()

	return self
end
