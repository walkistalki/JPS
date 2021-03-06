function shaman_elemental(self)
	local spell = nil
	local mana = UnitMana("player")/UnitManaMax("player")
	local speed = GetUnitSpeed("player")	 
	local lsCount = jps.buffStacks("lightning shield")
	local fsDuration = jps.debuffDuration("flame shock")
	local _, fireTotemName, _, _, _ = GetTotemInfo(1) 
	 
	if jps.Interrupts and cd("wind shear") == 0 and jps.shouldKick("target") and mana > .4 then 
		SpellStopCasting()
		spell = "wind shear"
	elseif jps.UseCDs and cd("blood fury") == 0 then
		spell = "blood fury"
	elseif lsCount < 2 then
		spell = "lightning shield"
	elseif fireTotemName == "" and cd("fire elemental totem") == 0 and jps.UseCDs then
		spell = "fire elemental totem"
	elseif fireTotemName == "" then
		spell = "searing totem"
	elseif lsCount >= 7 and fsDuration > 6 and cd("earth shock") == 0 then
		spell = "earth shock"
	elseif mana < 0.6 and cd("thunderstorm") == 0 then
		spell = "thunderstorm"	 
	elseif fsDuration < 2 and cd("flame shock") == 0 then
		spell = "flame shock"
	elseif jps.Moving and not ub("player","spiritwalker's grace") and cd("spiritwalker's grace") == 0 then
		spell = "spiritwalker's grace"
	elseif jps.Moving and not ub("player","spiritwalker's grace") then
		spell = "lightning bolt"
	elseif cd("lava burst") == 0 and cd("elemental mastery") == 0 and jps.UseCDs then
		spell = "elemental mastery"		
	elseif cd("lava burst") == 0 then
		spell = "lava burst"
	elseif cd("chain lightning") == 0 and jps.MultiTarget then
		spell = "chain lightning"
	else
		spell = "lightning bolt"
	end

	if jps.Casting and spell ~= "spiritwalker's grace" then return nil end

	return spell
end
