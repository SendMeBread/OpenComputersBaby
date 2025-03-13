local drone = component.proxy(component.list('drone')())
local ms = component.proxy(component.list('motion_sensor')())
ms.setSensitivity(0.2)
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
function attackMob(address, id, ms_x, ms_y, ms_z, name)
  if isMobHostile(name) then
    drone.move(ms_x, ms_y, ms_z)
    drone.swing()
  end
end
while true do
  event.listen("motion", attackMob)
end
