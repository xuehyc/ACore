﻿#pragma execution_character_set("utf-8")
#include "CharNameMod.h"
#include "World.h"
#include "../Switch/Switch.h"
#include "../CommonFunc/CommonFunc.h"
#include "../PvP/PvP.h"
#include "../String/myString.h"
#include "../GCAddon/GCAddon.h"
#include "../GS/GS.h"

void CharNameMod::UpdatePrefix(Player* player, std::string namePrefix)
{
	std::string FFAPvP = (player->GetUInt32Value(PLAYER_DUEL_TEAM) == player->GetGUID().GetCounter()) ? sString->GetText(CORE_STR_TYPES(STR_FFAPVP)) : "";

	if (!namePrefix.empty())
		player->namePrefix = namePrefix + sSwitch->GetFlagByIndex(ST_SEP_PREFIX_SUFFIX, 1);
	else
		player->namePrefix = "";

    sWorld->UpdateNamePrefixSuffix(player, FFAPvP + player->namePrefix, player->nameSuffix);

	SQLTransaction trans = CharacterDatabase.BeginTransaction();
	CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_UPD_NAME_PREFIX);
	stmt->SetData(0, namePrefix);
	stmt->SetData(1, player->GetGUID().GetCounter());
	trans->Append(stmt);
	CharacterDatabase.CommitTransaction(trans);
}

void CharNameMod::UpdateSuffix(Player* player, std::string nameSuffix)
{
	std::string FFAPvP = (player->GetUInt32Value(PLAYER_DUEL_TEAM) == player->GetGUID().GetCounter()) ? sString->GetText(CORE_STR_TYPES(STR_FFAPVP)) : "";

	if (!nameSuffix.empty())
		player->nameSuffix = sSwitch->GetFlagByIndex(ST_SEP_PREFIX_SUFFIX, 2) + nameSuffix;
	else
		player->nameSuffix = "";

	sWorld->UpdateNamePrefixSuffix(player, FFAPvP + player->namePrefix, player->nameSuffix);

	SQLTransaction trans = CharacterDatabase.BeginTransaction();
	CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_UPD_NAME_SUFFIX);
	stmt->SetData(0, nameSuffix);
	stmt->SetData(1, player->GetGUID().GetCounter());
	trans->Append(stmt);
	CharacterDatabase.CommitTransaction(trans);
}

std::string CharNameMod::GetPureName(std::string name)
{
	std::vector<std::string> vec = sCF->SplitStr(name, sSwitch->GetFlagByIndex(ST_SEP_PREFIX_SUFFIX, 1));

	if (vec.size() > 1)
		name = vec[1];
	else
		name = vec[0];

	vec.clear();

	vec = sCF->SplitStr(name, sSwitch->GetFlagByIndex(ST_SEP_PREFIX_SUFFIX, 2));

	return vec[0];
}

class CharNameModPlayerScript : PlayerScript
{
public:
	CharNameModPlayerScript() : PlayerScript("CharNameModPlayerScript") {}

	void OnLogin(Player* player)
	{
		std::string namePrefix = "";
		std::string nameSuffix = "";

		QueryResult result = CharacterDatabase.Query("SELECT namePrefix,nameSuffix FROM characters WHERE guid = '%u'",player->GetGUID().GetCounter());

		if (result)
		{
			Field* fields = result->Fetch();
			namePrefix = fields[0].Get<std::string>();
			nameSuffix = fields[1].Get<std::string>();
		}

		if (!namePrefix.empty())
			player->namePrefix = namePrefix + sSwitch->GetFlagByIndex(ST_SEP_PREFIX_SUFFIX, 1);

		if (!nameSuffix.empty())
			player->nameSuffix = sSwitch->GetFlagByIndex(ST_SEP_PREFIX_SUFFIX, 2) + nameSuffix;

		if (!namePrefix.empty() || !nameSuffix.empty())
			sWorld->UpdateNamePrefixSuffix(player, player->namePrefix, player->nameSuffix);

		sGS->UpdateGS(player);
	}
};
void AddSC_CharNameMod()
{
	new CharNameModPlayerScript();
}
