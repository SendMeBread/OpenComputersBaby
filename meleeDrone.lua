drone = component.proxy(component.list('drone')())
event = component.proxy(component.list('event')())
ms = component.proxy(component.list('motion_sensor')())
ms.setSensitivity(0.2)
local hostileMobs = {
  "minecraft:blaze",
  "minecraft:cave_spider", "minecraft:creeper",
  "minecraft:elder_guardian", "minecraft:ender_dragon", "minecraft:enderman", "minecraft:endermite", "minecraft:evocation_illager",
  "minecraft:ghast", "minecraft:giant", "minecraft:guardian",
  "minecraft:husk",
  "minecraft:illusion_illager",
  "minecraft:magma_cube",
  "minecraft:shulker", "minecraft:silverfish", "minecraft:skeleton", "minecraft:slime", "minecraft:spider", "minecraft:stray",
  "minecraft:vex", "minecraft:vindication_illager",
  "minecraft:witch", "minecraft:wither", "minecraft:wither_skeleton",
  "minecraft:zombie", "minecraft:zombie_pigman", "minecraft:zombie_villager"
}
function isMobHostile(x, y, z)
  local entity = world.getEntity(x, y, z)
  if entity ~= nil then
    local entityType = entity.getEntityType()

    for _, hostType in ipairs(hostileMobs) do
      if entityType == hostType then
        return true
      end
    end
  else
    return false
  end
end

function attackMob(is_motion, ms_x, ms_y, ms_z, name)
  print(name)
  if isMobHostile(ms_x, ms_y, ms_z) then
    drone.move(ms_x, ms_y, ms_z)
    drone.swing()
  end
end
while true do
  event.listen('motion', attackMob)
end
