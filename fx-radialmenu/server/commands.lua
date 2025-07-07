RegisterCommand('dice', function(source, args, rawCommand)
	if source == 0 or source == "Console" then return end

	local dices, c = tonumber(args[1]), 1
	if dices then
		if dices > 3 then
			Notify({
				text=Locale("dicenotify"),
				time=4000,
				type="success",
			})
			return
		end
		local dice = {}
		while c <= dices do
			table.insert( dice, { dicenum = math.random(1, 6)})
			c = c + 1
		end
		TriggerClientEvent('fx-dice:ToggleDiceAnim', source)
		Citizen.Wait(2000)
		TriggerClientEvent('fx-dice:ToggleDisplay', -1, source, dice, "dices")
	end
end, false)

RegisterCommand('rps', function(source, args, rawCommand)
	if source == 0 or source == "Console" then return end
	TriggerClientEvent('fx-dice:TogglerpsAnim', source)
	Citizen.Wait(2000)
	anim = tonumber(args[1])
	if not anim then
		TriggerClientEvent('fx-dice:ToggleDisplay', -1, source, math.random(1, 3), "rps")
	elseif anim == 1 then
		TriggerClientEvent('fx-dice:ToggleDisplay', -1, source,1, "rps")
	elseif anim == 2 then
		TriggerClientEvent('fx-dice:ToggleDisplay', -1, source, 3, "rps")
	elseif anim == 3 then
		TriggerClientEvent('fx-dice:ToggleDisplay', -1, source, 2, "rps")
	end

end, false)

RegisterCommand('tossup', function(source, args, rawCommand)
	if source == 0 or source == "Console" then return end
	TriggerClientEvent('fx-dice:TogglecoinAnim', source)
	Citizen.Wait(2000)
	anim = nil
	if not anim then
		TriggerClientEvent('fx-dice:ToggleDisplay', -1, source, math.random(1, 2), "coin")
	end

end, false)

RegisterCommand("fxbandana", function(source) 
    local _source = source
    local user = FXGetPlayerData(_source)
    local comps = user.comps
    TriggerClientEvent("fx-radialmenu:bandana",_source, comps)
end)


RegisterCommand("fxsleeves", function(source) 
    local _source = source
    local user = FXGetPlayerData(_source)
    local comps = user.comps
    TriggerClientEvent("fx-radialmenu:sleeves",_source, comps)
end)
