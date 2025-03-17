local robot = component.proxy(component.list("robot")())
local redstone = component.proxy(component.list("redstone")())
local sticky = component.proxy(component.list("piston"()))
local sign = component.proxy(component.list("sign")())
local keyphrase = "turn left\n\n\n"
local rotations = 0
redstone.setOutput({0, 0, 0, 1, 1})
while rotations < 5 do
  while sign.getValue() ~= keyphrase do
    robot.forward()
  end
  robot.turnLeft()
  rotations = rotations + 1
end
