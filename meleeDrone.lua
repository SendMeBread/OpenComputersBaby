local drone = component.proxy(component.list('drone')())
local nav = component.proxy(component.list('nagigation')())
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
function round(num, places)
  return tonumber(string.format("%" .. places .. "f", num))
end
function isMobHostile(entName)
  for _, hostMob in ipairs(hostileMobs) do
    if entName == hostMob then
      return true
    end
  end
  return false
end
function getFacing(x, y, z)
  currx, curry, currz = nav.getPosition()
  if currx >= currz then
    if currx >= 0 then
      return 5
    else
      return 4
    end
  else
    if currz >= 0 then
      return 3
    else
      return 2
    end
  end
end
    
    
function attackMob(ms_x, ms_y, ms_z, name)
  if isMobHostile(name) then
    drone.move(ms_x, ms_y, ms_z)
    drone.swing(getFacing(ms_x, ms_y, ms_z))
  end
end
while true do
  _, _, mx, my, mz, mobName = computer.pullSignal("motion")
  dx = tonumber(mx) or 0
  dy = tonumber(my) or 0
  dz = tonumber(mz) or 0
  attackMob(dx, dy, dz, mobName)
end
