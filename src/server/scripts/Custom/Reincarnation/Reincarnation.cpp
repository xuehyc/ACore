﻿//#pragma execution_character_set("utf-8")
//#include "Reincarnation.h"
//#include "../FunctionCollection/FunctionCollection.h"
//#include "../Reward/Reward.h"
//#include "../Requirement/Requirement.h"
//#include "../CommonFunc/CommonFunc.h"
//#include "../String/myString.h"
//
//std::unordered_map<uint32, ReincarnationTemplate> ReincarnationMap;
//
//void Reincarnation::Load()
//{
//	ReincarnationMap.clear();
//	QueryResult result = WorldDatabase.Query(sWorld->getBoolConfig(CONFIG_ZHCN_DB) ? 
//		"SELECT 转生等级,需求模板ID,奖励模板ID,菜单文本 from __转生" :
//		"SELECT level,reqId,rewId,gossipText from _reincarnation");
//	if (result)
//	{
//		do
//		{
//			Field* fields = result->Fetch();
//			uint32 level = fields[0].Get<uint32>();
//			ReincarnationTemplate Temp;
//			Temp.reqId = fields[1].Get<uint32>();
//			Temp.rewId = fields[2].Get<uint32>();
//			Temp.gossipText = fields[3].Get<std::string>();
//			ReincarnationMap.insert(std::make_pair(level, Temp));
//		} while (result->NextRow());
//	}
//}
//
//uint32 Reincarnation::GetMaxLevel()
//{
//	uint32 max = 0;
//
//	if (ReincarnationMap.empty())
//		return max;
//
//	for (auto i = ReincarnationMap.begin(); i != ReincarnationMap.end(); i++)
//		if (max < i->first)
//			max = i->first;
//
//	return max;
//}
//
//std::string Reincarnation::GetGossipText(Player* player)
//{
//	for (auto i = ReincarnationMap.begin(); i != ReincarnationMap.end(); i++)
//		if (player->reincarnationLv == i->first)
//			return i->second.gossipText;
//
//	return "";
//}
//
//void Reincarnation::AddGossip(Player* player, Object* obj)
//{
//	if (!ReincarnationMap.empty())
//	{
//		if (player->reincarnationLv >= GetMaxLevel())
//			AddGossipItemFor(player,GOSSIP_ICON_CHAT, GetGossipText(player).c_str(), SENDER_REINCARNATION, GOSSIP_ACTION_INFO_DEF);
//		else
//		{
//			AddGossipItemFor(player,GOSSIP_ICON_CHAT, GetGossipText(player).c_str(), SENDER_REINCARNATION, GOSSIP_ACTION_INFO_DEF);
//
//			uint32 rewId = 0;
//			uint32 reqId = 0;
//			GetParams(player, rewId, reqId);
//			const char* text = sString->Format(sString->GetText(CORE_STR_TYPES(STR_REICARNATION_REQ)), player->reincarnationLv + 1);
//
//			AddGossipItemFor(player,GOSSIP_ICON_CHAT, sString->GetText(CORE_STR_TYPES(STR_REICARNATION_CLICK)), SENDER_REINCARNATION, GOSSIP_ACTION_INFO_DEF + 1, sReq->Notice(player, reqId, text, ""), sReq->Golds(reqId), 0);
//		}
//	}
//
//	if (obj->ToCreature())
//		SendGossipMenuFor(player,obj->GetEntry(), obj->GetGUID());
//	else
//		SendGossipMenuFor(player,DEFAULT_GOSSIP_MESSAGE, obj->GetGUID());
//}
//
//void Reincarnation::GetParams(Player* player, uint32 &rewId, uint32 &reqId)
//{
//	for (auto i = ReincarnationMap.begin(); i != ReincarnationMap.end(); i++)
//		if (player->reincarnationLv + 1 == i->first)
//		{
//			rewId = i->second.rewId;
//			reqId = i->second.reqId;
//		}
//}
//
//void Reincarnation::Save(Player* player)
//{
//	CharacterDatabase.Execute("UPDATE characters SET reincarnationLv = '%u' WHERE guid = '%u'", player->reincarnationLv,player->GetGUID().GetCounter());
//}
//
//void Reincarnation::Load(Player* player)
//{
//	if (QueryResult result = CharacterDatabase.Query("SELECT reincarnationLv FROM characters WHERE guid = '%u'", player->GetGUID().GetCounter()))
//		player->reincarnationLv = result->Fetch()[0].Get<uint32>();
//}
//
//void Reincarnation::DoAction(Player* player, Object* obj, uint32 action)
//{
//	if (action == GOSSIP_ACTION_INFO_DEF)
//		AddGossip(player, obj);
//	else if (action == GOSSIP_ACTION_INFO_DEF + 1)
//	{
//		uint32 rewId = 0;
//		uint32 reqId = 0;
//		GetParams(player, rewId, reqId);
//
//		if (sReq->Check(player, reqId))
//		{
//			sRew->Rew(player, rewId);
//			sReq->Des(player, reqId);
//			player->reincarnationLv++;
//			Save(player);
//			const char* text = sString->Format(sString->GetText(CORE_STR_TYPES(STR_REICARNATION_ANNOUNCE)), sCF->GetNameLink(player).c_str(), player->reincarnationLv);
//			sWorld->SendScreenMessage(text);
//		}
//		
//		CloseGossipMenuFor(player);
//	}
//}
//
//
//class ReincarnationPlayerScript : PlayerScript
//{
//public:
//	ReincarnationPlayerScript() : PlayerScript("ReincarnationPlayerScript") {}
//
//	void OnLogin(Player* player)
//	{
//		sReincarnation->Load(player);
//	}
//};
//
//void AddSC_Reincarnation()
//{
//	new ReincarnationPlayerScript();
//}
