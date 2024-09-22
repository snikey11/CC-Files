-- Function to clear the monitor
local function clearMonitor(monitor)
    monitor.setBackgroundColor(colors.black)
    monitor.clear()
    monitor.setTextScale(2)
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
    {text = "Welcome to", color = colors.lightBlue, x = 1, y = 1},
    {text = "Snikey's Subway", color = colors.lightBlue, x = 1, y = 2},
    {text = "This is the City's", color = colors.pink, x = 1, y = 3},
    {text = "Subway Line", color = colors.pink, x = 1, y = 4},
    {text = "Head up the Stairs and", color = colors.lime, x = 1, y = 5},
    {text = "Take the Pink Elevator", color = colors.lime, x = 1, y = 6},
    {text = "Watch the Gap", color = colors.orange, x=1, y=7},
    {text = "Enjoy your Stay!", color = colors.orange, x=1, y=8}
}

-- Display each phrase on the monitor
for _, phrase in ipairs(phrases) do
    displayText(monitor, phrase.text, phrase.color, phrase.x, phrase.y)
end
