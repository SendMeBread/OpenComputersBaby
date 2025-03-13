local drone = component.proxy(component.list('drone')())
local nav = component.proxy(component.list('nagigation')())
local ms = component.proxy(component.list('motion_sensor')())
ms.setSensitivity(0.0)
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
function getFacing(x, y, z)
  if x >= z then
    if x >= 0 then
      return 5
    else
      return 4
    end
  else
    if z >= 0 then
      return 3
    else
      return 2
    end
  end
end
    
    
function attackMob(ms_x, ms_y, ms_z, name)
  if isMobHostile(name) then
    drone.move(ms_x-1, ms_y, ms_z)
    drone.swing(getFacing(ms_x, ms_y, ms_z))
  end
end
while true do
  _, _, dx, dy, dz, mobName = computer.pullSignal("motion")
  attackMob(dx, dy, dz, mobName)
end
