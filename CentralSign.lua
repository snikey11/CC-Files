-- Function to clear the monitor
local function clearMonitor(monitor)
    monitor.setBackgroundColor(colors.black)
    monitor.clear()
    monitor.setTextScale(3)
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
    {text = "This is the", color = colors.pink, x = 1, y = 3},
    {text = "Central Station", color = colors.pink, x = 1, y = 4},
    {text = "Keep Right for the", color = colors.lime, x = 1, y = 5},
    {text = "Public Railway Line", color = colors.lime, x = 1, y = 6},
    {text = "Keep Left for the", color = colors.orange, x=1, y=7},
    {text = "City's Subway Line", color = colors.orange, x=1, y=8}
}

-- Display each phrase on the monitor
for _, phrase in ipairs(phrases) do
    displayText(monitor, phrase.text, phrase.color, phrase.x, phrase.y)
end
