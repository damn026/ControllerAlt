--CODE FOR ADITYAS (IH CONTROLLER) 

getgenv().potatopc = false
getgenv().advertt = false
getgenv().advert = "This is your advert, use it to advertise your DHC server while selling"
getgenv().ControllerID = 1944337406
getgenv().dropconstant = false
getgenv().amountofalts = 2
getgenv().alts = {
    A1 = 828591211,
}


if plrid == ControllerID then
    local isal = true
end

local plrid = game.Players.LocalPlayer.UserId

--FUNCTIONS
wait(1)

local plr = game.Players.LocalPlayer

local controllername = game.Players:GetNameFromUserIdAsync(ControllerID)





function amountgui()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GS21Official/Seller-Tools/main/DaHood%20Cash%20Counter'))()
end

function block()
        if isal == false then
        local args = {
            [1] = "Block",
            [2] = true
        }

        game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(args))
    end
end

function walleth()
    if isal == false then
    local wal = game.Players.LocalPlayer.Backpack:FindFirstChild("Wallet")
    if wal then
        wal.parent = game.Players.LocalPlayer.Character
        end
    end
end

function advertsend()
    if isal == false then
    spawn(function()
        while advertt == true do
                if advertt == false then break else
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(advert, 'All');
                end
            end
        end)
    end
end

function checkifalt()
    for i, v in pairs(getgenv().alts) do
        if v == plrid then
            return true 
        end
    end
end


function drop()
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


function CheckIfController(id)

    if id == ControllerID then
        return true
    end
end

function potatopcheck(bool)
    if bool then
        potatopcfunc()
    end
end


function potatopcfunc()
        for i, v in pairs(game.Workspace.GetDescendants()) do
        if V:IsA("Part") then V:Destroy()
        wait(0.02)
        end
    end
end 

function setupfunc()
    local controllerpos = game.Players.ControllerID.Character.Position

    local altc = checkifalt()

    if altc then
        LocalPlayer.Position = controllerpos + Vector3.new(0, 5, 0)
    end
end

function freeze()
    if plrid == ControllerID then return end
    
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0

end



--FUNCTION ENDS


wait(1)

--LOCALS

local isalt = checkifalt()

local iscontroller = CheckIfController(plrid)


local controllerplayer = game.Players[controllername]

--IF STATEMENTS

if iscontroller == false then
    potatopcheck(getgenv().potatopc)
end

controllerplayer.Chatted:Connect(function(msg)
    if msg == "drop" and isalt == true then
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
    end
end)

   
