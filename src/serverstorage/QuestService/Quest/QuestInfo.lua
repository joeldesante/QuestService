local QuestPriority = require(script.Parent.QuestPriority)
local QuestInfo = {}

function QuestInfo.new()
	local questInfoObject = {}
	
	questInfoObject.Name = ""
	questInfoObject.Description = ""
	questInfoObject.Expiration = nil
	questInfoObject.Required = true
	questInfoObject.QuestPriority = QuestPriority.Regular
	questInfoObject.CheckCallback = function(player) return true end
	questInfoObject.RewardCallback = function(player) print(string.format("Quest %s has been completed", questInfoObject.Name)) end
	
	return questInfoObject
end

return QuestInfo
