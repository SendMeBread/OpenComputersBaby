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
    robot.placeDown(0)
    robot.up()
  end
  slot = slot + 1
end
robot.select(16)
robot.useDown()
