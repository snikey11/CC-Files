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
    {text = "Welcome to Snikey's Subway!", color = colors.lightBlue, x = 1, y = 1},
    {text = "Keep Left for City Subway", color = colors.pink, x = 1, y = 2},
    {text = "Keep Right for Public Railway", color = colors.lime, x = 1, y = 3}
}

-- Display each phrase on the monitor
for _, phrase in ipairs(phrases) do
    displayText(monitor, phrase.text, phrase.color, phrase.x, phrase.y)
end
