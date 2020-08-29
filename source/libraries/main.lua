-- Copyright 2020 - Deviap (deviap.com)
-- Author(s): utrain

-- This file lazy-loads our modules that we have made. Enterprise grade, of course.

local globalStringSubstition = string.gsub
local rootDirectory = "tevgit" -- Must ensure our code is enterprise-grade by ensuring modularity.
local stringReplacementForPeriod = ("%:source/libraries/"):gsub("%%", rootDirectory)
local errorMessageIfModuleFailsToLoad = "You either misnamed the library or you forgot './' like a functional programmer."
local regex = "^%."
local requireModule = function(moduleName)
	return pcall(require(moduleName)) or nil
end
local errorIfModuleFailsToLoad = function(errorMessage)
	error(errorMessage, 3)
end

local librariesRelativePath =
{
	--libraryName = "./..."
	UI = "./UI/main.lua"
}

return function(libraryName) return requireModule(globalStringSubstition(librariesRelativePath[libraryName], regex, stringReplacementForPeriod)) or errorIfModuleFailsToLoad(errorMessageIfModuleFailsToLoad) end
