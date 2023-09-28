-- Digital Miner functions:
-- setInverseMode
-- getOwnerUUID
-- getDirection
-- setAutoPull
-- setMinY
-- getSupportedUpgrades
-- removeFilter
-- setSilkTouch
-- setRadius
-- getEnergy
-- getAutoEject
-- getAutoPull
-- isRunning
-- getRedstoneMode
-- getEnergyNeeded
-- getFilters
-- getMaxEnergy
-- setInverseModeRequiresReplacement
-- getOwnerName
-- getMaxRadius
-- getInstalledUpgrades
-- getSecurityMode
-- getSilkTouch
-- getEnergyUsage
-- setInverseModeReplaceTarget
-- getInverseModeRequiresReplacement
-- start
-- getMaxY
-- getItemInSlot
-- clearInverseModeReplaceTarget
-- getComparatorLevel
-- getRadius
-- getInverseModeReplaceTarget
-- getToMine
-- getSlotCount
-- getState
-- setAutoEject
-- stop
-- getInverseMode
-- addFilter
-- reset
-- setMaxY
-- setRedstoneMode
-- getEnergyFilledPercentage
-- getEnergyItem
-- getMinY

function PlaceMinerAndPower()
    turtle.select(1)
    turtle.placeUp()
    turtle.turnLeft()
    turtle.forward()
    turtle.forward()

    if (Mode == 0) then
        turtle.select(2)
        turtle.placeUp()
    elseif (Mode == 1) then
        turtle.up()
        turtle.select(2)
        turtle.placeUp()
        turtle.down()
        turtle.select(3)
        turtle.placeUp()
    end

    turtle.back()
    turtle.back()
    turtle.turnRight()
end

function BreakMinerAndPower()
    turtle.select(1)
    turtle.digUp()
    turtle.turnLeft()
    turtle.forward()
    turtle.forward()

    if (Mode == 0) then
        turtle.select(2)
        turtle.digUp()
    elseif (Mode == 1) then
        turtle.select(3)
        turtle.digUp()
        turtle.up()
        turtle.select(2)
        turtle.digUp()
        turtle.down()
    end

    turtle.back()
    turtle.back()
    turtle.turnRight()
end

-- Modes
-- 0 : Energy Cube
-- 1 : Gas-burning Generator

term.setTextColour(64)

term.clear()

print("=================")
print("Haiii welcome to my mining program :3")
print("I will go in whichever way you face me, bringing a digital miner with me!")
print("Unfortunately I will probably run into unloaded chunks :(")
print("Also make sure I don't run into anything! You should put me high up.")
print("Press enter to continue!")
print("")
print("")
read()
term.clear()
print("Starting setup <3")
print("=================")
print("")
print("")
print("")
print("Which mode would you like to use?")
print("Enter 0 to use an Energy Cube")
print("Enter 1 to use a Gas-burning Generator and gas tank (recommended because it can bring much more energy)")
print("")
print("")

while true do
    term.setCursorPos(1, 13)
    write("> ")
    local input = read()
    if (input == "0") then
        print("Using Energy Cube")
        Mode = 0
        break
    else
        if (input == "1") then
            print("Using Gas")
            Mode = 1
            break
        end
    end
    term.clear()
    print("Starting setup <3")
    print("=================")
    print("")
    print("")
    print("")
    print("Which mode would you like to use?")
    print("Enter 0 to use an Energy Cube")
    print("Enter 1 to use a Gas-burning Generator and gas tank (recommended because it can bring much more energy)")
    print("")
    print("")
    term.setTextColour(32768)
    term.setBackgroundColour(1)
    term.setCursorPos(1, 12)
    term.write("Bad option, try again.")
    sleep(0.2)
    term.setTextColour(32768)
    term.setBackgroundColour(16384)
    term.setCursorPos(1, 12)
    term.write("Bad option, try again.")
    term.setTextColour(64)
    term.setBackgroundColour(32768)
end
term.clear()

print("Setup Part 2")
print("=================")
print("")
print("")

if (Mode == 0) then
    print("")
    print("")
    print("")
    print("Give me the miner in first slot and energy cube in second.")
else
    print("Give me the miner in first slot,")
    print("ethylene or hydrogen filled tank in second slot,")
    print("and gas-burning generator in third slot.")
end
print("Press enter when done! Make sure I have room to place the miner above me, stand back!!")
read()
term.clear()
term.setCursorPos(1, 1)
write("Setup Part 3")
term.setCursorPos(1, 2)
write("=================")
print("")
print("")
print("")
print("             Please Wait...")
PlaceMinerAndPower()
term.clear()
term.setCursorPos(1, 1)
write("Setup Part 4")
term.setCursorPos(1, 2)
write("=================")
print("")
print("")
print("")
print("")
while true do
    if (peripheral.isPresent("top")) then
        print("Miner placed!")
        break
    end

    print("Miner didn't place.. Did you get in the way?")
    print("Press enter to try again, then stand back...")
    read()
    print("Okay, now move back!!!!!")
    sleep(5)
    turtle.select(1)
    turtle.placeUp()
    sleep(1)
end

print("Now configure the power, and choose the miner options.")
if (Mode == 0) then
    print("Make sure the energy cube is outputting to the miner")
else
    print("Make sure your tank is outputting into the generator")
end
print("Press enter when done!")
read()
term.clear()
term.setCursorPos(1, 1)
write("Setup Part 5")
term.setCursorPos(1, 2)
write("=================")
print("")
print("")
print("")
print("")
print("Place a container beneath me, make sure its big or automatically empties.")
print("A regular chest will fill up quite quickly.")
print("Press enter when done!")
read()
term.clear()
X = 0
Y = 0


while true do
    -- move miner loop
    -- print("paused..")
    -- read()
    local miner = peripheral.wrap("top")
    miner.start()
    print("Started miner")
    while true do
        print("Miner running... To Mine: " .. miner.getToMine())
        if (miner.getToMine() == 0) then
            break
        end

        if (miner.getItemInSlot(14).count ~= 0) then
            print("Space is getting low, I'll bring this home!")
            miner.stop() -- stop it so it doesnt keep adding new items
            turtle.forward()
            turtle.forward()
            turtle.up()
            turtle.up()
            turtle.turnLeft()
            turtle.turnLeft()
            turtle.select(3)
            for i = 1, 16 do
                turtle.suck()
            end
            turtle.down()
            turtle.down()
            turtle.forward()
            turtle.forward()
            miner.start() -- restart the miner so it keep running when we are putting stuff back
            for i = 1, X * 16 do
                turtle.forward()
            end
            sleep(1)
            for i = 1, 16 do
                turtle.select(i)
                turtle.dropDown()
            end
            turtle.turnRight()
            turtle.turnRight()

            for i = 1, X * 16 do
                turtle.forward()
            end
            print("back at the miner! " .. X .. ", " .. Y)
        end

        if (miner.getEnergyFilledPercentage() <= 0.25) then
            print("miner is out of energy. let's go home!")
            BreakMinerAndPower()
            turtle.turnLeft()
            turtle.turnLeft()
            for i = 1, X * 16 do
                turtle.forward()
            end
            print("goodbye!")
            error()
        end
        sleep(15)
    end



    print("miner finished!")
    print("moving miner...")
    BreakMinerAndPower()
    for i = 1, 16, 1 do
        turtle.forward()
    end
    X = X + 1
    PlaceMinerAndPower()
end
