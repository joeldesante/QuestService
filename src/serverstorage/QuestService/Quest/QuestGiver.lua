--[[

TODO:

- Handle proximity prompts better
	a. Should be customizable such that the words and other properties can be adapted to fit the story
	b. If the proximity prompt is triggered it should not be shown to that individual client
		- OR it should change to be a ProxPrompt that completes the quest
		- OR the item may no longer exist and the quest should be finnished in a different way
- There should be room for custom actions when the ProxPrompt is triggered.

]]




local QuestGiver = {}

function QuestGiver.new(questService, basePart, quest)
	if not basePart:IsA("BasePart") then error("Please provide a valid basepart.") end
	if not quest then error("Quest is not defined.") end
	
	local questGiverObject = {}
	questGiverObject.Quest = quest
	questGiverObject.ProximityPrompt = Instance.new("ProximityPrompt")
	questGiverObject.BasePart = basePart
	
	questGiverObject.OnTriggered = questGiverObject.ProximityPrompt.Triggered:Connect(function(player)
		if questService:IsQuestActive(quest, player) or questService:IsQuestComplete(quest, player) then warn("This quest is either already active or already completed for", player) return end
		questService:AddQuest(quest, player)
	end)
	
	questGiverObject.ProximityPrompt.ActionText = "Begin Quest"
	questGiverObject.ProximityPrompt.Parent = questGiverObject.BasePart
	
	return questGiverObject
end

return QuestGiver
