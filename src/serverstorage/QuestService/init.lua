local PlayerData = require(script.PlayerData)
local QuestService = {}

QuestService.Quest =  require(script.Quest)
QuestService.QuestInfo = require(script.Quest.QuestInfo)
QuestService.QuestGiver = require(script.Quest.QuestGiver)
QuestService.QuestPriority = require(script.Quest.QuestPriority)

QuestService.Players = {}

local function PlayerAdded(player)
	local playerData = PlayerData.new(player)
	QuestService.Players[tostring(player.UserId)] = playerData
end

local function PlayerRemoving(player)
	QuestService.Players[tostring(player.UserId)]:Disconnect()
	QuestService.Players[tostring(player.UserId)] = nil
end

for _,player in ipairs(game.Players:GetPlayers()) do
	PlayerAdded(player)
end
-- In case the QuestService was initialized late 

game.Players.PlayerAdded:Connect(PlayerAdded)
game.Players.PlayerRemoving:Connect(PlayerRemoving)

QuestService.QuestAdded = script.Events.QuestAdded.Event
QuestService.QuestRemoved = script.Events.QuestRemoved.Event
QuestService.QuestCompleted = script.Events.QuestRemoved.Event
-- Expose Quest Service Events

function QuestService:AddQuest(quest, player)
	if not quest then error("Quest is not defined.") end
	if not player then error("Player is not defined.") end
	local _player = self.Players[tostring(player.UserId)]
	if not _player then error("This player does not exist") end	
	_player:BeginQuest(quest)
end

function QuestService:RemoveQuest(quest, player)
	if not quest then error("Quest is not defined.") end
	if not player then error("Player is not defined.") end
	local _player = self.Players[tostring(player.UserId)]
	if not _player then error("This player does not exist") end
	_player:CancelQuest(quest)
end

function QuestService:GetPlayer(player)
	if not player then error("Player is not defined.") end
	local _player = self.Players[tostring(player.UserId)]
	if not _player then error("This player does not exist") end
	return _player
end

function QuestService:IsQuestActive(quest, player)
	if not quest then error("Quest is not defined.") end
	if not player then error("Player is not defined.") end
	local player = QuestService:GetPlayer(player)
	if table.find(player.ActiveQuests, quest) then return true end
	return false
end

function QuestService:IsQuestComplete(quest, player)
	if not quest then error("Quest is not defined.") end
	if not player then error("Player is not defined.") end
	local player = QuestService:GetPlayer(player)
	if table.find(player.CompletedQuests, quest) then return true end
	return false
end

return QuestService
