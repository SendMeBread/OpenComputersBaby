local robot = component.proxy(component.list("robot")())
local redstone = component.proxy(component.list("redstone")())
local sign = component.proxy(component.list("sign")())
local inventory = component.proxy(component.list("inventory_controller")())
local slot = 1
local keyphrase = "turn left\n\n\n"
local rotations = 0
redstone.setOutput({0, 0, 1, 0, 0})
while rotations < 9 do
  while sign.getValue() ~= keyphrase do
    robot.forward()
    if robot.count() == 0 then
      slot = slot + 1
    end
    robot.select(slot)
    robot.turnRight()
    inventory.dropIntoSlot(3, 1)
    robot.turnLeft()
  end
  robot.turnLeft()
  rotations = rotations + 1
end
