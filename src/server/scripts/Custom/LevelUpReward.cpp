#include "Config.h"

class LevelUpReward : public PlayerScript
{
public:
	LevelUpReward() : PlayerScript("LevelUpReward") { }
	void OnLevelChanged(Player * player, uint8 oldLevel)
	{
		if (sConfigMgr->GetBoolDefault("LevelUpReward", true))  //默认开启
		{
            if (oldLevel == 80)
                ;
                
                
                
		}
	}
};

void AddSC_LevelUpReward()
{
	new LevelUpReward();
}
