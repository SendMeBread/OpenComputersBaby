local robot = require("robot")
local component = require("component")
local event = require("event")
nav = component.navigation
ms = component.motion_sensor
ms.setSensitivity(0.5)
while true do
    pos = nav.getPosition()
    local _, address, x, y, z, name = event.pull(motion)
    local entity = world.getEntityAt(pos.x + x, pos.y + y, pos.z + z)
    if entity and entity.isHostile() then
        robot.useItem()
    end
end
