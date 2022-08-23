--[[
	This is an enum which describes the priority of a quest
]]

local QuestPriority = {}

QuestPriority.Important = 0
QuestPriority.Regular = 1
QuestPriority.Unimportant = 2

table.freeze(QuestPriority)
return QuestPriority
