function mage_frost(self)
	local spell = nil

	if cd("frostfire orb") == 0 then
		spell = "frostfire orb"
	elseif cd("deep freeze") == 0 and ub("player","fingers of frost") then
		spell = "deep freeze"
	elseif ub("player","fingers of frost") and ub("player","brain freeze") then
		spell = "frostfire bolt"
	elseif jps.petCooldown("5") == 0 then
		CastPetAction("5")
		CameraOrSelectOrMoveStart()
		CameraOrSelectOrMoveStop()
	else
		spell = "frostbolt"
	end
	
	return spell
end
