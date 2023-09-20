StaticPopupDialogs["LEGACY_LEARN_ABILITY_CONFIRM"] = {
    text = LEGACY_ABILITY_LEARN,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        LegacyPanel_UnlockSpell(self);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
};

StaticPopupDialogs["LEGACY_DISCARD_ABILITY_UPGRADE_CONFIRM"] = {
    text = LEGACY_DISCARD_ABILITY_UPGRADE_CONFIRM,
    button1 = LEGACY_APPLY_UPGRADES_AND_RETURN,
    button2 = LEGACY_DISCARD_UPGRADES_AND_RETURN,
    OnAccept = function(self)
        LegacyPanel_ApplyAbilityUpgrades(self);
        LegacyPanel_NavigateBack();
    end,
    OnCancel = function() 
        LegacyPanel_NavigateBack();
    end,
    timeout = 0,
    showAlert = 1,
    exclusive = 1,
    hideOnEscape = 1,
};

StaticPopupDialogs["LEGACY_REPLACE_ABILITY_CONFIRM"] =
{
    text = LEGACY_ABILITY_REPLACE_CONFIRM,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        LegacyPanel_ReplaceAbility(self.spell, self.tier, self._type);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_FETCH_LEGACY_ITEM_CONFIRM"] =
{
    text = LEGACY_FETCH_LEGACY_ITEM_CONFIRM,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        LegacyPanel_FetchLegacyItem(self.entry);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_FETCH_MARKET_ITEM_CONFIRM"] =
{
    text = LEGACY_FETCH_MARKET_ITEM_CONFIRM,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        LegacyPanel_FetchMarketItem(self.entry);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_FETCH_MARKET_SPELL_CONFIRM"] =
{
    text = LEGACY_FETCH_MARKET_SPELL_CONFIRM,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        LegacyPanel_FetchMarketSpell(self.entry);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_SELECT_GUILD_SPELL_CONFIRM"] =
{
    text = LEGACY_SELECT_GUILD_SPELL_CONFIRM,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        LegacyPanel_SelectGuildSpell(self.slot, self.spell);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_BUY_GOLD_CONFIRM"] =
{
    text = LEGACY_BUY_GOLD_CONFIRM,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        Legacy_DoQuery(LMSG_A_BUY_GOLD, self.amount);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_CHANGE_TRANSMOG_FOR_SLOT_CONFIRM"] =
{
    text = LEGACY_TRANSMOG_SLOT_CONFIRM,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        Legacy_DoQuery(LMSG_A_SET_TRANSMOG_FOR_SLOT, self.slot..":"..self.entry);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_REMOVE_ALL_TRANSMOG_CONFIRM"] =
{
    text = LEGACY_REMOVE_ALL_TRANSMOG_CONFIRM,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        Legacy_DoQuery(LMSG_A_REMOVE_ALL_TRANSMOG);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_SET_MF_STATE"] =
{
    text = LEGACY_SET_MF_STATE,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        Legacy_DoQuery(LMSG_A_TOGGLE_MF_STATE);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_REMOVE_RUNE_CONFIRM"] =
{
    text = LEGACY_REMOVE_RUNE_CONFIRM,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
		print(self.tier);
		print(self.slot);
        Legacy_DoQuery(LMSG_A_REMOVE_RUNE, self.tier..":"..self.slot);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_RESET_SPECIALTY_CONFIRM"] =
{
    text = LEGACY_RESET_SPECIALTY_CONFIRM,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        Legacy_DoQuery(LMSG_A_RESET_SPECIALTY);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_FETCH_MARKET_BUFF_CONFIRM"] =
{
    text = "%s",
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        Legacy_DoQuery(LMSG_A_FETCH_MARKET_BUFF, self.entry);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_ACTIVATE_CLASS_SPELL_CONFIRM"] =
{
    text = LEGACY_ACTIVATE_CLASS_SPELL,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        Legacy_DoQuery(LMSG_A_ACTIVATE_CLASS_SPELL, self.entry);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_REMOVE_CLASS_SPELL_CONFIRM"] =
{
    text = LEGACY_REMOVE_CLASS_SPELL,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        Legacy_DoQuery(LMSG_A_REMOVE_CLASS_SPELL, self.entry);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_LEARN_CLASS_SKILL_CONFIRM"] =
{
    text = "%s",
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        Legacy_DoQuery(LMSG_A_LEARN_CLASS_SKILL, self.entry);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_COLLECT_TRANSMOG_CONFIRM"] =
{
    text = LEGACY_COLLECT_TRANSMOG,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        Legacy_DoQuery(LMSG_A_COLLECT_TRANSMOG, self.entry);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_RESET_CLASSSKILL_CONFIRM"] =
{
    text = LEGACY_RESET_CLASSSKILL,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        Legacy_DoQuery(LMSG_A_RESET_CLASSSKILL);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_FETCH_REPUTATION_SPELL_CONFIRM"] =
{
    text = LEGACY_FETCH_REPUTATION_SPELL_CONFIRM,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        Legacy_DoQuery(LMSG_A_FETCH_REPUTATION_SPELL, self.entry);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}

StaticPopupDialogs["LEGACY_FETCH_REPUTATION_ITEM_CONFIRM"] =
{
    text = LEGACY_FETCH_REPUTATION_ITEM_CONFIRM,
    button1 = LEGACY_CONFIRM,
    button2 = LEGACY_CANCEL,
    OnAccept = function(self)
        Legacy_DoQuery(LMSG_A_FETCH_REPUTATION_ITEM, self.entry);
    end,
    OnCancel = function() end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
}
