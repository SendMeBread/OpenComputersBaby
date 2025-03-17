local robot = component.proxy(component.list("robot")())
local redstone = component.proxy(component.list("redstone")())
local sticky = component.proxy(component.list("piston"()))
local sign = component.proxy(component.list("sign")())
local keyphrase = "left 90"
rotations = 0
redstone.setOutput(3, 1)
while rotations < 1 do
  while sign.getValue() ~= "left 90" do
    robot.up()
    sticky.pull()
    robot.turnLeft()
    robot.forward()
    robot.turnRight()
    robot.down()
  end
  rotations = rotations + 1
end
