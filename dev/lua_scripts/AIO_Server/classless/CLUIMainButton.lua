-------------------------------------------------------------------------------------------------------------------
-- ClassLess System by Shikifuyin
-- Target = AzerothCore - WotLK 3.3.5a
-------------------------------------------------------------------------------------------------------------------
-- ClassLess Client UI : Main Button
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- Requirements
local AIO = AIO or require("AIO")
if not class then require("class") end
if not CLClient then require("CLClient") end

-------------------------------------------------------------------------------------------------------------------
-- Client / Server Setup

-- Client-side Only !
if AIO.AddAddon() then
	return
end

-------------------------------------------------------------------------------------------------------------------
-- Constants

-------------------------------------------------------------------------------------------------------------------
-- CLUIMainButton - Declaration
CLUIMainButton = class({
	-- Static Members
})

function CLUIMainButton:init()
	-- Members
	self.m_iSize = 32
	self.m_strPositionAnchor = "BOTTOMRIGHT"
	self.m_iPositionX = -50
	self.m_iPositionY = 50
	
	self.m_hButton = nil
end

-------------------------------------------------------------------------------------------------------------------
-- CLUIMainButton : Methods

-------------------------------------------------------------------------------------------------------------------
-- CLUIMainButton : Initialization
function CLUIMainButton:Initialize()
	if ( self.m_hButton ~= nil ) then
		return
	end
	local hThis = self
	
	-- Create Button
	self.m_hButton = CreateFrame( "Button", "CLMainButton", UIParent )
	
	-- Size & Position
	self.m_hButton:SetSize( self.m_iSize, self.m_iSize )
	self.m_hButton:SetPoint( self.m_strPositionAnchor, UIParent, self.m_strPositionAnchor, self.m_iPositionX, self.m_iPositionY )
	
	AIO.SavePosition( self.m_hButton )
	
	-- Properties
	self.m_hButton:SetToplevel( true )
	self.m_hButton:SetMovable( true )
	self.m_hButton:SetClampedToScreen( true )
    self.m_hButton:EnableMouse( true )
	
	-- Textures
	self.m_hButton.background = self.m_hButton:CreateTexture( nil, "BACKGROUND" )
	self.m_hButton.background:SetTexture( "Interface\\Icons\\INV_Misc_Book_01" )
	self.m_hButton.background:SetSize( self.m_iSize, self.m_iSize )
	self.m_hButton.background:SetAllPoints( self.m_hButton )
	
	-- Drag & Drop
	self.m_hButton:RegisterForDrag( "RightButton" )
    self.m_hButton:SetScript( "OnDragStart", self.m_hButton.StartMoving )
    self.m_hButton:SetScript( "OnDragStop", self.m_hButton.StopMovingOrSizing )
	
	-- Event : OnEnter
    self.m_hButton:SetScript( "OnEnter",
        function()
			-- Get Client Instance
			local hClient = CLClient:GetInstance()
		
			-- Attach ToolTip to Button Frame
			local hToolTip = hClient:GetToolTip()
            hToolTip:SetOwner( hThis.m_hButton, "ANCHOR_RIGHT" )
			
			-- Set ToolTip Text
			local iSpellPoints = hClient:GetFreeSpellPoints()
			local iPetSpellPoints = hClient:GetFreePetSpellPoints()
			local iTalentPoints = hClient:GetFreeTalentPoints()
			local iPetTalentPoints = hClient:GetFreePetTalentPoints()
			local iGlyphMajorSlots = hClient:GetFreeGlyphMajorSlots()
			local iGlyphMinorSlots = hClient:GetFreeGlyphMinorSlots()

			hToolTip:AddLine( "综合学习界面", NORMAL_FONT_COLOR )
			hToolTip:AddLine( "左键单击:打开界面", HIGHLIGHT_FONT_COLOR )
			hToolTip:AddLine( "右键长按:拖动界面", HIGHLIGHT_FONT_COLOR )
			if ( iSpellPoints > 0 or iTalentPoints > 0 ) then
				hToolTip:AddLine( "未使用 : " .. iSpellPoints .. " 技能点 / " .. iTalentPoints .. " 天赋点", GREEN_FONT_COLOR )
			end
			if ( iPetSpellPoints > 0 or iPetTalentPoints > 0 ) then
				hToolTip:AddLine( "已使用 : " .. iPetSpellPoints .. " 技能点 / " .. iPetTalentPoints .. " 天赋点", GREEN_FONT_COLOR )
			end
			if ( iGlyphMajorSlots > 0 or iGlyphMinorSlots > 0 ) then
				hToolTip:AddLine( "雕文未使用 : " .. iGlyphMajorSlots .. " 大型 / " .. iGlyphMinorSlots .. " 小型", GREEN_FONT_COLOR )
			end
			
			-- Show tooltip
            hToolTip:Show()
        end
    )
	
	-- Event : OnLeave
    self.m_hButton:SetScript( "OnLeave",
        function()
			-- Hide tooltip
            CLClient:GetInstance():GetToolTip():Hide()
        end
    )
	
	-- Event : OnClick
	self.m_hButton:SetScript( "OnClick",
        function()
			CLClient:GetInstance():GetMainFrame():Toggle()
        end
    )
	
	print( "CLUIMainButton Initialized !" )
end


