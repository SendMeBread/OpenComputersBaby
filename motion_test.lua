event = component.proxy(component.list("event")())
while true do
  local _, x, y, z, entName = event.pull("motion")
  print(entName)
end
