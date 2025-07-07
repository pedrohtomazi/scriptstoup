## CHANGE FUNCTION
## vorp_character/client/client.lua
## LoadPlayerComponents
```lua
function LoadPlayerComponents(ped, skin, components, reload)
	local gender = skin.sex == "mp_male" and "Male" or "Female"
	local getPedModel = GetEntityModel(ped)

	if reload or getPedModel ~= joaat("mp_female") and getPedModel ~= joaat("mp_male") then
		local gethealt = GetEntityHealth(PlayerPedId())
		local GetCoreHealth = GetAttributeCoreValue(PlayerPedId(), 0)
		local GetCoreStamina = GetAttributeCoreValue(PlayerPedId(), 1)
		local skinS = not Custom and skin.sex or Custom
		LoadPlayer(joaat(skinS))
		SetPlayerModel(PlayerId(), joaat(skinS), false)
		SetEntityHealth(PlayerPedId(), 100) 
		SetEntityFadeIn(ped)
		ped = PlayerPedId()
		SetModelAsNoLongerNeeded(joaat(skinS))
		SetEntityHealth(PlayerPedId(), gethealt) 
		Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, GetCoreHealth)
		Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, GetCoreStamina)
		Custom = nil
	end

	if skin.sex ~= "mp_male" then
		EquipMetaPedOutfitPreset(ped, 7)
	else
		EquipMetaPedOutfitPreset(ped, 4)
	end

	skin = LoadAll(gender, ped, skin, components, true)
	RegisterBodyIndexs(skin)
	ApplyRolledClothingStatus()
	FaceOverlay("beardstabble", skin.beardstabble_visibility, 1, 1, 0, 0, 1.0, 0, 1, skin.beardstabble_color_primary, 0, 0, 1, skin.beardstabble_opacity)
	FaceOverlay("hair", skin.hair_visibility, skin.hair_tx_id, 1, 0, 0, 1.0, 0, 1, skin.hair_color_primary, 0, 0, 1, skin.hair_opacity)
	FaceOverlay("scars", skin.scars_visibility, skin.scars_tx_id, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, skin.scars_opacity)
	FaceOverlay("spots", skin.spots_visibility, skin.spots_tx_id, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, skin.spots_opacity)
	FaceOverlay("disc", skin.disc_visibility, skin.disc_tx_id, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, skin.disc_opacity)
	FaceOverlay("complex", skin.complex_visibility, skin.complex_tx_id, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, skin.complex_opacity)
	FaceOverlay("acne", skin.acne_visibility, skin.acne_tx_id, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, skin.acne_opacity)
	FaceOverlay("ageing", skin.ageing_visibility, skin.ageing_tx_id, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, skin.ageing_opacity)
	FaceOverlay("freckles", skin.freckles_visibility, skin.freckles_tx_id, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, skin.freckles_opacity)
	FaceOverlay("moles", skin.moles_visibility, skin.moles_tx_id, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, skin.moles_opacity)
	FaceOverlay("shadows", skin.shadows_visibility, 1, 1, 0, 0, 1.0, 0, 1, skin.shadows_palette_color_primary, skin.shadows_palette_color_secondary, skin.shadows_palette_color_tertiary, skin.shadows_palette_id, skin.shadows_opacity)
	FaceOverlay("eyebrows", skin.eyebrows_visibility, skin.eyebrows_tx_id, 1, 0, 0, 1.0, 0, 1, skin.eyebrows_color, 0, 0, 1, skin.eyebrows_opacity)
	FaceOverlay("eyeliners", skin.eyeliner_visibility, skin.eyeliner_tx_id, 1, 0, 0, 1.0, 0, 1, skin.eyeliner_color_primary, 0, 0, skin.eyeliner_palette_id, skin.eyeliner_opacity)
	FaceOverlay("blush", skin.blush_visibility, skin.blush_tx_id, 1, 0, 0, 1.0, 0, 1, skin.blush_palette_color_primary, 0, 0, 1, skin.blush_opacity)
	FaceOverlay("lipsticks", skin.lipsticks_visibility, 1, 1, 0, 0, 1.0, 0, 1, skin.lipsticks_palette_color_primary, skin.lipsticks_palette_color_secondary, skin.lipsticks_palette_color_tertiary, skin.lipsticks_palette_id, skin.lipsticks_opacity)
	canContinue = true
	FaceOverlay("grime", skin.grime_visibility, skin.grime_tx_id, 0, 0, 0, 1.0, 0, 1, 0, 0, 0, 1, skin.grime_opacity)
	Wait(200)
	TriggerServerEvent("vorpcharacter:reloadedskinlistener")
	RemoveTagFromMetaPed(0x3F1F01E5) -- bullets
	SetPedScale(ped, CachedSkin.Scale)
end
```

## CHANGE EVENT
## vorp_character/client/client.lua
## vorpcharacter:reloadafterdeath
```lua
AddEventHandler("vorpcharacter:reloadafterdeath", function()
	local player = PlayerPedId()
	local getPedModel = GetEntityModel(player)
	local reload = false
	if getPedModel ~= joaat("mp_female") and getPedModel ~= joaat("mp_male") then
		reload = true
	end

	if CachedSkin and CachedComponents then
		local pedmenu = exports['fx-pedmenu']:GetLastPed()
		if pedmenu then
			exports['fx-pedmenu']:LoadLastPed()
		else
			LoadPlayerComponents(PlayerPedId(), CachedSkin, CachedComponents, reload)
		end
	end

	SetAttributeCoreValue(player, 0, 100)
	-- SetEntityHealth(player, 600, 1)
	SetAttributeCoreValue(player, 1, 100)
	RestorePedStamina(player, 1065330373)
end)
```