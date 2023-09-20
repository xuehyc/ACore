-- Recovery
function Ghost_FetchData_Recovery( msg )
	local type, param1, param2 = strsplit("#",msg);
	if type == "0" then
		Ghost_RecoveryFrame_Show(param1);
	end
	if type == "1" then
		Ghost_RecoveryCategoryFrame_Show(param1,param2);
	end
end

function Ghost_RecoveryFrame_Show(param)
	GhostRecoveryCategoryTitle:SetText("");
	GhostRecoveryButton:Hide();

	for i=1,300,1 do if _G["CategoryButton"..i] then _G["CategoryButton"..i]:Hide() end end
	for i=1,300,1 do if _G["RecoveryItemButton"..i] then _G["RecoveryItemButton"..i]:Hide() end end
	
	local categorysTable = Split(param,":");
	
	if #categorysTable == 1 then
		GhostRecoveryFrame:Hide()
		DEFAULT_CHAT_FRAME:AddMessage("回收已全部完成！");
		return
	end
	
	local y = -100;
	
	for key,value in pairs(categorysTable) do
		if value and value~="" then
			local CategoryButton
			if not _G["CategoryButton"..key] then
				CategoryButton = CreateFrame("Button", "CategoryButton"..key, GhostRecoveryFrame, "GhostRecoveryCategoryButtonTemplate");
			else
				CategoryButton = _G["CategoryButton"..key];
			end		
			local categoryId,categoryName = strsplit("-",value);
			CategoryButton:SetID(categoryId);
			CategoryButton:SetText(categoryName);
			CategoryButton:SetPoint("TOP", 0, y);
			CategoryButton:Show();
			
			y = y - 45;
		end
	end
	GhostRecoveryFrame:SetSize(250,math.abs(y) + 80);
	GhostRecoveryFrame:Show();
end

function Ghost_RecoveryCategoryFrame_Show(param1,param2)
	
	local tokenAmount = param1;
	local itemsTable = Split(param2,":");

	for i=1,300,1 do if _G["CategoryButton"..i] then _G["CategoryButton"..i]:Hide() end end
	for i=1,300,1 do if _G["RecoveryItemButton"..i] then _G["RecoveryItemButton"..i]:Hide() end end
	
	GhostRecoveryCategoryTitle:SetText("积分总数\n"..tokenAmount);
	
	local x_begin 	= 55;
	local x_stop 	= 180;
	
	if #itemsTable > 61 then
		x_begin = 15;
		x_stop 	= 220;
	end
	
	local x = x_begin;
	local y = -130;
	
	for key,value in pairs(itemsTable) do
		if value and value~="" then
			local itemId,itemCount = strsplit("-",value)
			local itemButton
			if not _G["RecoveryItemButton"..key] then
				itemButton = CreateFrame("Button", "RecoveryItemButton"..key, GhostRecoveryFrame, "GhostSmallCircleButtonTemplate");
			else
				itemButton = _G["RecoveryItemButton"..key];
			end	
			
			if x > x_stop then
				x = x_begin;			
				y = y - 25;
			end
			
			itemButton:SetPoint("TOPLEFT", GhostRecoveryFrame, x, y)
			x = x + 25
			
			_G["RecoveryItemButton"..key.."Count"]:SetText(itemCount);
			itemButton:SetScript("OnEnter", function(self) SetCursor("ATTACK_CURSOR")GameTooltip:SetOwner(self, "ANCHOR_CURSOR") GameTooltip:ClearLines()GameTooltip:SetHyperlink("Hitem:"..itemId) GameTooltip:Show() end)
			itemButton:SetScript("OnLeave", function(self) GameTooltip:ClearLines()GameTooltip:Hide()end)
			local itemIcon = GetItemIcon(itemId);
			SetPortraitToTexture("RecoveryItemButton"..key.."Texture",itemIcon);
			itemButton:Show();
		end
	end

    GhostRecoveryButton:Show();
	GhostRecoveryFrame:SetSize(250,math.abs(y) + 120);
	GhostRecoveryFrame:Show();
end

function Ghost_RecoveryCategoryButton_Click(self)
	Ghost_SendData("GC_C_RECOVERY","0 "..self:GetID());
	self:Hide();
	GhostRecoveryButton:SetID(self:GetID());
	PlaySound("igCharacterInfoOpen");
end

function Ghost_RecoveryButton_Click(self)
	Ghost_SendData("GC_C_RECOVERY","1 "..self:GetID());
	PlaySound("igCharacterInfoOpen");
end

-- Talisman
function Ghost_FetchData_TalismanUpdate(params)

	GhostTalismanFrame:Show();

	for id=1,7,1 do
		_G["GhostTalismanFrameButton"..id.."Texture"]:SetTexture(TALISMAN_DEFAULT_ICON);
		_G["GhostTalismanFrameButton"..id.."HighLightTexture"]:SetTexture(TALISMAN_DEFAULT_ICON);
	end
	
	local t = Split(params,"#")
	for key,value in pairs(t) do
		if value~="" then
			local id,icon,itemId = strsplit("-",value);
	
			if itemId == "0" then
				icon = TALISMAN_DEFAULT_ICON;
			else
				icon = "Interface\\Icons\\"..icon;
			end

			_G["GhostTalismanFrameButton"..id.."Texture"]:SetTexture(icon);
			_G["GhostTalismanFrameButton"..id]:SetScript("OnEnter", function(self) 
				GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
				GameTooltip:ClearLines()GameTooltip:SetHyperlink("Hitem:"..itemId);		
				_G["GhostTalismanFrameButton"..id.."Texture"]:SetTexture("");
				_G["GhostTalismanFrameButton"..id.."HighLightTexture"]:SetTexture(icon);
				Ghost_TalismanShowValue(id, itemId);
				GameTooltip:Show();
			end)
			_G["GhostTalismanFrameButton"..id]:SetScript("OnLeave", function(self) GameTooltip:ClearLines()GameTooltip:Hide() _G["GhostTalismanFrameButton"..id.."Texture"]:SetTexture(icon)end);
		end
	end
end

function Ghost_TalismanShowValue(id, itemId)
	-- if id ~= "7" then
	-- 	return;
	-- end
    -- 
	-- GameTooltip:AddDoubleLine("|cffcccccc┌|r", "|cffcccccc┐|r");
	-- GameTooltip:AddDoubleLine("|cffcccccc│|r", "|cFF00FF00本命法宝|r|cffcccccc│|r");
	-- GameTooltip:AddDoubleLine(string.format("|cffcccccc│|r|cFF00FF00+ %s|r",Ghost.Char.TALISMAN),"耐力|cffcccccc│|r");
	-- GameTooltip:AddDoubleLine(string.format("|cffcccccc│|r|cFF00FF00+ %s|r",Ghost.Char.TALISMAN),"敏捷|cffcccccc│|r");
	-- GameTooltip:AddDoubleLine(string.format("|cffcccccc│|r|cFF00FF00+ %s|r",Ghost.Char.TALISMAN),"力量|cffcccccc│|r");
	-- GameTooltip:AddDoubleLine(string.format("|cffcccccc│|r|cFF00FF00+ %s|r",Ghost.Char.TALISMAN),"智力|cffcccccc│|r");
	-- GameTooltip:AddDoubleLine(string.format("|cffcccccc│|r|cFF00FF00+ %s|r",Ghost.Char.TALISMAN),"精神|cffcccccc│|r");
	-- GameTooltip:AddDoubleLine("|cffcccccc└|r", "|cffcccccc┘|r");
    -- 
	-- GameTooltip_ClearMoney(GameTooltip);
    -- local price = GhostGetItemPrice(itemId);
    -- if price and price > 0 then
    --     GameTooltip_OnTooltipAddMoney(GameTooltip, GhostGetItemPrice(itemId));
    -- end
end

function Ghost_TalismanButton_Click(self)
	local infoType, entry = GetCursorInfo();
	if (infoType == "item") then
		Ghost_SendData("GC_C_TALISMAN","0 "..self:GetID().." "..entry);
	else
		Ghost_SendData("GC_C_TALISMAN","0 "..self:GetID().." 0");
	end
	ClearCursor();
end

-- StatPoints
function GhostStatPointsButtonDisable()
	for i=1,20,1 do if _G["StatPointsInsButton"..i] then _G["StatPointsInsButton"..i]:Disable(); end end
	for i=1,20,1 do if _G["StatPointsDesButton"..i] then _G["StatPointsDesButton"..i]:Disable(); end end
end

function GhostStatPointsButtonHide()
	for i=1,20,1 do if _G["StatPointsInsButton"..i] then _G["StatPointsInsButton"..i]:Hide(); end end
	for i=1,20,1 do if _G["StatPointsDesButton"..i] then _G["StatPointsDesButton"..i]:Hide(); end end
end

function Ghost_FetchData_StatPoints(params)

	GhostStatPointsButtonHide();
	GhostStatPointsButtonDisable();
	
	local statpoints,statsinfo = strsplit("#",params);
	
	local total,name =  strsplit("-",statpoints);
	GhostStatPointsFrameMainTextFrameText:SetText("剩余"..total..name);
	
	local stats = Split(statsinfo,"-");
	
	local y = -220;
	
	for key,value in pairs(stats) do
		if value and value~="" then

			local statValue,ID,text = strsplit(":",value);
			
			local TextFrame
			if not _G["CategoryButton"..key] then
				TextFrame = CreateFrame("Frame", "StatPointsTextFrame"..key, GhostStatPointsFrame, "GhostStatPointsTextTemplate");
			else
				TextFrame = _G["StatPointsTextFrame"..key];
			end
			
			TextFrame:SetID(ID);
			_G["StatPointsTextFrame"..key.."Text"]:SetText(statValue..text);
			TextFrame:SetPoint("TOP", 0, y);
			
			y = y- 25
			
			local InsButton
			if not _G["StatPointsInsButton"..key] then
				InsButton = CreateFrame("Button", "StatPointsInsButton"..key, GhostStatPointsFrame, "GhostStatPointsInsButtonTemplate");
			else
				InsButton = _G["StatPointsInsButton"..key];
			end		

			SetPortraitToTexture(InsButton:GetName().."Texture",STATPOINTS_INS_ICON);
			InsButton:SetID(ID);
			InsButton:SetPoint("CENTER", _G["StatPointsTextFrame"..key.."Text"], 70, 0)
			InsButton:Show();
			
			if tonumber(total) > 0 then
				InsButton:Enable();
			end
			
			local DesButton
			if not _G["StatPointsDesButton"..key] then
				DesButton = CreateFrame("Button", "StatPointsDesButton"..key, GhostStatPointsFrame, "GhostStatPointsDesButtonTemplate")
			else
				DesButton = _G["StatPointsDesButton"..key];
			end		

			SetPortraitToTexture(DesButton:GetName().."Texture",STATPOINTS_DES_ICON);
			DesButton:SetID(ID);
			DesButton:SetPoint("CENTER", _G["StatPointsTextFrame"..key.."Text"], -70, 0);
			DesButton:Show();
			
			if tonumber(statValue) > 0 then
				DesButton:Enable();
			end
		end
	end
	GhostStatPointsFrame:SetSize(250,math.abs(y) - 50)
	GhostStatPointsFrame:Show();
end

function StatPointsIns(button)
	Ghost_SendData("GC_C_STATPOINTS","0 "..button:GetID())
	GhostStatPointsButtonDisable();
end

function StatPointsDes(button)
	Ghost_SendData("GC_C_STATPOINTS","1 "..button:GetID())
	GhostStatPointsButtonDisable();
end

-- AntiFarm
function Ghost_FetchData_AntiFarm(params)
	print(params)
	local rand_i,nums = strsplit("#",params);	
	local numTable = Split(nums,":");

	for key,value in pairs(numTable) do
		if value and value~="" then
		local button
		if not _G["GhostAntiFarmFrameButton"..value] then
			button = CreateFrame("Button", "GhostAntiFarmFrameButton"..value, GhostAntiFarmFrame, "GhostAntiFarmFrameButtonTemplate");
		else
			button = _G["GhostAntiFarmFrameButton"..value];
		end
		button:SetID(value);
		button:SetText(value);
		
		local x,y
		
		if key == 1 then x = -60 y = 60 	end
		if key == 2 then x = 	0 	y = 60 	end
		if key == 3 then x = 60 	y = 60 	end
		if key == 4 then x = -60 y = 0 		end
		if key == 5 then x = 0 	y = 0 		end
		if key == 6 then x = 60 	y = 0 	end
		if key == 7 then x = -60 y = -60 	end
		if key == 8 then x = 0 	y = -60 	end
		if key == 9 then x = 60 	y = -60 end
		
		button:SetPoint("CENTER", AntiFarmFrame, x, y - 40);	
		end
	end
	
	GhostAntiFarmFrameText:SetText("请点击[ |cFFFF0000"..rand_i.."|r ]");	
	GhostAntiFarmFrame:Show();
end
function Ghost_AntiFarmButton_Click(self)
	Ghost_SendData("GC_C_ANTIFARM",self:GetID());
	GhostAntiFarmFrame:Hide();
end

-- LuckDraw
local LuckDrawTotal = 0
local LuckDrawIndex = 1
local LuckDrawCount = 0
local LuckDrawItemId = 0
local LuckDrawItems
local count
local nums = 0;

local function UpdateRoll(self,elapsed)
    LuckDrawTotal = LuckDrawTotal + elapsed	
	if LuckDrawTotal > 0.02 then
		LuckDrawTotal = 0
		for i = 1, LuckDrawCount do
			_G["LuckDrawFrameButton"..i.."RollTexture"]:SetTexture("")
		end

		if _G["LuckDrawFrameButton"..LuckDrawIndex]:GetID() == LuckDrawItemId then
			nums = nums + 1;

			if nums == 2 then

			PlaySound("igCharacterInfoOpen");
			LuckDrawFrame:SetScript("OnUpdate", nil)
			LuckDrawItemId = 0
			nums = 0
			if count == 0 then
				LuckDrawFrameConfirmButton:Show()
				LuckDrawFrameConfirmButton10:Show()
				LuckDrawNoticeButton:Hide();
			end

			end
		end
		
		_G["LuckDrawFrameButton"..LuckDrawIndex.."RollTexture"]:SetTexture(LUCKDRAW_WHITE_CIRCLE_ICON)

		local itemId,itemIcon,itemCount = strsplit("-",LuckDrawItems[LuckDrawIndex])
		_G["LuckDrawFrameButton50"]:SetScript("OnEnter", function(self) SetCursor("ATTACK_CURSOR")GameTooltip:SetOwner(self, "ANCHOR_CURSOR") GameTooltip:ClearLines()GameTooltip:SetHyperlink("Hitem:"..itemId) GameTooltip:Show() end)
		_G["LuckDrawFrameButton50"]:SetScript("OnLeave", function(self) GameTooltip:ClearLines()GameTooltip:Hide()end)
		SetPortraitToTexture("LuckDrawFrameButton50Texture","Interface\\ICONS\\"..itemIcon)
		_G["LuckDrawFrameButton50Count"]:SetText(itemCount)
		_G["LuckDrawFrameButton50"]:Show()

		LuckDrawIndex = LuckDrawIndex + 1		
		if LuckDrawIndex > LuckDrawCount then
			LuckDrawIndex = 1
		end

		if count == 0 then
			LuckDrawNoticeText:SetText("正在抽奖...")
		else if count < 10 then
				LuckDrawNoticeText:SetText("正在进行第"..(10 - count).."次抽奖...")
			end
		end
	end
end

function LuckDrawShow(param)

	_G["LuckDrawFrameConfirmButton"]:SetText(LUCKDRAW_PANNEL_ONE);
	_G["LuckDrawFrameConfirmButton10"]:SetText(LUCKDRAW_PANNEL_TEN);

	DEFAULT_CHAT_FRAME:AddMessage(LUCKDRAW_PANNEL_OPEN_NOTICE);

	LuckDrawItems ={}

	for i=1,50,1 do if _G["LuckDrawFrameButton"..i] then _G["LuckDrawFrameButton"..i]:Hide() end end

	local t = Split(param,":")
	LuckDrawCount = #t-1
	
	LuckDrawFrame:SetSize(LuckDrawCount * 20, LuckDrawCount * 20 + 200);
	LuckDrawTitle:SetText(LUCKDRAW_PANNEL_TITLE)
	LuckDrawFrameConfirmButton:ClearAllPoints()
	LuckDrawFrameConfirmButton10:ClearAllPoints()
	LuckDrawFrameConfirmButton:SetPoint("CENTER", LuckDrawFrame, "BOTTOM", -80, 45)
	LuckDrawFrameConfirmButton10:SetPoint("CENTER", LuckDrawFrame, "BOTTOM", 80, 45)

	if LuckDrawCount <= 10 then 
		LuckDrawFrameConfirmButton:ClearAllPoints()
		LuckDrawFrameConfirmButton10:ClearAllPoints()
		LuckDrawFrameConfirmButton:SetPoint("CENTER",LuckDrawFrameConfirmButton10,"BOTTOM", 0, 55)
		LuckDrawFrameConfirmButton10:SetPoint("CENTER", LuckDrawFrame,"BOTTOM", 0, 45)
		LuckDrawFrame:SetSize(LuckDrawCount * 20 +150, LuckDrawCount * 20 + 260);
		LuckDrawTitle:SetText(LUCKDRAW_PANNEL_TITLE)
	elseif LuckDrawCount <= 20 then
		LuckDrawFrameConfirmButton:ClearAllPoints()
		LuckDrawFrameConfirmButton10:ClearAllPoints()
		LuckDrawFrameConfirmButton:SetPoint("CENTER",LuckDrawFrameConfirmButton10,"BOTTOM", 0, 55)
		LuckDrawFrameConfirmButton10:SetPoint("CENTER", LuckDrawFrame,"BOTTOM", 0, 45)
		LuckDrawFrame:SetSize(LuckDrawCount * 20 + 30, LuckDrawCount * 20 + 260);
		LuckDrawTitle:SetText(LUCKDRAW_PANNEL_TITLE)	
	end

	for i = 1, LuckDrawCount do
		local button
		if not _G["LuckDrawFrameButton"..i] then
			button = CreateFrame("Button", "LuckDrawFrameButton"..i, LuckDrawFrame, "GhostCircleButtonTemplate")
		else
			button = _G["LuckDrawFrameButton"..i]
		end	
		
		_G[button:GetName().."BorderTexture"]:SetTexture(LUCKDRAW_CIRCLE_ICON);

		local angle = 2.0 * math.pi * (i - 1) / LuckDrawCount
		local buttonX = LuckDrawCount * 8 * math.sin(angle)
		local buttonY = LuckDrawCount * 8 * math.cos(angle) -15
		button:SetPoint("CENTER", LuckDrawFrame, "CENTER", buttonX, buttonY)
		local itemId,itemIcon,itemCount = strsplit("-",t[i])
		button:SetID(itemId)
		button:SetScript("OnEnter", function(self) SetCursor("ATTACK_CURSOR")GameTooltip:SetOwner(self, "ANCHOR_CURSOR") GameTooltip:ClearLines()GameTooltip:SetHyperlink("Hitem:"..itemId) GameTooltip:Show() end)
		button:SetScript("OnLeave", function(self) GameTooltip:ClearLines()GameTooltip:Hide()end)
		SetPortraitToTexture("LuckDrawFrameButton"..i.."Texture","Interface\\ICONS\\"..itemIcon)
		_G["LuckDrawFrameButton"..i.."Count"]:SetText(itemCount)
		button:Show()

		LuckDrawItems[i] = t[i]
	end

	local button
	if not _G["LuckDrawFrameButton50"] then
		button = CreateFrame("Button", "LuckDrawFrameButton50", LuckDrawFrame, "GhostCircleButtonTemplate")
	else
		button = _G["LuckDrawFrameButton50"]
	end	

	_G[button:GetName().."BorderTexture"]:SetTexture(LUCKDRAW_CIRCLE_ICON);
	button:SetPoint("CENTER", LuckDrawFrame, "CENTER", 0, -15)
	_G["LuckDrawFrameButton50Texture"]:SetSize(75,75)
	_G["LuckDrawFrameButton50BorderTexture"]:SetSize(80,80)
	button:Hide()
	LuckDrawFrame:Show()
end

function LuckDrawButtonClick(button)
	LuckDrawFrameConfirmButton:Hide()
	LuckDrawFrameConfirmButton10:Hide()	
	LuckDrawNoticeButton:Show();
	LuckDrawFrame:SetScript("OnUpdate", UpdateRoll)
	if button:GetText() == LUCKDRAW_PANNEL_ONE then
		count = 0
		Ghost_SendData("GC_C_LUCKDRAW_V3","1")
	end

	if button:GetText() == LUCKDRAW_PANNEL_TEN then
		count = 9
		Ghost_SendData("GC_C_LUCKDRAW_V3","10")
	end
end

function Ghost_FetchData_LuckDrawV3( msg )
	local type, param,param2 = strsplit("#",msg)
	--显示
	--显示
	if type == "SHOW" then
		PlaySound("igCharacterInfoOpen");
		LuckDrawShow(param)
	end

	if type == "CHECK" then
		if param == "2" then
			LuckDrawFrameConfirmButton:Enable()
			LuckDrawFrameConfirmButton10:Enable()
		end
		if param == "1" then
			LuckDrawFrameConfirmButton:Enable()
			LuckDrawFrameConfirmButton10:Disable()
		end
		if param == "0" then
			LuckDrawFrameConfirmButton:Disable()
			LuckDrawFrameConfirmButton10:Disable()
		end
	end


	--开始抽奖
	if type == "START" then
		LuckDrawFrame:SetScript("OnUpdate", UpdateRoll)
	end
	--结束抽奖
	if type == "STOP" then
		LuckDrawItemId = tonumber(param)
		if count > 0 then
			count = count - 1
		end
	end

	if type == "MIDITEM" then
		local itemId = param
		local itemIcon = param2
		_G["LuckDrawFrameButton50"]:SetScript("OnEnter", function(self) SetCursor("ATTACK_CURSOR")GameTooltip:SetOwner(self, "ANCHOR_CURSOR") GameTooltip:ClearLines()GameTooltip:SetHyperlink("Hitem:"..itemId) GameTooltip:Show() end)
		_G["LuckDrawFrameButton50"]:SetScript("OnLeave", function(self) GameTooltip:ClearLines()GameTooltip:Hide()end)
		SetPortraitToTexture("LuckDrawFrameButton50Texture","Interface\\ICONS\\"..itemIcon)
		_G["LuckDrawFrameButton50Count"]:SetText("")
		PlaySound("igCharacterInfoOpen");
	end
end

-- RANKVALUE
if RANKVAUE_ON_OFF > 0  then
	GhostRankValueStatusBar:Show();
else
	GhostRankValueStatusBar:Hide();
end

function Ghost_FetchData_RankValue(msg)
	local value,maxValue,text = strsplit(" ",msg);
	GhostRankValueStatusBar:SetMinMaxValues(0, tonumber(maxValue));
	GhostRankValueStatusBar:SetValue(tonumber(value));
	GhostRankValueStatusBarText:SetText(text.." "..value.."/"..maxValue);
end

-- SpiritPower
if SPRITPOWER_ON_OFF > 0 then
	GhostSpiritPowerStatusBar:Show();
else
	GhostSpiritPowerStatusBar:Hide();
end

function Ghost_UpdateSpiritPower(value,maxValue)
	GhostSpiritPowerStatusBar:SetMinMaxValues(0, tonumber(maxValue));
	GhostSpiritPowerStatusBar:SetValue(tonumber(value));
	GhostSpiritPowerStatusBarText:SetText("灵力 "..value.."/"..maxValue);
end