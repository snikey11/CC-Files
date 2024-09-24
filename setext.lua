-- Function to clear the monitor
local function clearMonitor(monitor)
    monitor.setBackgroundColor(colors.black)
    monitor.clear()
end

-- Function to display text on the monitor with specific color and position
local function displayText(monitor, text, color, x, y)
    monitor.setTextColor(color)
    monitor.setCursorPos(x, y)
    monitor.write(text)
end

-- Function to find a connected monitor
local function findMonitor()
    local monitors = peripheral.getNames()
    for _, name in ipairs(monitors) do
        if peripheral.getType(name) == "monitor" then
            return peripheral.wrap(name)
        end
    end
    error("No monitor found")
end

-- Get the monitor and start displaying text
local monitor = findMonitor()
clearMonitor(monitor)

-- Define phrases and their colors
local phrases = {
  {text = "Hey! Yeah you over there!", color = colors.Orange, x = 1, y = 1},
    {text = "Are you tired of normal food?", color = colors.Red, x = 1, y = 2},
    {text = "Do you wish new animal DLC existed for you to eat?", color = colors.Purple, x = 1, y = 3},
    {text = "Are you hungry enough to dare to try our warden tendrils?", color = colors.darkBlue, x = 1, y = 4},
    {text = "How about a Queen Bee omlette?", color = colors.lightBlue, x = 1, y = 5},
    {text = "Even a Elder Guardian Waffle?", color = colors.Cyan, x = 1, y = 6},
    {text = "Coming soon to a spawn near you", color = colors.Green, x=1, y=7},
    {text = "The Deep Dark's World Famous", color = colors.Lime, x=1, y=8}
    {text = "Waffle House! (TM)", color = colors.Yellow, x=1, y=9}
}

-- Display each phrase on the monitor
for _, phrase in ipairs(phrases) do
    displayText(monitor, phrase.text, phrase.color, phrase.x, phrase.y)
end
