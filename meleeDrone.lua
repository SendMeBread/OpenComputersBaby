local drone = component.proxy(component.list('drone')())
local gen = component.proxy(component.list('generator')())
local radar = component.proxy(component.list('radar')())
drone.move(0, 1, 0)
drone.setLightColor(0xFFFFFF)
local hostileMobs = {
  "Blaze",
  "Cave Spider", "Creeper",
  "Elder Guardian", "Ender Dragon", "Enderman", "Endermite", "Evoker",
  "Ghast", "Guardian",
  "Husk",
  "Magma Cube",
  "Shulker", "Silverfish", "Skeleton", "Slime", "Spider", "Stray",
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
    if drone.swing(setFacing(ms_x, ms_y, ms_z)) == false then
      drone.swing(0)
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
  mob = radar.getMobs()[1]
  if mob ~= nil then
    drone.setLightColor(0xFF0000)
    attackMob(mob.x, mob.y, mob.z, mob.name)
  else
    drone.setColor(0xFFFFFF)
  end
end
