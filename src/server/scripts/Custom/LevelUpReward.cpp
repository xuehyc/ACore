#include "Config.h"
#include "Pet.h"

class LevelUpReward : public PlayerScript
{
public:
	LevelUpReward() : PlayerScript("LevelUpReward") { }
	void OnLevelChanged(Player * player, uint8 oldLevel)
	{
        uint8 levelupReward_petFreeTalentPoints = 2;    //升级奖励的宠物天赋数量
		if (sConfigMgr->GetBoolDefault("LevelUpReward", true))  //默认开启
		{
            if (oldLevel == 80)
                ;
            Pet* pet=player->GetPet();
           
            uint8 pet_freeTalentPoints =pet->GetFreeTalentPoints();
            pet->SetFreeTalentPoints(pet_freeTalentPoints+ levelupReward_petFreeTalentPoints);//奖励宠物天赋
		}
	}
};

void AddSC_LevelUpReward()
{
	new LevelUpReward();
}
