--暂时做不到范围拾取,开启NPCBot的自动拾取也可,也可解放双手
From 27e7f12c17da104777157e3c62395bcd76612e69 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?=E5=BE=AE=E7=AC=91?= <362368035@qq.com>
Date: Tue, 23 Feb 2021 21:38:45 +0800
Subject: [PATCH] =?UTF-8?q?=E4=B8=80=E9=94=AE=E6=8B=BE=E5=8F=96=E5=AE=9D?=
 =?UTF-8?q?=E7=9F=B3=E6=8E=A7=E5=88=B6?=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

---
 modules/WackyCore/WackyCoreScripts.cpp |  14 +--
 src/server/game/Events/FakeBot.cpp     |  20 ++--
 src/server/game/Events/TF_coreload.cpp | 167 ++++++++++++++++++++++++---------
 src/server/game/Globals/ObjectMgr.h    |  22 +++++
 src/server/worldserver/Master.cpp      |  13 +--
 5 files changed, 168 insertions(+), 68 deletions(-)

diff --git a/modules/WackyCore/WackyCoreScripts.cpp b/modules/WackyCore/WackyCoreScripts.cpp
index 9ec1e1e..d5ea040 100644
--- a/modules/WackyCore/WackyCoreScripts.cpp
+++ b/modules/WackyCore/WackyCoreScripts.cpp
@@ -55,7 +55,7 @@ public:
             { "全体模式",   SEC_ADMINISTRATOR,      false,      &quantimoshi,       "" },
             { "中立模式",   SEC_ADMINISTRATOR,      false,      &zhonglimoshi,       "" },
             //{ "_loot",		SEC_ADMINISTRATOR,			false,		&HandleAOELootCommand,				"" },
-            { "_loot",		SEC_ADMINISTRATOR,			true,		&HandleAOELootCommand,				"",  },
+            //{ "_loot",		SEC_ADMINISTRATOR,			true,		&HandleAOELootCommand,				"",  },
         };
         return JfCommandTable;
 
@@ -377,6 +377,7 @@ public:
        
         return true;
     }
+
     static bool HandleVipInfo(ChatHandler* handler, char const* /*args*/)
     {
         Player* player = handler->GetSession()->GetPlayer();
@@ -2856,15 +2857,16 @@ public:
 
+   void OnCreatureKill(Player* killer, Creature* killed)
+     {


+        int id = killer->GetSession()->GetAccountId();
+        if (sObjectMgr->Get_TF_shiqu(id) == 1)
+           {
+             AoeLoot(killer, 1000.0f);
 
+             sObjectMgr->SendSerMessage("怪物掉落已经到你的背包,注意查收!!");
 

+           }
+           return;
         
+     }
 

+const uint32 ObjectMgr::Get_TF_shiqu(uint32 entry)
+{
+    auto it = m_tf_yijianshiquMap.find(entry);
+    if (it == m_tf_yijianshiquMap.end())
+        return 0;
+    else
+        return it->second.idx;
+}

   




@@ -1235,7 +1245,10 @@ void ObjectMgr::RunNpcTeleport1(Player* player, Item *item, uint32 uiSender, uin
         
 
  
+   if (itr->second.NeedType == 51)
+   {
+       sObjectMgr->kaiguan(player);
+   }

     if (itr->second.NeedType == 10)
     {
         player->SetBindPoint(player->GetGUID());

  
 }
 
 



+
+
+//////////////////////////////////////////////////////////////////////////////一键拾取控制
+void ObjectMgr::LoadshiquString()
+{
+   
+
+    QueryResult result = CharacterDatabase.Query("SELECT * FROM `_TF_一键拾取开关`;");
+    if (!result)
+    {
+        //sLog->outString("功能表 >>>>>>>>>>>>>>>>>>>>> 加载[_TF_一键拾取开关] 没有数据");
+        return;
+    }
+
+    uint32 counter = 0;
+    tf_yijianshiqu st;
+    do
+    {
+        Field* fields = result->Fetch();
+        st.entry = fields[0].GetUInt32();
+        st.idx = fields[1].GetUInt32();
+
+        m_tf_yijianshiquMap.insert(tf_yijianshiquMap::value_type(st.entry, st));
+        ++counter;
+    } while (result->NextRow());
+
+    //sLog->outString("功能表 >>>>>>>>>>>>>>>>>>>>> 加载[_TF_一键拾取开关] 总计 %u 条数据", counter);
+}
+void ObjectMgr::kaiguan(Player* player)
+{
+    sObjectMgr->LoadshiquString();
+    uint32 ID =  player->GetSession()->GetAccountId();
+
+    QueryResult result = CharacterDatabase.Query("SELECT  *  FROM `_TF_一键拾取开关` WHERE `entry` = %u;", ID);
+    if (!result)
+    {
+        CharacterDatabase.PExecute("INSERT INTO `_TF_一键拾取开关` (`entry`,`idx` ) VALUES (%u,%u );", ID,  1);
+        ChatHandler(player->GetSession()).PSendSysMessage("[|cFFFF0000拾取系统|r]:当前为: >>>>>> |cFF00FFFF开启拾取|r <<<<<< 状态!!");
+        sObjectMgr->LoadshiquString();
+
+    }
+    else
+    {
+          sObjectMgr->LoadshiquString();
+        if (sObjectMgr->Get_TF_shiqu(ID) != 1)
+        {
+            CharacterDatabase.PExecute("UPDATE `_TF_一键拾取开关`SET `idx` ='%u' WHERE(`entry`='%u') ", 0, ID);
+            ChatHandler(player->GetSession()).PSendSysMessage("[|cFFFF0000拾取系统|r]:当前为: >>>>>> |cFF00FFFF开启拾取|r <<<<<< 状态!!");
+          
+        }
+        else
+        {
+            CharacterDatabase.PExecute("UPDATE `_TF_一键拾取开关`SET `idx` ='%u' WHERE(`entry`='%u') ", 1, ID);
+            ChatHandler(player->GetSession()).PSendSysMessage("[|cFFFF0000拾取系统|r]:当前为: >>>>>> |cFFFF1717关闭拾取|r <<<<<< 状态!!" );
+            
+        }
+        return;
+    }
+    
+    return;
+    
+  
+       
+
+}
+//////////////////////////////////////////////////////////////////////////////一键拾取控制
 void ObjectMgr::LoadJFData()
 {
+    LoadshiquString();
     wphsLoad();
     Load_TF_String();
     Load_TF_Config();
diff --git a/src/server/game/Globals/ObjectMgr.h b/src/server/game/Globals/ObjectMgr.h
index ac2d22d..e7b7dac 100644
--- a/src/server/game/Globals/ObjectMgr.h
+++ b/src/server/game/Globals/ObjectMgr.h
@@ -447,6 +447,17 @@ struct MrBanStrTemp
 };
 typedef std::map<uint32, MrBanStrTemp> MrBanStrMap;
 //////////////////////////////////////////////////////////////////////////////敏感字符禁用
+
+ //////////////////////////////////////////////////////////////////////////////一键拾取控制
+struct tf_yijianshiqu
+{
+    uint32 entry;
+    uint32 idx;
+};
+typedef std::map<uint32, tf_yijianshiqu> tf_yijianshiquMap;
+
+//////////////////////////////////////////////////////////////////////////////一键拾取控制
+
 ////////////////////////////////////////////////////////////////////////////修改角色信息
 struct MrCgChar
 {
@@ -1154,6 +1165,7 @@ public:
     TF_ConfigMap m_tf_ConfigMap;
     TF_StrMap m_tf_StringMap;
     const uint32 Get_TF_Config(uint32 entry);
+    const uint32 Get_TF_shiqu(uint32 entry);
     const char* get_TF_String(uint32 idx);
      ////////////////////////////////////核心功能配置提示
      ////////////////////////////////////加载所有功能
@@ -1281,6 +1293,9 @@ public:
         MrBanStrMap m_MrBanStrMap;
         void StringReplace(std::string& str);
         std::string GetStrMid(std::string& str, const char *s1, const char *s2);
+
+      
+
         //////////////////////////////////////////////////////////////////////////////敏感字符禁用
         //////////////////////////////////////////////////////////////////////////////角色信息修改
         void LoadMrCgChar();
@@ -1370,6 +1385,13 @@ public:
         void SendCategoryMsg(Player* player, uint32 categoryId);
         void Action(Player* player, uint32 categoryId);
         //////////////////////////////////////////////////////////////////////////////物品回收
+
+          //////////////////////////////////////////////////////////////////////////////一键拾取控制
+        void LoadshiquString();
+        void kaiguan(Player* player);
+        tf_yijianshiquMap m_tf_yijianshiquMap;
+       
+        //////////////////////////////////////////////////////////////////////////////一键拾取控制
         static ObjectMgr* instance();
 
     typedef std::unordered_map<uint32, Item*> ItemMap;
diff --git a/src/server/worldserver/Master.cpp b/src/server/worldserver/Master.cpp
index 0d8ae50..4b86835 100644
-

