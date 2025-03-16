local comp = require("component")
local robot = require("robot")
local event = require("event")
local radar = comp.radar
local gen = comp.generator
local inventory = comp.inventory_controller
robot.setLightColor(0xFFFFFF)
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
      return entName, true
    end
  end
  return false
end

local function setFacing(x, y, z)
  if y > 0 then
    return 1
  elseif y < 0 then
    return 0
  else
    if x > z then
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
end

local function setXMove(x)
  if x > 0 then
    return 4
  else
    return 5
  end
end
local function setYMove(y)
  if y > 0 then
    return 1
  else
    return 0
  end
end
local function setZMove(z)
  if z > 0 then
    return 3
  else
    return 2
  end
end

function attackMob(ms_x, ms_y, ms_z, name)
  if isMobHostile(name)[2] then
    for i_x=1,ms_x,1 do
      robot.move(setXMove(ms_x))
    end
    for i_y=1,ms_y,1 do
      robot.move(setYMove(ms_y))
    end
    for i_z=1,ms_z,1 do
      robot.move(setZMove(ms_z))
    end
    robot.use(setFacing(ms_x, ms_y, ms_z), 10)
  end
end
mob = radar.getMobs()[1]
while mob == nil do
  if gen.count() == 0 then
    for slot = 5,8,1 do
      inventory.equip(slot)
      gen.insert(64)
    end
    inventory.equip(1)
  end
  mob = radar.getMobs()[1]
end
robot.setLightColor(0xFF0000)
while true do
  if gen.count() == 0 then
    for slot = 5,8,1 do
      inventory.equip(slot)
      gen.insert(64)
    end
    inventory.equip(1)
  end
  for _, name, _, _, _, in pairs(radar.getMobs()) do
    if name == mob.name then
      attackMob(mob.x, mob.y, mob.z, mob.name)
      break
    else
      mob = radar.getMobs()[1]
    end
    end
    robot.setColor(0xFFFFFF)
  end
end
