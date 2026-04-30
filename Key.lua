local Config = {
    ServiceId       = 24669,
    PlatoSecret     = "13196169-eda2-434b-a6de-67808530f921",
    Secret          = "poopie",
    MainScriptURL   = "https://raw.githubusercontent.com/jakeeypoop-max/Roller-For-brainrots/refs/heads/main/Script.lua",
    ShowYoutube     = false,
    YoutubeURL      = "https://www.youtube.com/channel/UCAlXXV1Hbvf7WbfXARuVtiQ",
    KeyFileName     = "Mykey.txt",
    OldGuiName      = "Jake's hub ",
    MainGuiName     = "Jake's hub",
    HubName         = "Jake's Hub",
    HubDescription  = "brainrot roller control"
}

-------------------------------------------------------------------------------
--! LIBRARIES (JSON & CRYPTOGRAPHY) - DO NOT MODIFY
-------------------------------------------------------------------------------
local a=2^32;local b=a-1;local function c(d,e)local f,g=0,1;while d~=0 or e~=0 do local h,i=d%2,e%2;local j=(h+i)%2;f=f+j*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return f%a end;local function k(d,e,l,...)local m;if e then d=d%a;e=e%a;m=c(d,e)if l then m=k(m,l,...)end;return m elseif d then return d%a else return 0 end end;local function n(d,e,l,...)local m;if e then d=d%a;e=e%a;m=(d+e-c(d,e))/2;if l then m=n(m,l,...)end;return m elseif d then return d%a else return b end end;local function o(p)return b-p end;local function q(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function s(p,r)if r>31 or r<-31 then return 0 end;return q(p%a,r)end;local function lshift(d,r)if r<0 then return s(d,-r)end;return d*2^r%2^32 end;local function t(p,r)p=p%a;r=r%32;local u=n(p,2^r-1)return s(p,r)+lshift(u,32-r)end;local v={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(x)return string.gsub(x,".",function(l)return string.format("%02x",string.byte(l))end)end;local function y(z,A)local x=""for B=1,A do local C=z%256;x=string.char(C)..x;z=(z-C)/256 end;return x end;local function D(x,B)local A=0;for B=B,B+3 do A=A*256+string.byte(x,B)end;return A end;local function E(F,G)local H=64-(G+9)%64;G=y(8*G,8)F=F.."\128"..string.rep("\0",H)..G;assert(#F%64==0)return F end;local function I(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function K(F,B,J)local L={}for M=1,16 do L[M]=D(F,B+(M-1)*4)end;for M=17,64 do local N=L[M-15]local O=k(t(N,7),t(N,18),s(N,3))N=L[M-2]L[M]=(L[M-16]+O+L[M-7]+k(t(N,17),t(N,19),s(N,10)))%a end;local d,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local O=k(t(d,2),t(d,13),t(d,22))local U=k(n(d,e),n(d,l),n(e,l))local V=(O+U)%a;local W=k(t(Q,6),t(Q,11),t(Q,25))local X=k(n(Q,R),n(o(Q),S))local Y=(T+W+X+v[B]+L[B])%a;T=S;S=R;R=Q;Q=(P+Y)%a;P=l;l=e;e=d;d=(Y+V)%a end;J[1]=(J[1]+d)%a;J[2]=(J[2]+e)%a;J[3]=(J[3]+l)%a;J[4]=(J[4]+P)%a;J[5]=(J[5]+Q)%a;J[6]=(J[6]+R)%a;J[7]=(J[7]+S)%a;J[8]=(J[8]+T)%a end;local function Z(F)F=E(F,#F)local J=I({})for B=1,#F,64 do K(F,B,J)end;return w(y(J[1],4)..y(J[2],4)..y(J[3],4)..y(J[4],4)..y(J[5],4)..y(J[6],4)..y(J[7],4)..y(J[8],4))end;local e;local l={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local P={["/"]="/"}for Q,R in pairs(l)do P[R]=Q end;local S=function(T)return"\\"..(l[T]or string.format("u%04x",T:byte()))end;local B=function(M)return"null"end;local v=function(M,z)local _={}z=z or{}if z[M]then error("circular reference")end;z[M]=true;if rawget(M,1)~=nil or next(M)==nil then local A=0;for Q in pairs(M)do if type(Q)~="number"then error("invalid table: mixed or invalid key types")end;A=A+1 end;if A~=#M then error("invalid table: sparse array")end;for a0,R in ipairs(M)do table.insert(_,e(R,z))end;z[M]=nil;return"["..table.concat(_,",").."]"else for Q,R in pairs(M)do if type(Q)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(_,e(Q,z)..":"..e(R,z))end;z[M]=nil;return"{"..table.concat(_,",").."}"end end;local g=function(M)return'"'..M:gsub('[%z\1-\31\\\"]',S)..'"'end;local a1=function(M)if M~=M or M<=-math.huge or M>=math.huge then error("unexpected number value '"..tostring(M).."'")end;return string.format("%.14g",M)end;local j={["nil"]=B,["table"]=v,["string"]=g,["number"]=a1,["boolean"]=tostring}e=function(M,z)local x=type(M)local a2=j[x]if a2 then return a2(M,z)end;error("unexpected type '"..x.."'")end;local a3=function(M)return e(M)end;local a4;local N=function(...)local _={}for a0=1,select("#",...)do _[select(a0,...)]=true end;return _ end;local L=N(" ","\t","\r","\n")local p=N(" ","\t","\r","\n","]","}",",")local a5=N("\\","/",'"',"b","f","n","r","t","u")local m=N("true","false","null")local a6={["true"]=true,["false"]=false,["null"]=nil}local a7=function(a8,a9,aa,ab)for a0=a9,#a8 do if aa[a8:sub(a0,a0)]~=ab then return a0 end end;return#a8+1 end;local ac=function(a8,a9,J)local ad=1;local ae=1;for a0=1,a9-1 do ae=ae+1;if a8:sub(a0,a0)=="\n"then ad=ad+1;ae=1 end end;error(string.format("%s at line %d col %d",J,ad,ae))end;local af=function(A)local a2=math.floor;if A<=0x7f then return string.char(A)elseif A<=0x7ff then return string.char(a2(A/64)+192,A%64+128)elseif A<=0xffff then return string.char(a2(A/4096)+224,a2(A%4096/64)+128,A%64+128)elseif A<=0x10ffff then return string.char(a2(A/262144)+240,a2(A%262144/4096)+128,a2(A%4096/64)+128,A%64+128)end;error(string.format("invalid unicode codepoint '%x'",A))end;local ag=function(ah)local ai=tonumber(ah:sub(1,4),16)local aj=tonumber(ah:sub(7,10),16)if aj then return af((ai-0xd800)*0x400+aj-0xdc00+0x10000)else return af(ai)end end;local ak=function(a8,a0)local _=""local al=a0+1;local Q=al;while al<=#a8 do local am=a8:byte(al)if am<32 then ac(a8,al,"control character in string")elseif am==92 then _=_..a8:sub(Q,al-1)al=al+1;local T=a8:sub(al,al)if T=="u"then local an=a8:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",al+1)or a8:match("^%x%x%x%x",al+1)or ac(a8,al-1,"invalid unicode escape in string")_=_..ag(an)al=al+#an else if not a5[T]then ac(a8,al-1,"invalid escape char '"..T.."' in string")end;_=_..P[T]end;Q=al+1 elseif am==34 then _=_..a8:sub(Q,al-1)return _,al+1 end;al=al+1 end;ac(a8,a0,"expected closing quote for string")end;local ao=function(a8,a0)local am=a7(a8,a0,p)local ah=a8:sub(a0,am-1)local A=tonumber(ah)if not A then ac(a8,a0,"invalid number '"..ah.."'")end;return A,am end;local ap=function(a8,a0)local am=a7(a8,a0,p)local aq=a8:sub(a0,am-1)if not m[aq]then ac(a8,a0,"invalid literal '"..aq.."'")end;return a6[aq],am end;local ar=function(a8,a0)local _={}local A=1;a0=a0+1;while 1 do local am;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="]"then a0=a0+1;break end;am,a0=a4(a8,a0)_[A]=am;A=A+1;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="]"then break end;if as~=","then ac(a8,a0,"expected ']' or ','")end end;return _,a0 end;local at=function(a8,a0)local _={}a0=a0+1;while 1 do local au,M;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="}"then a0=a0+1;break end;if a8:sub(a0,a0)~='"'then ac(a8,a0,"expected string for key")end;au,a0=a4(a8,a0)a0=a7(a8,a0,L,true)if a8:sub(a0,a0)~=":"then ac(a8,a0,"expected ':' after key")end;a0=a7(a8,a0+1,L,true)M,a0=a4(a8,a0)_[au]=M;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="}"then break end;if as~=","then ac(a8,a0,"expected '}' or ','")end end;return _,a0 end;local av={['"']=ak,["0"]=ao,["1"]=ao,["2"]=ao,["3"]=ao,["4"]=ao,["5"]=ao,["6"]=ao,["7"]=ao,["8"]=ao,["9"]=ao,["-"]=ao,["t"]=ap,["f"]=ap,["n"]=ap,["["]=ar,["{"]=at}a4=function(a8,a9)local as=a8:sub(a9,a9)local a2=av[as]if a2 then return a2(a8,a9)end;ac(a8,a9,"unexpected character '"..as.."'")end;local aw=function(a8)if type(a8)~="string"then error("expected argument of type string, got "..type(a8))end;local _,a9=a4(a8,a7(a8,1,L,true))a9=a7(a8,a9,L,true)if a9<=#a8 then ac(a8,a9,"trailing garbage")end;return _ end;
local lEncode, lDecode, lDigest = a3, aw, Z

-------------------------------------------------------------------------------
--! CORE FUNCTIONS
-------------------------------------------------------------------------------

local useNonce = true

local function safeRequest(options)
    local req = request or http_request or syn_request or (http and http.request)
    if not req then return nil, "HTTP not supported" end
    local ok, res = pcall(function() return req(options) end)
    if ok and res then return res else return nil, "Connection Error" end
end

local fSetClipboard = setclipboard or toclipboard or function() end
local fStringChar, fToString, fOsTime, fMathRandom, fMathFloor =
    string.char, tostring, os.time, math.random, math.floor
local fGetHwid = gethwid or function()
    return game:GetService("RbxAnalyticsService"):GetClientId()
end

local cachedLink, cachedTime = "", 0
local host = "https://api.platoboost.com"

local function checkConnectivity()
    local res = safeRequest({ Url = host .. "/public/connectivity", Method = "GET" })
    if not res or (res.StatusCode ~= 200 and res.StatusCode ~= 429) then
        host = "https://api.platoboost.net"
    end
end
checkConnectivity()

local function generateNonce()
    local str = ""
    for _ = 1, 16 do
        str = str .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97)
    end
    return str
end

local function cacheLink()
    if cachedTime + (10 * 60) < fOsTime() then
        local res, err = safeRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = lEncode({ service = Config.ServiceId, identifier = lDigest(fGetHwid()) }),
            Headers = { ["Content-Type"] = "application/json" }
        })
        if res and res.StatusCode == 200 then
            local decoded = lDecode(res.Body)
            if decoded.success then
                cachedLink = decoded.data.url
                cachedTime = fOsTime()
                return true, cachedLink
            end
        end
        return false, err or "Server Unreachable"
    end
    return true, cachedLink
end

local function redeemKey(key)
    local nonce = generateNonce()
    local body = { identifier = lDigest(fGetHwid()), key = key }
    if useNonce then body.nonce = nonce end

    local res, err = safeRequest({
        Url = host .. "/public/redeem/" .. fToString(Config.ServiceId),
        Method = "POST",
        Body = lEncode(body),
        Headers = { ["Content-Type"] = "application/json" }
    })

    if res and res.StatusCode == 200 then
        local decoded = lDecode(res.Body)
        if decoded.success and decoded.data.valid then
            if useNonce then
                if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. Config.PlatoSecret) then
                    if writefile then writefile(Config.KeyFileName, key) end
                    return true, "Success"
                end
                return false, "Integrity Check Failed"
            end
            if writefile then writefile(Config.KeyFileName, key) end
            return true, "Success"
        end
        return false, decoded.message or "Invalid Key"
    end
    return false, err or "Server Error"
end

-------------------------------------------------------------------------------
--! GUI
-------------------------------------------------------------------------------

local function StartMainScript()
    local player = game:GetService("Players").LocalPlayer
    local pGui   = player:WaitForChild("PlayerGui")
    if pGui:FindFirstChild(Config.OldGuiName) then
        pGui[Config.OldGuiName]:Destroy()
        task.wait(0.1)
    end
    _G[Config.Secret] = true
    loadstring(game:HttpGet(Config.MainScriptURL))()
end

local function CreateGUI()
    local Players  = game:GetService("Players")
    local CoreGui  = game:GetService("CoreGui")
    local TweenSvc = game:GetService("TweenService")
    local player   = Players.LocalPlayer

    local ok, parent = pcall(function() return CoreGui end)
    if not ok then parent = player:WaitForChild("PlayerGui") end

    if parent:FindFirstChild("JKS_KeySystem") then
        parent.JKS_KeySystem:Destroy()
    end

    -- ===== THEME (matches Jake's Hub v3) =====
    local C = {
        Base      = Color3.fromRGB(13, 12, 11),
        Surface   = Color3.fromRGB(20, 19, 17),
        Raised    = Color3.fromRGB(28, 27, 24),
        Border    = Color3.fromRGB(45, 42, 38),
        Accent    = Color3.fromRGB(210, 170, 90),
        AccentDim = Color3.fromRGB(140, 110, 55),
        Text      = Color3.fromRGB(232, 225, 210),
        TextDim   = Color3.fromRGB(130, 122, 108),
        Red       = Color3.fromRGB(210, 80, 70),
        Green     = Color3.fromRGB(100, 185, 110),
        YTRed     = Color3.fromRGB(200, 50, 50),
    }

    -- helper: subtle hover tween
    local function hover(frame, on)
        TweenSvc:Create(frame, TweenInfo.new(0.1), {
            BackgroundColor3 = on and C.Raised or C.Surface
        }):Play()
    end

    -- ===== SCREEN GUI =====
    local Gui = Instance.new("ScreenGui", parent)
    Gui.Name = "JKS_KeySystem"
    Gui.ResetOnSpawn = false
    Gui.DisplayOrder = 9999

    -- ===== MAIN FRAME =====
    -- Height adjusts dynamically: base is 300, +48 if YouTube shown
    local frameH = Config.ShowYoutube and 352 or 304

    local Frame = Instance.new("Frame", Gui)
    Frame.Name = "MainFrame"
    Frame.Size = UDim2.new(0, 320, 0, frameH)
    Frame.Position = UDim2.new(0.5, -160, 0.5, -frameH / 2)
    Frame.BackgroundColor3 = C.Base
    Frame.BorderSizePixel = 0
    Frame.Active = true
    Frame.Draggable = true
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)
    local fStroke = Instance.new("UIStroke", Frame)
    fStroke.Color = C.Border
    fStroke.Thickness = 1

    -- ===== TOP BAR =====
    local TopBar = Instance.new("Frame", Frame)
    TopBar.Size = UDim2.new(1, 0, 0, 44)
    TopBar.BackgroundColor3 = C.Surface
    TopBar.BorderSizePixel = 0
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 12)
    -- patch bottom corners
    local TBFix = Instance.new("Frame", TopBar)
    TBFix.Size = UDim2.new(1, 0, 0.5, 0)
    TBFix.Position = UDim2.new(0, 0, 0.5, 0)
    TBFix.BackgroundColor3 = C.Surface
    TBFix.BorderSizePixel = 0
    -- thin separator
    local Sep = Instance.new("Frame", TopBar)
    Sep.Size = UDim2.new(1, 0, 0, 1)
    Sep.Position = UDim2.new(0, 0, 1, -1)
    Sep.BackgroundColor3 = C.Border
    Sep.BorderSizePixel = 0

    -- amber side mark
    local Mark = Instance.new("Frame", TopBar)
    Mark.Size = UDim2.new(0, 3, 0.5, 0)
    Mark.Position = UDim2.new(0, 0, 0.25, 0)
    Mark.BackgroundColor3 = C.Accent
    Mark.BorderSizePixel = 0
    Instance.new("UICorner", Mark).CornerRadius = UDim.new(0, 2)

    local TitleLbl = Instance.new("TextLabel", TopBar)
    TitleLbl.Size = UDim2.new(0.7, 0, 1, 0)
    TitleLbl.Position = UDim2.new(0, 14, 0, 0)
    TitleLbl.BackgroundTransparency = 1
    TitleLbl.Text = Config.HubName
    TitleLbl.TextColor3 = C.Text
    TitleLbl.TextSize = 14
    TitleLbl.Font = Enum.Font.GothamBold
    TitleLbl.TextXAlignment = Enum.TextXAlignment.Left

    -- close button
    local CloseBtn = Instance.new("TextButton", TopBar)
    CloseBtn.Size = UDim2.new(0, 26, 0, 26)
    CloseBtn.Position = UDim2.new(1, -32, 0.5, -13)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(50, 22, 20)
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = C.Red
    CloseBtn.TextSize = 12
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.AutoButtonColor = false
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 7)
    CloseBtn.MouseButton1Click:Connect(function() Gui:Destroy() end)

    -- ===== BODY LAYOUT (UIPadding + UIListLayout for clean stacking) =====
    local Body = Instance.new("Frame", Frame)
    Body.Size = UDim2.new(1, 0, 1, -44)
    Body.Position = UDim2.new(0, 0, 0, 44)
    Body.BackgroundTransparency = 1
    Body.BorderSizePixel = 0

    local BLL = Instance.new("UIListLayout", Body)
    BLL.Padding = UDim.new(0, 8)
    BLL.HorizontalAlignment = Enum.HorizontalAlignment.Center
    BLL.VerticalAlignment = Enum.VerticalAlignment.Top
    BLL.SortOrder = Enum.SortOrder.LayoutOrder

    local BPad = Instance.new("UIPadding", Body)
    BPad.PaddingTop    = UDim.new(0, 14)
    BPad.PaddingBottom = UDim.new(0, 14)
    BPad.PaddingLeft   = UDim.new(0, 14)
    BPad.PaddingRight  = UDim.new(0, 14)

    -- subtitle / description row
    local DescLbl = Instance.new("TextLabel", Body)
    DescLbl.LayoutOrder = 1
    DescLbl.Size = UDim2.new(1, 0, 0, 18)
    DescLbl.BackgroundTransparency = 1
    DescLbl.Text = Config.HubDescription
    DescLbl.TextColor3 = C.AccentDim
    DescLbl.TextSize = 11
    DescLbl.Font = Enum.Font.Gotham
    DescLbl.TextXAlignment = Enum.TextXAlignment.Left

    -- thin divider line
    local function MakeLine(order)
        local l = Instance.new("Frame", Body)
        l.LayoutOrder = order
        l.Size = UDim2.new(1, 0, 0, 1)
        l.BackgroundColor3 = C.Border
        l.BorderSizePixel = 0
    end
    MakeLine(2)

    -- ===== YOUTUBE BUTTON (optional) =====
    if Config.ShowYoutube then
        local YTCard = Instance.new("Frame", Body)
        YTCard.LayoutOrder = 3
        YTCard.Size = UDim2.new(1, 0, 0, 38)
        YTCard.BackgroundColor3 = C.Surface
        YTCard.BorderSizePixel = 0
        Instance.new("UICorner", YTCard).CornerRadius = UDim.new(0, 8)
        local yts = Instance.new("UIStroke", YTCard)
        yts.Color = C.Border
        yts.Thickness = 1

        -- YT red left bar
        local ytBar = Instance.new("Frame", YTCard)
        ytBar.Size = UDim2.new(0, 3, 0.5, 0)
        ytBar.Position = UDim2.new(0, 0, 0.25, 0)
        ytBar.BackgroundColor3 = C.YTRed
        ytBar.BorderSizePixel = 0
        Instance.new("UICorner", ytBar).CornerRadius = UDim.new(0, 2)

        local YTIcon = Instance.new("ImageLabel", YTCard)
        YTIcon.Size = UDim2.new(0, 18, 0, 18)
        YTIcon.Position = UDim2.new(0, 12, 0.5, -9)
        YTIcon.BackgroundTransparency = 1
        YTIcon.Image = "rbxassetid://82532989017804"

        local YTLbl = Instance.new("TextLabel", YTCard)
        YTLbl.Size = UDim2.new(0.6, 0, 1, 0)
        YTLbl.Position = UDim2.new(0, 36, 0, 0)
        YTLbl.BackgroundTransparency = 1
        YTLbl.Text = "Subscribe"
        YTLbl.TextColor3 = C.Text
        YTLbl.TextSize = 11
        YTLbl.Font = Enum.Font.GothamSemibold
        YTLbl.TextXAlignment = Enum.TextXAlignment.Left

        local YTHint = Instance.new("TextLabel", YTCard)
        YTHint.Size = UDim2.new(0.35, 0, 1, 0)
        YTHint.Position = UDim2.new(0.65, 0, 0, 0)
        YTHint.BackgroundTransparency = 1
        YTHint.Text = "copy link"
        YTHint.TextColor3 = C.TextDim
        YTHint.TextSize = 9
        YTHint.Font = Enum.Font.Gotham
        YTHint.TextXAlignment = Enum.TextXAlignment.Right

        local YTBtn = Instance.new("TextButton", YTCard)
        YTBtn.Size = UDim2.new(1, 0, 1, 0)
        YTBtn.BackgroundTransparency = 1
        YTBtn.Text = ""
        YTBtn.AutoButtonColor = false
        YTBtn.MouseEnter:Connect(function() hover(YTCard, true) end)
        YTBtn.MouseLeave:Connect(function() hover(YTCard, false) end)
        YTBtn.MouseButton1Click:Connect(function()
            fSetClipboard(Config.YoutubeURL)
            YTHint.Text = "copied!"
            YTHint.TextColor3 = C.Green
            task.wait(1.5)
            YTHint.Text = "copy link"
            YTHint.TextColor3 = C.TextDim
        end)

        MakeLine(4)
    end

    -- ===== KEY INPUT =====
    local InputCard = Instance.new("Frame", Body)
    InputCard.LayoutOrder = 5
    InputCard.Size = UDim2.new(1, 0, 0, 40)
    InputCard.BackgroundColor3 = C.Surface
    InputCard.BorderSizePixel = 0
    Instance.new("UICorner", InputCard).CornerRadius = UDim.new(0, 8)
    local ics = Instance.new("UIStroke", InputCard)
    ics.Color = C.Border
    ics.Thickness = 1

    local KeyBox = Instance.new("TextBox", InputCard)
    KeyBox.Size = UDim2.new(1, -16, 1, 0)
    KeyBox.Position = UDim2.new(0, 10, 0, 0)
    KeyBox.BackgroundTransparency = 1
    KeyBox.PlaceholderText = "Enter key..."
    KeyBox.PlaceholderColor3 = C.TextDim
    KeyBox.Text = ""
    KeyBox.TextColor3 = C.Text
    KeyBox.TextSize = 11
    KeyBox.Font = Enum.Font.GothamSemibold
    KeyBox.ClearTextOnFocus = false
    KeyBox.TextXAlignment = Enum.TextXAlignment.Left
    -- glow border on focus
    KeyBox.Focused:Connect(function()
        TweenSvc:Create(ics, TweenInfo.new(0.15), { Color = C.AccentDim }):Play()
    end)
    KeyBox.FocusLost:Connect(function()
        TweenSvc:Create(ics, TweenInfo.new(0.15), { Color = C.Border }):Play()
    end)

    -- ===== BUTTON ROW =====
    local BtnRow = Instance.new("Frame", Body)
    BtnRow.LayoutOrder = 6
    BtnRow.Size = UDim2.new(1, 0, 0, 38)
    BtnRow.BackgroundTransparency = 1
    BtnRow.BorderSizePixel = 0

    local BtnLL = Instance.new("UIListLayout", BtnRow)
    BtnLL.FillDirection = Enum.FillDirection.Horizontal
    BtnLL.HorizontalAlignment = Enum.HorizontalAlignment.Center
    BtnLL.VerticalAlignment = Enum.VerticalAlignment.Center
    BtnLL.Padding = UDim.new(0, 8)

    -- Verify button (amber accent)
    local VerifyCard = Instance.new("Frame", BtnRow)
    VerifyCard.Size = UDim2.new(0, 134, 0, 38)
    VerifyCard.BackgroundColor3 = C.Surface
    VerifyCard.BorderSizePixel = 0
    Instance.new("UICorner", VerifyCard).CornerRadius = UDim.new(0, 8)
    local vcs = Instance.new("UIStroke", VerifyCard)
    vcs.Color = C.AccentDim
    vcs.Thickness = 1

    -- amber left bar
    local vBar = Instance.new("Frame", VerifyCard)
    vBar.Size = UDim2.new(0, 3, 0.5, 0)
    vBar.Position = UDim2.new(0, 0, 0.25, 0)
    vBar.BackgroundColor3 = C.Accent
    vBar.BorderSizePixel = 0
    Instance.new("UICorner", vBar).CornerRadius = UDim.new(0, 2)

    local VerifyBtn = Instance.new("TextButton", VerifyCard)
    VerifyBtn.Size = UDim2.new(1, 0, 1, 0)
    VerifyBtn.BackgroundTransparency = 1
    VerifyBtn.Text = "Verify"
    VerifyBtn.TextColor3 = C.Accent
    VerifyBtn.TextSize = 11
    VerifyBtn.Font = Enum.Font.GothamBold
    VerifyBtn.AutoButtonColor = false
    VerifyBtn.MouseEnter:Connect(function() hover(VerifyCard, true) end)
    VerifyBtn.MouseLeave:Connect(function() hover(VerifyCard, false) end)

    -- Get Key button (muted)
    local GetKeyCard = Instance.new("Frame", BtnRow)
    GetKeyCard.Size = UDim2.new(0, 134, 0, 38)
    GetKeyCard.BackgroundColor3 = C.Surface
    GetKeyCard.BorderSizePixel = 0
    Instance.new("UICorner", GetKeyCard).CornerRadius = UDim.new(0, 8)
    local gcs2 = Instance.new("UIStroke", GetKeyCard)
    gcs2.Color = C.Border
    gcs2.Thickness = 1

    local GetKeyBtn = Instance.new("TextButton", GetKeyCard)
    GetKeyBtn.Size = UDim2.new(1, 0, 1, 0)
    GetKeyBtn.BackgroundTransparency = 1
    GetKeyBtn.Text = "Get Key"
    GetKeyBtn.TextColor3 = C.TextDim
    GetKeyBtn.TextSize = 11
    GetKeyBtn.Font = Enum.Font.GothamSemibold
    GetKeyBtn.AutoButtonColor = false
    GetKeyBtn.MouseEnter:Connect(function()
        hover(GetKeyCard, true)
        TweenSvc:Create(GetKeyBtn, TweenInfo.new(0.1), { TextColor3 = C.Text }):Play()
    end)
    GetKeyBtn.MouseLeave:Connect(function()
        hover(GetKeyCard, false)
        TweenSvc:Create(GetKeyBtn, TweenInfo.new(0.1), { TextColor3 = C.TextDim }):Play()
    end)

    -- ===== STATUS LABEL =====
    local StatusLbl = Instance.new("TextLabel", Body)
    StatusLbl.Name = "StatusLabel"
    StatusLbl.LayoutOrder = 7
    StatusLbl.Size = UDim2.new(1, 0, 0, 16)
    StatusLbl.BackgroundTransparency = 1
    StatusLbl.Text = "Waiting for input..."
    StatusLbl.TextColor3 = C.TextDim
    StatusLbl.TextSize = 10
    StatusLbl.Font = Enum.Font.Gotham
    StatusLbl.TextXAlignment = Enum.TextXAlignment.Left

    -- helper to update status
    local function setStatus(msg, col)
        StatusLbl.Text = msg
        StatusLbl.TextColor3 = col or C.TextDim
    end

    -- ===== LOGIC =====
    VerifyBtn.MouseButton1Click:Connect(function()
        local key = KeyBox.Text
        if key == "" then setStatus("Enter a key first.", C.Red); return end
        setStatus("Verifying...", C.TextDim)
        VerifyBtn.Active = false
        local ok2, msg = redeemKey(key)
        if ok2 then
            setStatus("Valid key — loading...", C.Green)
            TweenSvc:Create(vcs, TweenInfo.new(0.3), { Color = C.Green }):Play()
            task.wait(0.6)
            Gui:Destroy()
            StartMainScript()
        else
            setStatus(msg, C.Red)
            TweenSvc:Create(vcs, TweenInfo.new(0.15), { Color = C.Red }):Play()
            task.wait(0.8)
            TweenSvc:Create(vcs, TweenInfo.new(0.3), { Color = C.AccentDim }):Play()
            VerifyBtn.Active = true
        end
    end)

    GetKeyBtn.MouseButton1Click:Connect(function()
        setStatus("Fetching link...", C.TextDim)
        local ok2, link = cacheLink()
        if ok2 then
            fSetClipboard(link)
            setStatus("Key link copied to clipboard.", C.Accent)
        else
            setStatus("Error: " .. tostring(link), C.Red)
        end
    end)

    -- auto-login from saved key
    if isfile and isfile(Config.KeyFileName) then
        local saved = readfile(Config.KeyFileName)
        if saved ~= "" then
            setStatus("Found saved key, checking...", C.TextDim)
            task.spawn(function()
                local ok2, msg = redeemKey(saved)
                if ok2 then
                    setStatus("Auto-login successful.", C.Green)
                    task.wait(0.5)
                    Gui:Destroy()
                    StartMainScript()
                else
                    setStatus("Saved key expired — enter a new one.", C.AccentDim)
                end
            end)
        end
    end
end

-- check if already running
local player = game:GetService("Players").LocalPlayer
local pGui   = player:WaitForChild("PlayerGui")
if Config.MainGuiName ~= "" and pGui:FindFirstChild(Config.MainGuiName) then
    StartMainScript()
    return
end

CreateGUI()
