while true do
  local _, x, y, z, entName = event.pull("motion")
  robot.move(x, y, z)
end
