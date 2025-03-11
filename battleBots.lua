local robot = require("robot")
local comp = require("component")
local radar = require("component").radar
local nav = require("component").navigation

local hostileMobs = {"minecraft:zombie", "minecraft:skeleton", "minecraft:creeper", "minecraft:spider", "minecraft:witch", "minecraft:slime", "minecraft:cave_spider", "minecraft:zombie_villager", "minecraft:husk", "minecraft:silverfish", "minecraft:stray", "minecraft:evocation_illager", "minecraft:vindication_illager", "minecraft:illusion_illager", "minecraft:vex", "minecraft:guardian", "minecraft:elder_guardian", "minecraft:blaze", "minecraft:ghast", "minecraft:magma_cube", "minecraft:zombie_pigman", "minecraft:wither_skeleton", "minecraft:wither", "minecraft:enderman", "minecraft:endermite", "minecraft:shulker", "minecraft:ender_dragon"}

function isMobHostile(x, y, z)
    local entity = world.getEntity(x, y, z)
    if entity then
        local entityType = entity.getEntityType()

        for _, hostileType in ipairs(hostileMobs) do
            if entityType == hostileType then
                return true
            end
        end
    end
    return false
end
while true do
    pos = nav.getPosition()
    mobs = radar.getMobs()
    for k,v in pairs(mobs) do
        if isMobHostile(pos.x+k.x, pos.y+k.y, pos.z+k.z) then
        robot.move(pos.x+k.x-1, pos.y+k.y, pos.z+k.z)
        robot.swing()
        end
    end
end
