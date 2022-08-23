local PlayerData = {}

function PlayerData.new(player)
	local playerDataObject = {}
	playerDataObject.Player = player
	playerDataObject.ActiveQuests = {}
	playerDataObject.CompletedQuests = {}
	
	playerDataObject.OnQuestCompleted = script.Parent.Events.QuestCompleted.Event:Connect(function(quest, player)
		
	end)
	
	function playerDataObject:BeginQuest(quest)
		if table.find(self.ActiveQuests, quest) then error("This quest is already active.") end
		if table.find(self.CompletedQuests, quest) then error("This quest has already been completed") end
		table.insert(self.ActiveQuests, quest)
		script.Parent.Events.QuestAdded:Fire(quest, player)
	end
	
	function playerDataObject:CancelQuest(quest)
		local index = table.find(self.ActiveQuests, quest)
		if not index then error("This quest is not currently active.") end
		table.remove(self.ActiveQuests, index)
		script.Parent.Events.QuestRemoved:Fire(quest, player)
	end
	
	function playerDataObject:CheckQuest(quest)
		local index = table.find(self.ActiveQuests, quest)
		if not index then error("This quest is not active for the given player.") end
		if not quest:InternalCheck(self.Player) then return false end
		table.remove(self.ActiveQuests, index)
		table.insert(self.CompletedQuests, quest)
		script.Parent.Events.QuestRemoved:Fire(quest, self.Player)
	end
	
	function playerDataObject:CheckAllQuests()
		for index, quest in ipairs(self.ActiveQuests) do
			if not quest:InternalCheck(self.Player) then continue end
			table.remove(self.ActiveQuests, index)
			table.insert(self.CompletedQuests, quest)
			script.Parent.Events.QuestRemoved:Fire(quest, self.Player)
		end
	end
	
	function playerDataObject:Disconnect()
		self.OnQuestCompleted:Disconnect()
	end
		
	return playerDataObject
end

return PlayerData
