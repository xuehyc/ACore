/*
** Made by Traesh https://github.com/Traesh
** AzerothCore 2019 http://www.azerothcore.org/
** Conan513 https://github.com/conan513
** Made into a module by Micrah https://github.com/milestorme/
*/

#include "ScriptMgr.h"
#include "Player.h"
#include "Configuration/Config.h"
#include "World.h"
#include "LFGMgr.h"
#include "Chat.h"
#include "Opcodes.h"

class lfg_solo_announce : public PlayerScript
{

public:

    lfg_solo_announce() : PlayerScript("lfg_solo_announce") {}

    void OnLogin(Player* player)
    {
        // Announce Module
        if (sConfigMgr->GetBoolDefault("SoloLFG.Announce", true))
        {
            ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00Solo Dungeon Finder |rmodule.");
        }
    }
};

class lfg_solo : public PlayerScript
{
public:
    lfg_solo() : PlayerScript("lfg_solo") { }
    
   // Docker Installation prevents warnings. In order to avoid the issue, we need to add __attribute__ ((unused)) 
   // to the player variable to tell the compiler it is fine not to use it.
   void OnLogin(Player* player)
   {
       if (sConfigMgr->GetIntDefault("SoloLFG.Enable", true))
        {
            if (!sLFGMgr->IsTesting())
            {
            sLFGMgr->ToggleTesting();
            }
        }
   }
};

void AddLfgSoloScripts()
{
    new lfg_solo_announce();
    new lfg_solo();
}
