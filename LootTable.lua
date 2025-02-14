print("LootTable successfully loaded!")

if not LootTableDB then
    LootTableDB = {}
end

-- Defining frame 
local mainFrame = CreateFrame("Frame","LootTableMainFrame",UIParent,"BasicFrameTemplateWithInset")
-- Frame size in x-, and y- direction
mainFrame:SetSize(500,350)
-- Position of frame
mainFrame:SetPoint("CENTER",UIParent,"CENTER",0,0)
-- Height of frame title
mainFrame.TitleBg:SetHeight(30)
-- Font for frame title
mainFrame.title = mainFrame:CreateFontString(nil,"OVERLAY","GameFontHighlight")
-- Position of frame title
mainFrame.title:SetPoint("CENTER",mainFrame.TitleBg,"CENTER",0,5)
-- Text of frame title
mainFrame.title:SetText("LootTable")
mainFrame:Hide()

-- Defining interactable variables 
mainFrame:EnableMouse(true)
mainFrame:SetMovable(true)
mainFrame:RegisterForDrag("LeftButton")
mainFrame:SetScript("OnDragStart",function(self)
    self:StartMoving()
end)
mainFrame:SetScript("OnDragStop",function(self)
	self:StopMovingOrSizing()
end)
mainFrame:SetScript("OnShow",function()
    PlaySound(808)
end)
mainFrame:SetScript("OnHide",function()
    PlaySound(808)
end)

-- Building slash commands
SLASH_LootTable1 = "/lt"
-- Slash commands list
SlashCmdList["LootTable"] = function()
    if mainFrame:IsShown() then
        mainFrame:Hide()
    else
        mainFrame:Show()
    end
end

-- Escape key 
table.insert(UISpecialFrames,"LootTableMainFrame")

-- Defining Unit Ids
mainFrame.playerName = mainFrame:CreateFontString(nil,"OVERLAY","GameFontNormal")
-- Position of player name
mainFrame.playerName:SetPoint("TOPLEFT",mainFrame,"TOPLEFT",15,-35)
-- Text of player name
mainFrame.playerName:SetText("Character: "..UnitName("player").." (Level "..UnitLevel("player")..")")
