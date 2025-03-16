local drone = component.proxy(component.list('drone')())
local gen = component.proxy(component.list('generator')())
local radar = component.proxy(component.list('radar')())
local mobIndex = 1
drone.move(0, 6, 0)
drone.setLightColor(0xFFFFFF)
local hostileMobs = {
  "Blaze",
  "Cave Spider", "Cockatrice", "Creeper", "Cyclops",
  "Death Worm",
  "Elder Guardian", "Ender Dragon", "Enderman", "Endermite", "Evoker",
  "Fire Dragon",
  "Ghast", "Gorgon", "Guardian",
  "Husk",
  "Ice Dragon",
  "Magma Cube", "Myrmex Queen", "Myrmex Royal", "Myrmex Soldier", "Myrmex Sentinel", "Myrmex Worker",
  "Shulker", "Silverfish", "Siren", "Skeleton", "Slime", "Spider", "Stray", "Stymphalian Bird",
  "Troll",
  "Vex", "Vindicator",
  "Witch", "Wither", "Wither Skeleton",
  "Zombie", "Zombie Pigman", "Zombie Villager"
}
function isMobHostile(entName)
  for _, hostMob in ipairs(hostileMobs) do
    if entName == hostMob then
      return true
    end
  end
  return false
end
local function setFacing(x, y, z)
  if x >= z then
    if x > 0 then
      return 5
    else
      return 4
    end
  else
    if z > 0 then
      return 3
    else
      return 2
    end
  end
end
function attackMob(ms_x, ms_y, ms_z, name)
  if isMobHostile(name) then
    drone.move(ms_x, ms_y, ms_z)
    if drone.detect(setFacing) or drone.detect(0) == true then
      local mobIndex = mobIndex + 1
    end
    if drone.swing(setFacing(ms_x, ms_y, ms_z)) == false then
      if drone.swing(0) == false then
        drone.swing(1)
      end
    end
  end
end
while true do
  if gen.count() == 0 then
    for slot = 2,4,1 do
      drone.select(slot)
      gen.insert(64)
    end
    drone.select(1)
  end
  mob = radar.getMobs()[mobIndex]
  if mob ~= nil then
    drone.setLightColor(0xFF0000)
    attackMob(mob.x, mob.y+1, mob.z, mob.name)
  else
    drone.setColor(0xFFFFFF)
  end
end
