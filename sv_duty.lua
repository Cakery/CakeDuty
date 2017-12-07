function Duty(ply)
--Check ranks and teams
if not (table.HasValue(UndercoverRanks,ply:GetUserGroup()) or ply:IsAdmin()) then DarkRP.notify(ply,1,3,"You do not have the right group!") return "" end
if not table.HasValue(UndercoverTeams,team.GetName(ply:Team())) then DarkRP.notify(ply,1,3,"You are not currently in a valid job to use this command!") return "" end

--print(table.HasValue(UndercoverModels,ply:GetModel()))

--If already undercover change them back to normal job model
if table.HasValue(UndercoverModels,ply:GetModel()) then
local model=table.Random(ply:getJobTable().model)
print(model)
ply:updateJob(team.GetName(ply:Team()))
ply:SetModel(model)
else 
--Change to undercover model
--print("Changing model..")	
ply:SetModel(table.Random(UndercoverModels))
ply:updateJob(team.GetName(ply:Team()).." (Undercover)")
end
return ""
end