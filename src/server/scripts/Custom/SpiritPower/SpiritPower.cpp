﻿#pragma execution_character_set("utf-8")
#include "SpiritPower.h"
#include "../GCAddon/GCAddon.h"

void SpiritPower::Init(Player* player)
{
	GetDBValue(player);
	SendPacket(player);
}

void SpiritPower::SendPacket(Player* player)
{
	std::ostringstream oss;
	oss << player->SpiritPower << " ";
	oss << player->MaxSpiritPower;
	sGCAddon->SendPacketTo(player, "GC_S_SPIRITPOWER", oss.str());
}

void SpiritPower::Update(Player* player, uint32 value, bool ins, bool notice)
{
	int32 ori = player->SpiritPower;

	if (!ins)
	{
		player->SpiritPower -= value;

		if (player->SpiritPower < 0)
			player->SpiritPower = 0;
	}	
	else
	{
		player->SpiritPower += value;

		if (player->SpiritPower > player->MaxSpiritPower)
			player->SpiritPower = player->MaxSpiritPower;
	}

	int32 gap = ori - player->SpiritPower;

	if (gap == 0)
		return;

	if (gap > 0)
	{
		if (notice)
			ChatHandler(player->GetSession()).PSendSysMessage("[灵力]消耗%u", gap);
	}
	else
	{
		if (notice)
			ChatHandler(player->GetSession()).PSendSysMessage("[灵力]增加%u", abs(gap));
	}
		

	SendPacket(player);
}

void SpiritPower::UpdateMax(Player* player, uint32 maxValue)
{
	if (maxValue <= 0)
		return;
	
	player->MaxSpiritPower = maxValue;

	SendPacket(player);
	CharacterDatabase.Execute("UPDATE characters SET MaxSpiritPower = %u WHERE guid = %u", maxValue, player->GetGUID().GetCounter());
	ChatHandler(player->GetSession()).PSendSysMessage("最大[灵力]设置为%u", maxValue);
}

void SpiritPower::GetDBValue(Player* player)
{
	QueryResult result = CharacterDatabase.Query("SELECT SpiritPower,MaxSpiritPower FROM characters WHERE guid = %u", player->GetGUID().GetCounter());
	if (!result)
		return;

	Field* fields = result->Fetch();
	player->SpiritPower = fields[0].Get<uint32>();
	player->MaxSpiritPower = fields[1].Get<uint32>();
}

void SpiritPower::SaveToDB(Player* player)
{
	CharacterDatabase.Execute("UPDATE characters SET SpiritPower = %u WHERE guid = %u", player->SpiritPower, player->GetGUID().GetCounter());
}

class SpiritPowerPlayerScript : PlayerScript
{
public:
	SpiritPowerPlayerScript() : PlayerScript("SpiritPowerPlayerScript") {}
	void OnLogin(Player* player) override
	{
		sSpiritPower->Init(player);
	}

	void OnLogout(Player* player) override
	{
		sSpiritPower->SaveToDB(player);
	}
};

void AddSC_SpiritPower()
{
	new SpiritPowerPlayerScript();
}
