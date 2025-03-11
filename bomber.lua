local robot = require("robot")
for i = 0, 77, 1
do
  robot.up()
end
slot = 1
while ( slot < 16 )
do
  for r 0,robot.space(slot),1
  do
    robot.select(slot)
    robot.placeDown(0)
    robot.select(16)
    robot.useDown(0)
    robot.forward()
  end
  slot = slot + 1
end
