local ProtectionConfig = {
    -- 🔴 CRITICAL: This MUST exactly match the 'Secret' value in your Key System's Config!
    -- If your Key System has: Secret = "Test"
    -- Then this must also be: SecretKey = "Test"
    SecretKey = "poopie",
    
    -- The name of your Hub (shown in the kick message if they try to bypass)
    HubName = "Jake HUB"
}

-- Anti-Bypass Logic: Checks if the Key System successfully set the global variable
if not _G[ProtectionConfig.SecretKey] then
    local player = game:GetService("Players").LocalPlayer
    if player then
        player:Kick("\n🛡️ Unauthorized Execution 🛡️\n\nPlease use the official Key System to run " .. ProtectionConfig.HubName)
    end
    return -- Stops the rest of the script from loading!
end

-------------------------------------------------------------------------------
-- 👇 YOUR MAIN SCRIPT CODE STARTS HERE 👇
-------------------------------------------------------------------------------

print(ProtectionConfig.HubName .. " Loaded Successfully!")

-- [[ JAKE'S HUB v3 ]] --

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")
local SafeParent = (pcall(function() return gethui() end) and gethui()) or PlayerGui

if SafeParent:FindFirstChild("JAKES_HUB") then
    SafeParent.JAKES_HUB:Destroy()
end

-- ========== GLOBALS ==========
getgenv().AutoFarmBrainrot   = false
getgenv().AutoFarmLB         = false
getgenv().SelectedBrainrotZone = "Common"
getgenv().SelectedLBZone     = "Common Lucky Block"
getgenv().InstantInteract    = false
getgenv().AutoSell           = false
getgenv().AutoSellRarity     = false
getgenv().SelectedSellRarity = "Common"
getgenv().SelectedMutation   = "Normal"
getgenv().AutoCollectMoney   = false
getgenv().AutoRebirth        = false
getgenv().AutoUpgrade        = false
getgenv().SelectedRoller     = "Red"
getgenv().AutoBuyBoost       = false
getgenv().AutoBuySpeed1      = false
getgenv().AutoBuySpeed5      = false
getgenv().SelectedPlot       = nil
getgenv().BaseReturnCFrame   = nil
getgenv().SelectedGiftPlayer = nil

-- ========== DATA ==========
local BrainrotRarities = {
    ["Common"]    = {"Ballerina Cappuccina","Lirili Larila","Svinina Bombardino","Trippi Troppi"},
    ["Uncommon"]  = {"Noobini Pizzanini","Six Seven","Trulimero Trulicina","Tung Sahur"},
    ["Rare"]      = {"Bananita Dolphinita","Frigo Camelo","Pot Hotspot","Tim Cheese"},
    ["Epic"]      = {"Boneca Ambalabu","Cappuccino Assassino","Fluri Flura","Sigma Boy"},
    ["Legendary"] = {"Bombardire Crocodilo","Ganganzelll Trulala","La Vacca Saturno Saturnita","Tralalero Tralala","Tric Trac Barabum"},
    ["Mythic"]    = {"Alessio","Cavallo Virtuoso","Gralpussi Medussi","Lionel Cactuseli","Ketupat Kepat","Karkerkar Kurikur"},
    ["Cosmic"]    = {"Cocofanto Elefanto","Gorillo Watermelondrillo","Job Job Job Sahur","Lerulerulerule","Orcalero Orcala"},
    ["Secret"]    = {"1x1x1x1","Dragon Cannelloni","Noo My Examen","Quesadilla Crocodila","Skibidi Toilet","Swag Soda","Tralaledon"},
    ["Celestial"] = {"Chicleteirina Bicicleteirina","Meowl","Nyannini Cattalini","Strawberry Elephant","Tralalita Tralala","Triplito Tralaloritos","Yess My Examen"},
    ["Divine"]    = {"Chillin Chil","Esok Sekolah","Illuminato Triangolo","Ketchuru And Musturu","La Grande Combinasion","Tik Tak Sahur"},
    ["OG"]        = {"Ben","Smurfo Gatte","Happy Banana Cat"},
}
local RarityList   = {"Common","Uncommon","Rare","Epic","Legendary","Mythic","Cosmic","Secret","Celestial","Divine","OG"}
local MutationList = {"Normal","Gold","Diamond","Rainbow"}
local zoneList     = {"Common","Uncommon","Rare","Epic","Legendary","Mythic","Cosmic","Secret","Celestial","Divine & OG"}
local lbZoneList   = {"Common Lucky Block","Uncommon Lucky Block","Rare Lucky Block","Epic Lucky Block","Legendary Lucky Block","Mythic Lucky Block","Cosmic Lucky Block","Secret Lucky Block","Celestial Lucky Block","Divine & OG Lucky Block"}
local ZoneMap = {
    ["Common"]="Zone1",["Uncommon"]="Zone2",["Rare"]="Zone3",["Epic"]="Zone4",["Legendary"]="Zone5",
    ["Mythic"]="Zone6",["Cosmic"]="Zone7",["Secret"]="Zone8",["Celestial"]="Zone9",["Divine & OG"]="Zone10",
}
local LBZoneMap = {
    ["Common Lucky Block"]="LB_Zone1",["Uncommon Lucky Block"]="LB_Zone2",["Rare Lucky Block"]="LB_Zone3",
    ["Epic Lucky Block"]="LB_Zone4",["Legendary Lucky Block"]="LB_Zone5",["Mythic Lucky Block"]="LB_Zone6",
    ["Cosmic Lucky Block"]="LB_Zone7",["Secret Lucky Block"]="LB_Zone8",["Celestial Lucky Block"]="LB_Zone9",
    ["Divine & OG Lucky Block"]="LB_Zone10",
}
local rollerOptions = {"Red","Rainbow","Gold","Angel","Neon","Wizard","Lightning","Hacker"}

local function autoInteract(obj)
    if not obj then return end
    for _, v in ipairs(obj:GetDescendants()) do
        if v:IsA("ProximityPrompt") then
            fireproximityprompt(v, 1)
            return true
        end
    end
end

local function getRemote(name)
    return game:GetService("ReplicatedStorage").Packages._Index
        :FindFirstChild("sleitnick_net@0.2.0").net:FindFirstChild("RE/" .. name)
end

-- ========== THEME ==========
-- Warm dark: deep charcoal base, cream text, amber/gold accent
local C = {
    Base      = Color3.fromRGB(13, 12, 11),      -- near black, warm tint
    Surface   = Color3.fromRGB(20, 19, 17),      -- card bg
    Raised    = Color3.fromRGB(28, 27, 24),      -- hovered card
    Border    = Color3.fromRGB(45, 42, 38),      -- subtle dividers
    Accent    = Color3.fromRGB(210, 170, 90),    -- warm amber/gold
    AccentDim = Color3.fromRGB(140, 110, 55),    -- muted gold
    Text      = Color3.fromRGB(232, 225, 210),   -- warm off-white
    TextDim   = Color3.fromRGB(130, 122, 108),   -- muted text
    Red       = Color3.fromRGB(210, 80, 70),
    Green     = Color3.fromRGB(100, 185, 110),
    TabActive = Color3.fromRGB(32, 30, 26),
}

-- ========== SCREEN GUI ==========
local Gui = Instance.new("ScreenGui")
Gui.Name = "JAKES_HUB"
Gui.ResetOnSpawn = false
Gui.DisplayOrder = 9999
Gui.IgnoreGuiInset = true
Gui.Parent = SafeParent

-- ========== TOGGLE BUTTON ==========
local Toggle = Instance.new("TextButton", Gui)
Toggle.Size = UDim2.new(0, 44, 0, 44)
Toggle.Position = UDim2.new(0, 12, 0.5, -22)
Toggle.BackgroundColor3 = C.Surface
Toggle.Text = "J"
Toggle.TextColor3 = C.Accent
Toggle.TextSize = 18
Toggle.Font = Enum.Font.GothamBlack
Toggle.AutoButtonColor = false
Toggle.Draggable = true
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 10)
local toggleStroke = Instance.new("UIStroke", Toggle)
toggleStroke.Color = C.Border
toggleStroke.Thickness = 1

-- ========== MAIN WINDOW ==========
local Win = Instance.new("Frame", Gui)
Win.Name = "MainWindow"
Win.Size = UDim2.new(0, 480, 0, 400)
Win.Position = UDim2.new(0.5, -240, 0.5, -200)
Win.BackgroundColor3 = C.Base
Win.BorderSizePixel = 0
Win.Active = true
Win.Draggable = true
Win.ClipsDescendants = false
Instance.new("UICorner", Win).CornerRadius = UDim.new(0, 12)
local winStroke = Instance.new("UIStroke", Win)
winStroke.Color = C.Border
winStroke.Thickness = 1

-- ========== TOP BAR ==========
local TopBar = Instance.new("Frame", Win)
TopBar.Size = UDim2.new(1, 0, 0, 42)
TopBar.BackgroundColor3 = C.Surface
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 5
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 12)
-- cover bottom corners
local TBFix = Instance.new("Frame", TopBar)
TBFix.Size = UDim2.new(1, 0, 0.5, 0)
TBFix.Position = UDim2.new(0, 0, 0.5, 0)
TBFix.BackgroundColor3 = C.Surface
TBFix.BorderSizePixel = 0
TBFix.ZIndex = 4

-- thin accent line under topbar
local AccentLine = Instance.new("Frame", TopBar)
AccentLine.Size = UDim2.new(1, 0, 0, 1)
AccentLine.Position = UDim2.new(0, 0, 1, -1)
AccentLine.BackgroundColor3 = C.Border
AccentLine.BorderSizePixel = 0
AccentLine.ZIndex = 6

-- title
local TitleLabel = Instance.new("TextLabel", TopBar)
TitleLabel.Size = UDim2.new(0.5, 0, 1, 0)
TitleLabel.Position = UDim2.new(0, 14, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Jake's Hub"
TitleLabel.TextColor3 = C.Text
TitleLabel.TextSize = 15
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 6

-- version tag
local VerLabel = Instance.new("TextLabel", TopBar)
VerLabel.Size = UDim2.new(0, 30, 0, 16)
VerLabel.Position = UDim2.new(0, 110, 0.5, -8)
VerLabel.BackgroundColor3 = C.Raised
VerLabel.Text = "v3"
VerLabel.TextColor3 = C.AccentDim
VerLabel.TextSize = 9
VerLabel.Font = Enum.Font.GothamBold
VerLabel.ZIndex = 7
Instance.new("UICorner", VerLabel).CornerRadius = UDim.new(0, 4)

-- minimize
local MinBtn = Instance.new("TextButton", TopBar)
MinBtn.Size = UDim2.new(0, 26, 0, 26)
MinBtn.Position = UDim2.new(1, -62, 0.5, -13)
MinBtn.BackgroundColor3 = C.Raised
MinBtn.Text = "–"
MinBtn.TextColor3 = C.TextDim
MinBtn.TextSize = 14
MinBtn.Font = Enum.Font.GothamBold
MinBtn.AutoButtonColor = false
MinBtn.ZIndex = 6
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 7)

-- close
local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(1, -32, 0.5, -13)
CloseBtn.BackgroundColor3 = Color3.fromRGB(60, 28, 26)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = C.Red
CloseBtn.TextSize = 12
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.AutoButtonColor = false
CloseBtn.ZIndex = 6
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 7)

local minimized = false
CloseBtn.MouseButton1Click:Connect(function() Win.Visible = false end)
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    TweenService:Create(Win, TweenInfo.new(0.18, Enum.EasingStyle.Quart), {
        Size = minimized and UDim2.new(0, 480, 0, 42) or UDim2.new(0, 480, 0, 400)
    }):Play()
end)
Toggle.MouseButton1Click:Connect(function() Win.Visible = not Win.Visible end)

-- ========== TAB ROW ==========
local TabRow = Instance.new("Frame", Win)
TabRow.Size = UDim2.new(1, -16, 0, 30)
TabRow.Position = UDim2.new(0, 8, 0, 48)
TabRow.BackgroundColor3 = C.Surface
TabRow.BorderSizePixel = 0
Instance.new("UICorner", TabRow).CornerRadius = UDim.new(0, 8)
local tabStroke = Instance.new("UIStroke", TabRow)
tabStroke.Color = C.Border
tabStroke.Thickness = 1

local TabLL = Instance.new("UIListLayout", TabRow)
TabLL.FillDirection = Enum.FillDirection.Horizontal
TabLL.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabLL.VerticalAlignment = Enum.VerticalAlignment.Center
TabLL.Padding = UDim.new(0, 2)
local TabPad = Instance.new("UIPadding", TabRow)
TabPad.PaddingLeft = UDim.new(0, 3)
TabPad.PaddingRight = UDim.new(0, 3)

-- ========== CONTENT AREA ==========
local ContentArea = Instance.new("Frame", Win)
ContentArea.Size = UDim2.new(1, -16, 1, -92)
ContentArea.Position = UDim2.new(0, 8, 0, 84)
ContentArea.BackgroundColor3 = C.Surface
ContentArea.BorderSizePixel = 0
ContentArea.ClipsDescendants = true
Instance.new("UICorner", ContentArea).CornerRadius = UDim.new(0, 8)
local caStroke = Instance.new("UIStroke", ContentArea)
caStroke.Color = C.Border
caStroke.Thickness = 1

-- ========== TAB SYSTEM ==========
local AllTabs = {}

local function SyncCanvas(page)
    local ll = page:FindFirstChildWhichIsA("UIListLayout")
    local pp = page:FindFirstChildWhichIsA("UIPadding")
    if ll then
        local extra = pp and (pp.PaddingTop.Offset + pp.PaddingBottom.Offset) or 0
        page.CanvasSize = UDim2.new(0, 0, 0, ll.AbsoluteContentSize.Y + extra + 10)
    end
end

local function MakeTab(label)
    local btn = Instance.new("TextButton", TabRow)
    btn.Size = UDim2.new(0, 68, 0, 24)
    btn.BackgroundColor3 = C.Surface
    btn.BackgroundTransparency = 1
    btn.Text = label
    btn.TextColor3 = C.TextDim
    btn.TextSize = 10
    btn.Font = Enum.Font.GothamSemibold
    btn.AutoButtonColor = false
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    local page = Instance.new("ScrollingFrame", ContentArea)
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = C.Accent
    page.ScrollBarImageTransparency = 0.5
    page.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.ScrollingEnabled = true
    page.Visible = false

    local ll = Instance.new("UIListLayout", page)
    ll.Padding = UDim.new(0, 7)
    ll.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ll.SortOrder = Enum.SortOrder.LayoutOrder

    local pp = Instance.new("UIPadding", page)
    pp.PaddingTop    = UDim.new(0, 10)
    pp.PaddingBottom = UDim.new(0, 12)
    pp.PaddingLeft   = UDim.new(0, 6)
    pp.PaddingRight  = UDim.new(0, 6)

    ll:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() SyncCanvas(page) end)

    local entry = {btn = btn, page = page}
    table.insert(AllTabs, entry)

    btn.MouseButton1Click:Connect(function()
        for _, t in pairs(AllTabs) do
            t.page.Visible = false
            TweenService:Create(t.btn, TweenInfo.new(0.12), {
                BackgroundTransparency = 1,
                TextColor3 = C.TextDim,
            }):Play()
        end
        page.Visible = true
        SyncCanvas(page)
        TweenService:Create(btn, TweenInfo.new(0.12), {
            BackgroundTransparency = 0,
            TextColor3 = C.Accent,
        }):Play()
    end)

    return page
end

local MainTab  = MakeTab("Main")
local SellTab  = MakeTab("Sell")
local CollTab  = MakeTab("Collect")
local UpTab    = MakeTab("Upgrade")
local ShopTab  = MakeTab("Shop")
local InfoTab  = MakeTab("Info")

-- ========== COMPONENTS ==========

local function Divider(parent, label)
    local wrap = Instance.new("Frame", parent)
    wrap.Size = UDim2.new(1, -4, 0, 18)
    wrap.BackgroundTransparency = 1

    local line = Instance.new("Frame", wrap)
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 0.5, 0)
    line.BackgroundColor3 = C.Border
    line.BorderSizePixel = 0

    if label then
        local bg = Instance.new("Frame", wrap)
        bg.Size = UDim2.new(0, #label * 6 + 14, 1, 0)
        bg.Position = UDim2.new(0, 8, 0, 0)
        bg.BackgroundColor3 = C.Surface
        bg.BorderSizePixel = 0

        local lbl = Instance.new("TextLabel", bg)
        lbl.Size = UDim2.new(1, 0, 1, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = label
        lbl.TextColor3 = C.AccentDim
        lbl.TextSize = 9
        lbl.Font = Enum.Font.GothamBold
    end
    return wrap
end

local function MakeButton(parent, text, cb)
    local card = Instance.new("Frame", parent)
    card.Size = UDim2.new(1, -4, 0, 34)
    card.BackgroundColor3 = C.Surface
    card.BorderSizePixel = 0
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 8)
    local cs = Instance.new("UIStroke", card)
    cs.Color = C.Border
    cs.Thickness = 1

    -- left accent mark
    local mark = Instance.new("Frame", card)
    mark.Size = UDim2.new(0, 2, 0.5, 0)
    mark.Position = UDim2.new(0, 0, 0.25, 0)
    mark.BackgroundColor3 = C.Accent
    mark.BorderSizePixel = 0
    Instance.new("UICorner", mark).CornerRadius = UDim.new(0, 2)

    local btn = Instance.new("TextButton", card)
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = text
    btn.TextColor3 = C.Text
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamSemibold
    btn.AutoButtonColor = false

    btn.MouseEnter:Connect(function()
        TweenService:Create(card, TweenInfo.new(0.1), {BackgroundColor3 = C.Raised}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(card, TweenInfo.new(0.1), {BackgroundColor3 = C.Surface}):Play()
    end)
    btn.MouseButton1Click:Connect(function()
        TweenService:Create(mark, TweenInfo.new(0.08), {BackgroundColor3 = C.Text}):Play()
        task.wait(0.12)
        TweenService:Create(mark, TweenInfo.new(0.12), {BackgroundColor3 = C.Accent}):Play()
        cb()
    end)
    return card
end

local function MakeToggle(parent, text, cb)
    local card = Instance.new("Frame", parent)
    card.Size = UDim2.new(1, -4, 0, 38)
    card.BackgroundColor3 = C.Surface
    card.BorderSizePixel = 0
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 8)
    local cs = Instance.new("UIStroke", card)
    cs.Color = C.Border
    cs.Thickness = 1

    local lbl = Instance.new("TextLabel", card)
    lbl.Size = UDim2.new(0.65, 0, 1, 0)
    lbl.Position = UDim2.new(0, 12, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = C.Text
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamSemibold
    lbl.TextXAlignment = Enum.TextXAlignment.Left

    local track = Instance.new("Frame", card)
    track.Size = UDim2.new(0, 40, 0, 20)
    track.Position = UDim2.new(1, -52, 0.5, -10)
    track.BackgroundColor3 = C.Raised
    track.BorderSizePixel = 0
    Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)
    local ts = Instance.new("UIStroke", track)
    ts.Color = C.Border
    ts.Thickness = 1

    local knob = Instance.new("Frame", track)
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = UDim2.new(0, 3, 0.5, -7)
    knob.BackgroundColor3 = C.TextDim
    knob.BorderSizePixel = 0
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local on = false
    local det = Instance.new("TextButton", card)
    det.Size = UDim2.new(1, 0, 1, 0)
    det.BackgroundTransparency = 1
    det.Text = ""

    det.MouseButton1Click:Connect(function()
        on = not on
        if on then
            TweenService:Create(track, TweenInfo.new(0.15), {BackgroundColor3 = C.Accent}):Play()
            TweenService:Create(ts, TweenInfo.new(0.15), {Color = C.Accent}):Play()
            TweenService:Create(knob, TweenInfo.new(0.15), {
                Position = UDim2.new(1, -17, 0.5, -7),
                BackgroundColor3 = C.Base,
            }):Play()
        else
            TweenService:Create(track, TweenInfo.new(0.15), {BackgroundColor3 = C.Raised}):Play()
            TweenService:Create(ts, TweenInfo.new(0.15), {Color = C.Border}):Play()
            TweenService:Create(knob, TweenInfo.new(0.15), {
                Position = UDim2.new(0, 3, 0.5, -7),
                BackgroundColor3 = C.TextDim,
            }):Play()
        end
        cb(on)
    end)
end

-- Dropdown: renders as floating overlay so it never affects page scroll
local function MakeDropdown(parent, label, opts, default, cb)
    local selected = default
    cb(selected)

    local card = Instance.new("Frame", parent)
    card.Size = UDim2.new(1, -4, 0, 34)
    card.BackgroundColor3 = C.Surface
    card.BorderSizePixel = 0
    card.ClipsDescendants = false
    card.ZIndex = 10
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 8)
    local cs = Instance.new("UIStroke", card)
    cs.Color = C.Border
    cs.Thickness = 1

    local labelL = Instance.new("TextLabel", card)
    labelL.Size = UDim2.new(0.5, 0, 1, 0)
    labelL.Position = UDim2.new(0, 12, 0, 0)
    labelL.BackgroundTransparency = 1
    labelL.Text = label
    labelL.TextColor3 = C.TextDim
    labelL.TextSize = 10
    labelL.Font = Enum.Font.GothamSemibold
    labelL.TextXAlignment = Enum.TextXAlignment.Left
    labelL.ZIndex = 11

    local valL = Instance.new("TextLabel", card)
    valL.Size = UDim2.new(0.45, -20, 1, 0)
    valL.Position = UDim2.new(0.5, 0, 0, 0)
    valL.BackgroundTransparency = 1
    valL.Text = selected
    valL.TextColor3 = C.Accent
    valL.TextSize = 10
    valL.Font = Enum.Font.GothamBold
    valL.TextXAlignment = Enum.TextXAlignment.Right
    valL.TextTruncate = Enum.TextTruncate.AtEnd
    valL.ZIndex = 11

    local arrow = Instance.new("TextLabel", card)
    arrow.Size = UDim2.new(0, 18, 1, 0)
    arrow.Position = UDim2.new(1, -20, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.Text = "v"
    arrow.TextColor3 = C.TextDim
    arrow.TextSize = 10
    arrow.Font = Enum.Font.GothamBold
    arrow.ZIndex = 11

    local topBtn = Instance.new("TextButton", card)
    topBtn.Size = UDim2.new(1, 0, 1, 0)
    topBtn.BackgroundTransparency = 1
    topBtn.Text = ""
    topBtn.ZIndex = 12
    topBtn.AutoButtonColor = false

    -- floating menu on ScreenGui
    local visibleRows = math.min(#opts, 7)
    local menuH = visibleRows * 28 + 8
    local menu = Instance.new("Frame", Gui)
    menu.BackgroundColor3 = Color3.fromRGB(22, 21, 18)
    menu.BorderSizePixel = 0
    menu.ZIndex = 300
    menu.Visible = false
    menu.Size = UDim2.new(0, 200, 0, menuH)
    Instance.new("UICorner", menu).CornerRadius = UDim.new(0, 8)
    local ms = Instance.new("UIStroke", menu)
    ms.Color = C.Border
    ms.Thickness = 1

    local scroll = Instance.new("ScrollingFrame", menu)
    scroll.Size = UDim2.new(1, 0, 1, 0)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel = 0
    scroll.ScrollBarThickness = 3
    scroll.ScrollBarImageColor3 = C.Accent
    scroll.CanvasSize = UDim2.new(0, 0, 0, #opts * 30 + 6)
    scroll.ZIndex = 301

    local sl = Instance.new("UIListLayout", scroll)
    sl.Padding = UDim.new(0, 2)
    local sp = Instance.new("UIPadding", scroll)
    sp.PaddingTop   = UDim.new(0, 4)
    sp.PaddingLeft  = UDim.new(0, 4)
    sp.PaddingRight = UDim.new(0, 4)

    for _, opt in ipairs(opts) do
        local ob = Instance.new("TextButton", scroll)
        ob.Size = UDim2.new(1, -8, 0, 26)
        ob.BackgroundColor3 = opt == selected and C.Raised or C.Surface
        ob.BackgroundTransparency = opt == selected and 0 or 0.5
        ob.Text = opt
        ob.TextColor3 = opt == selected and C.Accent or C.Text
        ob.TextSize = 10
        ob.Font = Enum.Font.GothamSemibold
        ob.AutoButtonColor = false
        ob.ZIndex = 302
        Instance.new("UICorner", ob).CornerRadius = UDim.new(0, 6)

        ob.MouseEnter:Connect(function()
            if ob.Text ~= selected then
                TweenService:Create(ob, TweenInfo.new(0.08), {BackgroundTransparency = 0}):Play()
            end
        end)
        ob.MouseLeave:Connect(function()
            if ob.Text ~= selected then
                TweenService:Create(ob, TweenInfo.new(0.08), {BackgroundTransparency = 0.5}):Play()
            end
        end)
        ob.MouseButton1Click:Connect(function()
            local prev = selected
            selected = opt
            valL.Text = opt
            cb(opt)
            menu.Visible = false
            arrow.Text = "v"
            -- update all option styles
            for _, child in pairs(scroll:GetChildren()) do
                if child:IsA("TextButton") then
                    local isNew = child.Text == opt
                    child.TextColor3 = isNew and C.Accent or C.Text
                    child.BackgroundTransparency = isNew and 0 or 0.5
                    child.BackgroundColor3 = isNew and C.Raised or C.Surface
                end
            end
        end)
    end

    local open = false
    topBtn.MouseButton1Click:Connect(function()
        open = not open
        if open then
            local abs = card.AbsolutePosition
            local sz  = card.AbsoluteSize
            menu.Position = UDim2.new(0, abs.X, 0, abs.Y + sz.Y + 4)
            menu.Size = UDim2.new(0, sz.X, 0, menuH)
            menu.Visible = true
            arrow.Text = "^"
        else
            menu.Visible = false
            arrow.Text = "v"
        end
    end)

    UserInputService.InputBegan:Connect(function(inp)
        if inp.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
        if not open then return end
        local mp = UserInputService:GetMouseLocation()
        local function inside(f)
            local p, s = f.AbsolutePosition, f.AbsoluteSize
            return mp.X >= p.X and mp.X <= p.X + s.X and mp.Y >= p.Y and mp.Y <= p.Y + s.Y
        end
        if not inside(menu) and not inside(card) then
            open = false
            menu.Visible = false
            arrow.Text = "v"
        end
    end)
end

-- Key-value info row used in Info tab
local function InfoRow(parent, key, value, accent)
    local row = Instance.new("Frame", parent)
    row.Size = UDim2.new(1, -4, 0, 30)
    row.BackgroundColor3 = C.Surface
    row.BorderSizePixel = 0
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 7)
    local rs = Instance.new("UIStroke", row)
    rs.Color = C.Border
    rs.Thickness = 1

    local k = Instance.new("TextLabel", row)
    k.Size = UDim2.new(0.5, 0, 1, 0)
    k.Position = UDim2.new(0, 10, 0, 0)
    k.BackgroundTransparency = 1
    k.Text = key
    k.TextColor3 = C.TextDim
    k.TextSize = 10
    k.Font = Enum.Font.Gotham
    k.TextXAlignment = Enum.TextXAlignment.Left

    local v = Instance.new("TextLabel", row)
    v.Size = UDim2.new(0.5, -12, 1, 0)
    v.Position = UDim2.new(0.5, 0, 0, 0)
    v.BackgroundTransparency = 1
    v.Text = value
    v.TextColor3 = accent or C.Text
    v.TextSize = 10
    v.Font = Enum.Font.GothamBold
    v.TextXAlignment = Enum.TextXAlignment.Right
end

-- =============================================
-- ================ POPULATE ==================
-- =============================================

-- MAIN
Divider(MainTab, "Teleport")
MakeButton(MainTab, "Safe Zone", function()
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if root then root.CFrame = CFrame.new(-32.8596268, 3.29802537, -49.8498993) end
end)

Divider(MainTab, "Brainrot Farm")
MakeDropdown(MainTab, "Zone", zoneList, "Common", function(v) getgenv().SelectedBrainrotZone = v end)
MakeToggle(MainTab, "Auto Farm Brainrots", function(s)
    getgenv().AutoFarmBrainrot = s
    if s then
        if not getgenv().BaseReturnCFrame then
            local r = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if r then getgenv().BaseReturnCFrame = r.CFrame end
        end
        task.spawn(function()
            while getgenv().AutoFarmBrainrot do
                pcall(function()
                    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    local zone = workspace:FindFirstChild("SpawnedBrainrots") and workspace.SpawnedBrainrots:FindFirstChild(ZoneMap[getgenv().SelectedBrainrotZone])
                    if root and zone then
                        for _, item in pairs(zone:GetChildren()) do
                            if not getgenv().AutoFarmBrainrot then break end
                            local pos = item:IsA("BasePart") and item.CFrame or (item:IsA("Model") and item:GetPivot())
                            if pos then root.CFrame = pos; task.wait(0.2); autoInteract(item); task.wait(0.3)
                                if getgenv().BaseReturnCFrame then root.CFrame = getgenv().BaseReturnCFrame end
                                task.wait(0.3)
                            end
                        end
                    end
                end)
                task.wait(0.5)
            end
        end)
    end
end)

Divider(MainTab, "Lucky Block Farm")
MakeDropdown(MainTab, "LB Zone", lbZoneList, "Common Lucky Block", function(v) getgenv().SelectedLBZone = v end)
MakeToggle(MainTab, "Auto Farm Lucky Blocks", function(s)
    getgenv().AutoFarmLB = s
    if s then
        if not getgenv().BaseReturnCFrame then
            local r = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if r then getgenv().BaseReturnCFrame = r.CFrame end
        end
        task.spawn(function()
            while getgenv().AutoFarmLB do
                pcall(function()
                    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    local zone = workspace:FindFirstChild("SpawnedBrainrots") and workspace.SpawnedBrainrots:FindFirstChild(LBZoneMap[getgenv().SelectedLBZone])
                    if root and zone then
                        for _, item in pairs(zone:GetChildren()) do
                            if not getgenv().AutoFarmLB then break end
                            local pos = item:IsA("BasePart") and item.CFrame or (item:IsA("Model") and item:GetPivot())
                            if pos then root.CFrame = pos; task.wait(0.2); autoInteract(item); task.wait(0.3)
                                if getgenv().BaseReturnCFrame then root.CFrame = getgenv().BaseReturnCFrame end
                                task.wait(0.3)
                            end
                        end
                    end
                end)
                task.wait(0.5)
            end
        end)
    end
end)

Divider(MainTab, "Misc")
MakeToggle(MainTab, "No Pickup Delay", function(s)
    getgenv().InstantInteract = s
    if s then
        task.spawn(function()
            while getgenv().InstantInteract do
                pcall(function()
                    for _, p in pairs(workspace:GetDescendants()) do
                        if p:IsA("ProximityPrompt") then p.HoldDuration = 0 end
                    end
                end)
                task.wait(1)
            end
        end)
    end
end)

-- SELL
Divider(SellTab, "Filters")
MakeDropdown(SellTab, "Rarity", RarityList, "Common", function(v) getgenv().SelectedSellRarity = v end)
MakeDropdown(SellTab, "Mutation", MutationList, "Normal", function(v) getgenv().SelectedMutation = v end)
Divider(SellTab, "Actions")
MakeToggle(SellTab, "Auto Sell by Rarity", function(s)
    getgenv().AutoSellRarity = s
    if s then
        task.spawn(function()
            while getgenv().AutoSellRarity do
                pcall(function()
                    local remote = getRemote("SellBrainrot")
                    local inv = player:FindFirstChild("Backpack")
                    local targets = BrainrotRarities[getgenv().SelectedSellRarity]
                    if remote and inv and targets then
                        for _, item in pairs(inv:GetChildren()) do
                            if table.find(targets, item.Name) then
                                task.spawn(function()
                                    for i = 1, 20 do remote:FireServer(item.Name, i, getgenv().SelectedMutation) end
                                end)
                            end
                        end
                    end
                end)
                task.wait(0.2)
            end
        end)
    end
end)
MakeToggle(SellTab, "Auto Sell All", function(s)
    getgenv().AutoSell = s
    if s then
        task.spawn(function()
            while getgenv().AutoSell do
                pcall(function()
                    local r = getRemote("SellAllBrainrots")
                    if r then r:FireServer() end
                end)
                task.wait(0.5)
            end
        end)
    end
end)

-- COLLECT
Divider(CollTab, "Plot")
MakeButton(CollTab, "Lock Nearest Plot", function()
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if root and workspace:FindFirstChild("Plots") then
        local closest, dist = nil, math.huge
        for _, plot in pairs(workspace.Plots:GetChildren()) do
            local d = (root.Position - plot:GetPivot().Position).Magnitude
            if d < dist then dist = d; closest = plot end
        end
        if closest then
            getgenv().SelectedPlot = closest.Name
            getgenv().BaseReturnCFrame = closest:GetPivot() * CFrame.new(0, 5, 0)
        end
    end
end)

Divider(CollTab, "Auto")
MakeToggle(CollTab, "Auto Collect Money", function(s)
    getgenv().AutoCollectMoney = s
    if s then
        task.spawn(function()
            while getgenv().AutoCollectMoney do
                pcall(function()
                    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    local plots = workspace:FindFirstChild("Plots")
                    if root and plots and getgenv().SelectedPlot then
                        local myPlot = plots:FindFirstChild(getgenv().SelectedPlot)
                        if myPlot and myPlot:FindFirstChild("Slots") then
                            for _, floor in pairs(myPlot.Slots:GetChildren()) do
                                for _, slot in pairs(floor:GetChildren()) do
                                    local cash = slot:FindFirstChild("CashButton")
                                    if cash then root.CFrame = cash:GetPivot(); task.wait(0.15) end
                                end
                            end
                            if getgenv().BaseReturnCFrame then root.CFrame = getgenv().BaseReturnCFrame end
                        end
                    end
                end)
                task.wait(1)
            end
        end)
    end
end)
MakeToggle(CollTab, "Auto Rebirth", function(s)
    getgenv().AutoRebirth = s
    if s then
        task.spawn(function()
            while getgenv().AutoRebirth do
                pcall(function()
                    local r = getRemote("RequestRebirth")
                    if r then r:FireServer() end
                end)
                task.wait(1)
            end
        end)
    end
end)

Divider(CollTab, "Gifting")
-- gift target row
local gCard = Instance.new("Frame", CollTab)
gCard.Size = UDim2.new(1, -4, 0, 34)
gCard.BackgroundColor3 = C.Surface
gCard.BorderSizePixel = 0
Instance.new("UICorner", gCard).CornerRadius = UDim.new(0, 8)
local gcs = Instance.new("UIStroke", gCard)
gcs.Color = C.Border
gcs.Thickness = 1
local gKey = Instance.new("TextLabel", gCard)
gKey.Size = UDim2.new(0.45, 0, 1, 0)
gKey.Position = UDim2.new(0, 12, 0, 0)
gKey.BackgroundTransparency = 1
gKey.Text = "Target"
gKey.TextColor3 = C.TextDim
gKey.TextSize = 10
gKey.Font = Enum.Font.GothamSemibold
gKey.TextXAlignment = Enum.TextXAlignment.Left
local gVal = Instance.new("TextLabel", gCard)
gVal.Size = UDim2.new(0.55, -12, 1, 0)
gVal.Position = UDim2.new(0.45, 0, 0, 0)
gVal.BackgroundTransparency = 1
gVal.Text = "none"
gVal.TextColor3 = C.Accent
gVal.TextSize = 10
gVal.Font = Enum.Font.GothamBold
gVal.TextXAlignment = Enum.TextXAlignment.Right
local gClick = Instance.new("TextButton", gCard)
gClick.Size = UDim2.new(1, 0, 1, 0)
gClick.BackgroundTransparency = 1
gClick.Text = ""
gClick.MouseButton1Click:Connect(function()
    local list = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player then table.insert(list, p.Name) end
    end
    if #list == 0 then gVal.Text = "none"; return end
    local cur = getgenv().SelectedGiftPlayer
    local idx = 1
    for i, n in ipairs(list) do if n == cur then idx = i % #list + 1; break end end
    getgenv().SelectedGiftPlayer = list[idx]
    gVal.Text = list[idx]
end)

MakeButton(CollTab, "Teleport & Gift", function()
    local target = getgenv().SelectedGiftPlayer
    if target and Players:FindFirstChild(target) and Players[target].Character then
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = Players[target].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
            task.wait(0.5)
            local r = getRemote("GiftBrainrot")
            if r then r:FireServer(target) end
            task.wait(0.5)
            if getgenv().BaseReturnCFrame then root.CFrame = getgenv().BaseReturnCFrame end
        end
    end
end)

-- UPGRADE
Divider(UpTab, "Upgrades")
MakeToggle(UpTab, "Auto Upgrade", function(s)
    getgenv().AutoUpgrade = s
    if s then
        task.spawn(function()
            while getgenv().AutoUpgrade do
                pcall(function()
                    local remote = getRemote("UpgradeBrainrot")
                    local plots = workspace:FindFirstChild("Plots")
                    if remote and plots and getgenv().SelectedPlot then
                        local myPlot = plots:FindFirstChild(getgenv().SelectedPlot)
                        if myPlot and myPlot:FindFirstChild("Slots") then
                            for _, floor in pairs(myPlot.Slots:GetChildren()) do
                                for _, slot in pairs(floor:GetChildren()) do
                                    task.spawn(function()
                                        remote:FireServer(slot)
                                        local actual = slot:FindFirstChild("Slot")
                                        if actual then remote:FireServer(actual) end
                                    end)
                                end
                            end
                        end
                    end
                end)
                task.wait(0.2)
            end
        end)
    end
end)

-- SHOP
Divider(ShopTab, "Boosts")
MakeToggle(ShopTab, "Auto Buy Boost x1", function(s)
    getgenv().AutoBuyBoost = s
    if s then
        task.spawn(function()
            while getgenv().AutoBuyBoost do
                pcall(function()
                    local r = getRemote("BuyUpgrade")
                    if r then r:FireServer("Boost", 1) end
                end)
                task.wait(0.5)
            end
        end)
    end
end)

Divider(ShopTab, "Speed")
MakeToggle(ShopTab, "Auto Buy Speed x1", function(s)
    getgenv().AutoBuySpeed1 = s
    if s then
        task.spawn(function()
            while getgenv().AutoBuySpeed1 do
                pcall(function()
                    local r = getRemote("BuyUpgrade")
                    if r then r:FireServer("Speed", 1) end
                end)
                task.wait(0.5)
            end
        end)
    end
end)
MakeToggle(ShopTab, "Auto Buy Speed x5", function(s)
    getgenv().AutoBuySpeed5 = s
    if s then
        task.spawn(function()
            while getgenv().AutoBuySpeed5 do
                pcall(function()
                    local r = getRemote("BuyUpgrade")
                    if r then r:FireServer("Speed", 5) end
                end)
                task.wait(0.5)
            end
        end)
    end
end)

Divider(ShopTab, "Other")
MakeButton(ShopTab, "Buy Carry x1", function()
    local r = getRemote("BuyUpgrade")
    if r then r:FireServer("Carry", 1) end
end)

Divider(ShopTab, "Rollers")
MakeDropdown(ShopTab, "Roller", rollerOptions, "Red", function(v) getgenv().SelectedRoller = v end)
MakeButton(ShopTab, "Buy Selected Roller", function()
    local r = getRemote("BuyRoller")
    if r and getgenv().SelectedRoller then r:FireServer(getgenv().SelectedRoller .. "Rollers") end
end)

-- INFO
-- header block
local hBlock = Instance.new("Frame", InfoTab)
hBlock.Size = UDim2.new(1, -4, 0, 64)
hBlock.BackgroundColor3 = C.Surface
hBlock.BorderSizePixel = 0
Instance.new("UICorner", hBlock).CornerRadius = UDim.new(0, 10)
local hbs = Instance.new("UIStroke", hBlock)
hbs.Color = C.Border
hbs.Thickness = 1
-- left amber bar
local hBar = Instance.new("Frame", hBlock)
hBar.Size = UDim2.new(0, 3, 0.6, 0)
hBar.Position = UDim2.new(0, 0, 0.2, 0)
hBar.BackgroundColor3 = C.Accent
hBar.BorderSizePixel = 0
Instance.new("UICorner", hBar).CornerRadius = UDim.new(0, 2)
local hTitle = Instance.new("TextLabel", hBlock)
hTitle.Size = UDim2.new(1, -16, 0, 30)
hTitle.Position = UDim2.new(0, 14, 0, 10)
hTitle.BackgroundTransparency = 1
hTitle.Text = "Jake's Hub"
hTitle.TextColor3 = C.Text
hTitle.TextSize = 20
hTitle.Font = Enum.Font.GothamBlack
hTitle.TextXAlignment = Enum.TextXAlignment.Left
local hSub = Instance.new("TextLabel", hBlock)
hSub.Size = UDim2.new(1, -16, 0, 16)
hSub.Position = UDim2.new(0, 14, 0, 38)
hSub.BackgroundTransparency = 1
hSub.Text = "brainrot roller  —  version 3"
hSub.TextColor3 = C.AccentDim
hSub.TextSize = 10
hSub.Font = Enum.Font.Gotham
hSub.TextXAlignment = Enum.TextXAlignment.Left

Divider(InfoTab, "Details")
InfoRow(InfoTab, "Game",     "Brainrot Roller")
InfoRow(InfoTab, "Executor", "Universal")
InfoRow(InfoTab, "Features", "Farm / Sell / Shop")
InfoRow(InfoTab, "YouTube",  "@jakeshub", C.Accent)
InfoRow(InfoTab, "Version",  "v3", C.AccentDim)

Divider(InfoTab, "Brainrot Zones")
for _, rarity in ipairs(RarityList) do
    local count = BrainrotRarities[rarity] and #BrainrotRarities[rarity] or 0
    InfoRow(InfoTab, rarity, count .. " variants", C.TextDim)
end

-- ========== ACTIVATE FIRST TAB ==========
AllTabs[1].page.Visible = true
TweenService:Create(AllTabs[1].btn, TweenInfo.new(0), {
    BackgroundTransparency = 0,
    TextColor3 = C.Accent,
}):Play()
SyncCanvas(AllTabs[1].page)

-- toggle pulse (very subtle)
task.spawn(function()
    while true do
        TweenService:Create(toggleStroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = C.Accent}):Play()
        task.wait(1.2)
        TweenService:Create(toggleStroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = C.Border}):Play()
        task.wait(1.2)
    end
end)

print("[Jake's Hub v3] Loaded")
