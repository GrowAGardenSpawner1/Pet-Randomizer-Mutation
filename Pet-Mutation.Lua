-- References to UI elements
local rerollButton = script.Parent:WaitForChild("MutationRerollButton")
local mutationLabel = script.Parent:WaitForChild("MutationStatusLabel")
local creatorLabel = script.Parent:WaitForChild("CreatorLabel")

-- Set the creator label
creatorLabel.Text = "Made by GrowAGardenSpawner1"

-- List of possible mutations
local mutations = {
    "Tiny", "Radiant", "Mega", "IronSkin", 
    "Inverted", "Golden", "Windy", "Tranquil", "Shiny"
}

-- Cooldown settings
local cooldown = 5
local onCooldown = false

-- Function to handle mutation reroll
local function rerollMutation()
    if onCooldown then
        print("Still on cooldown. Wait...")
        return
    end

    -- Start cooldown
    onCooldown = true
    rerollButton.Text = "Cooldown (5s)"

    -- Pick a random mutation
    local chosenMutation = mutations[math.random(1, #mutations)]
    mutationLabel.Text = "Mutation: " .. chosenMutation

    -- Countdown display
    for i = cooldown, 1, -1 do
        rerollButton.Text = "Cooldown (" .. i .. "s)"
        wait(1)
    end

    rerollButton.Text = "Mutation Reroll"
    onCooldown = false
end

-- Connect button click
rerollButton.MouseButton1Click:Connect(rerollMutation)
