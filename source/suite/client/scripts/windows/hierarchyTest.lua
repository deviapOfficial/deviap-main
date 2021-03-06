
local hierarchyMenu
hierarchyMenu = require("./hierarchy.lua"){
	parent = core.construct("guiFrame", {
		parent = core.interface,
		zIndex = 10,
		size = guiCoord(1, 0, 1, 0)
	}),
	size = guiCoord(0, 400, 0, 800),
	position = guiCoord(0, 50, 0, 0),

	defaultBackgroundColour = colour(0.0, 0.0, 0.0),
	defaultTextColour = colour(0.9, 0.9, 0.9),
	defaultIconColour = colour(1, 1, 1),
	backgroundColour = colour(0, 0, 0),

	buttonHeight = 25,
	insetBy = 10,

	onButtonEnter = function(child, button)
		child.backgroundColour = colour(0.2, 0.2, 0.2)
		button.propsThenRender {
			backgroundColour = child.backgroundColour
		}
	end,

	onButtonExit = function(child, button)
		child.backgroundColour = nil
		button.propsThenRender {
			backgroundColour = hierarchyMenu.props.backgroundColour
		}
	end,

	onButtonDown1 = function(child)
		if child.isExpanded then
			child.isExpanded = false
		else
			child.isExpanded = true
		end

		hierarchyMenu.render()
	end,

	hierarchy = {
		{
			text = "Teams",
			iconId = "groups",
			isExpanded = true,
			children = {
				{
					text = "Product Engineering",
					iconId = "engineering",
					isExpanded = true,
					children = {
						{
							text = "Jay",
							iconId = "assignment_ind"
						},
						{
							text = "Sanjay",
							iconId = "assignment_ind"
						},
						{
							text = "Ly",
							iconId = "account_circle"
						},
						{
							text = "utrain",
							iconId = "account_circle"
						}
					}
				},
				{
					text = "Information Experience",
					iconId = "text_snippet",
					children = {
						{
							text = "Ryan",
							iconId = "assignment_ind",
						},
						{
							text = "Sanjay",
							iconId = "assignment_ind"
						},
						{
							text = "Neztore",
							iconId = "account_circle"
						},
						{
							text = "popeeyy",
							iconId = "account_circle"
						}
					}
				},
				{
					text = "Community Relations",
					iconId = "analytics",
					children = {
						{
							text = "Ryan",
							iconId = "assignment_ind"
						},
						{
							text = "Sanjay",
							iconId = "assignment_ind",
						},
						{
							text = "Zaydan",
							iconId = "account_circle",
						},
						{
							text = "zachary23111",
							iconId = "account_circle",
						},
						{
							text = "Roman",
							iconId = "account_circle",
						},
						{
							text = "August",
							iconId = "account_circle"
						},
						{
							text = "Trapido02",
							iconId = "account_circle"
						}
					}
				}
			}
		},
	}
}