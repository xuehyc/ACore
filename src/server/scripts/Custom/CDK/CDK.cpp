#pragma execution_character_set("utf-8")
#include "CDK.h"
#include "../Reward/Reward.h"
#include <fstream>
#include <iostream>
//
//std::unordered_map<std::string, uint32> CDKMap;
//
//void CDKC::Load()
//{
//	CDKMap.clear();
//
//	QueryResult result = WorldDatabase.PQuery(sWorld->getBoolConfig(CONFIG_ZHCN_DB) ? 
//		"SELECT 兑换码, 奖励模板ID FROM __兑换码" :
//		"SELECT cdk, rewId FROM _cdk");
//
//	if (result)
//	{
//		do
//		{
//			Field* fields = result->Fetch();
//            CDKMap.insert(std::make_pair(fields[0].Get<std::string>(), fields[1].Get<uint32>()));
//
//		} while (result->NextRow());
//	}
//}
//
//std::string CDKC::Create()
//{
//	int name_len = 10;
//	char buff[128];
//	char metachar[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
//
//	for (int i = 0; i < name_len - 1; i++)
//		buff[i] = metachar[urand(0, 61)];
//
//	buff[name_len - 1] = '\0';
//
//	std::string s = buff;
//
//	return s;
//}
//
//void CDKC::Create(uint32 count, uint32 rewId, std::string comment)
//{
//	for (size_t i = 0; i < count; i++)
//		WorldDatabase.DirectPExecute(sWorld->getBoolConfig(CONFIG_ZHCN_DB) ? 
//		"INSERT INTO __兑换码(备注,兑换码,奖励模板ID) VALUES ('%s','%s','%u')" :
//		"INSERT INTO _cdk(comment,cdk,rewId) VALUES ('%s','%s','%u')", comment, Create(), rewId);
//
//	Load();
//}
//
//void CDKC::OutPut()
//{
//	std::ofstream outfile;
//	outfile.open("兑换码.txt");
//
//	if (outfile.is_open())
//	{
//		if (QueryResult result = WorldDatabase.PQuery(sWorld->getBoolConfig(CONFIG_ZHCN_DB) ? 
//			"SELECT 备注,ID,兑换码,奖励模板ID FROM __兑换码 ORDER BY 备注,ID" :
//			"SELECT comment,id,cdk,rewId FROM _cdk ORDER BY comment,id"))
//		{
//			do
//			{
//				Field* fields = result->Fetch();
//                outfile << "[" << fields[0].Get<std::string>() << "][编号" << fields[1].Get<uint32>() << "][奖励" << fields[3].Get<uint32>() << "][" << fields[2].Get<std::string>() << "]" << std::endl;
//			} while (result->NextRow());
//		}
//
//		outfile.close();
//	}
//}
//
//void CDKC::AddGossip(Player* player, Object* obj)
//{
//	player->PlayerTalkClass->ClearMenus();
//	player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_BATTLE, "", 9991, 9991, "", 0, true);
//
//	if (obj->ToCreature())
//		player->SEND_GOSSIP_MENU(obj->GetEntry(), obj->GetGUID());
//	else
//		player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, obj->GetGUID());
//
//	ChatHandler(player->GetSession()).PSendSysMessage("[兑换码]：请输入正确的兑换码来换取奖励！");
//}
//
//bool CDKC::Redeem(Player* player, uint32 sender, uint32 action, std::string cdk)
//{
//	if (sender == 9991 && action == 9991)
//	{
//		player->CLOSE_GOSSIP_MENU();
//
//		auto itr = CDKMap.find(cdk);
//
//		if (itr != CDKMap.end())
//		{
//			sRew->Rew(player, itr->second);
//			WorldDatabase.PExecute(sWorld->getBoolConfig(CONFIG_ZHCN_DB) ? "DELETE FROM __兑换码 WHERE 兑换码 = '%s'" : "DELETE FROM _CDK WHERE cdk = '%s'", cdk);
//			ChatHandler(player->GetSession()).PSendSysMessage("[兑换码]：兑换完成");
//			CDKMap.erase(itr++);
//			return true;
//		}
//
//		ChatHandler(player->GetSession()).PSendSysMessage("[兑换码]：兑换码错误");
//		return true;
//	}
//
//	return false;
//}
