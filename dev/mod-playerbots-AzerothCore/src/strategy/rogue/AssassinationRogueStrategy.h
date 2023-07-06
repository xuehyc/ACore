﻿
#ifndef _PLAYERBOT_ASSASSINATIONROGUESTRATEGY_H
#define _PLAYERBOT_ASSASSINATIONROGUESTRATEGY_H

#include "MeleeCombatStrategy.h"
#include "AssassinationRogueStrategy.h"

class AssassinationRogueStrategy : public MeleeCombatStrategy
{
public:
    AssassinationRogueStrategy(PlayerbotAI* ai);

public:
    virtual void InitTriggers(std::vector<TriggerNode*> &triggers) override;
    virtual std::string const getName() override { return "melee"; }
    virtual NextAction** getDefaultActions() override;
    virtual int GetType() { return MeleeCombatStrategy::GetType() | STRATEGY_TYPE_DPS; }
};

#endif
