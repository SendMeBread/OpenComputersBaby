local robot = require("robot")
local nav = require("component").navigation
local radar = require("component").radar
local hostileMobs = {
  "minecraft:blaze",
  "minecraft:cave_spider", "minecraft:creeper",
  "minecraft:elder_guardian", "minecraft:ender_dragon", "minecraft:enderman", "minecraft:endermite", "minecraft:evocation_illager,
  "minecraft:ghast", "minecraft:giant", "minecraft:guardian",
  "minecraft:husk",
  "minecraft:illusion_illager",
  "minecraft:magma_cube",
  "minecraft:shulker", "minecraft:silverfish", "minecraft:skeleton", "minecraft:slime", "minecraft:spider", "minecraft:stray",
  "minecraft:vex", "minecraft:vindication_illager",
  "minecraft:witch", "minecraft:wither", "minecraft:wither_skeleton",
  "minecraft:zombie", "minecraft:zombie_pigman", "minecraft:zombie_villager"
}
