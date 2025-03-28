SLASH_MYQUEST1 = "/ezt"

local frame = CreateFrame("Frame")
print("EzTracker Loaded!")

frame:RegisterEvent("PLAYER_ENTERING_WORLD")

local function TrackQuests()
  print("|cfffcc603Coffer Keys Quests Tracked:\n|r")
  local acc=0;
  local trackedQuests={83240,83333,76586,80670,80671,80672}
  for i=1,6 do
    local qTitle = C_QuestLog.GetTitleForQuestID(trackedQuests[i]);
    if (C_QuestLog.IsQuestFlaggedCompleted(trackedQuests[i])) then 
      acc=acc+1;
      print("\124cff00FF00" ..qTitle .. " Completed!\124r");
      if acc == 4 then break; end;
    else
      print("\124cffFF0000" .. qTitle .. "\124r");
    end
  end
  print("\nCoffer Key Collected: " .. acc .. "/4\n")
end

local function OnEvent(self, event, ...)
  TrackQuests();
end

SlashCmdList["MYQUEST"] = function(msg)
  TrackQuests()
end

frame:SetScript("OnEvent", OnEvent)