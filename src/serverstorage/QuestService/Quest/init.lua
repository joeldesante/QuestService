local Quest = {}

function Quest.new(questInfo)
	if not questInfo then error("QuestInfo has not been defined.") end
	table.freeze(questInfo)
	
	local questObject = {}
	questObject.QuestInfo = questInfo
	
	function questObject:InternalCheck(player)
		if not questInfo.CheckCallback then error("Check callback has not been defined") end
		if not questInfo.RewardCallback then error("Reward callback has not been defined") end
		
		if questInfo.CheckCallback(player) == true then
			questInfo.RewardCallback(player)
			script.Parent.Events.QuestCompleted:Fire(self, player)
			return true
		end
		
		return false
	end
	-- Checks if the parameters of the quest are met and then runs the reward callback
	-- This method should NOT be used externally. Please use `QuestService:GetPlayer(player):CheckQuest(quest)` instead.
	
	return questObject
end

return Quest
