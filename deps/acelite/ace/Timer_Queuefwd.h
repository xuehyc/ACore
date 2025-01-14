﻿// -*- C++ -*-

//=============================================================================
/**
 *  @file    Timer_Queuefwd.h
 *
 *  Forward declarations and typedefs of ACE_Timer_Queue class.
 *
 *  @author Ossama Othman <ossama@dre.vanderbilt.edu>
 */
//=============================================================================

#ifndef ACE_TIMER_QUEUE_FWD_H
#define ACE_TIMER_QUEUE_FWD_H

#include /**/ "pre.h"

#include "ace/config-all.h"

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

class ACE_Event_Handler;
template <class TYPE> class ACE_Abstract_Timer_Queue;
typedef ACE_Abstract_Timer_Queue<ACE_Event_Handler*> ACE_Timer_Queue;

ACE_END_VERSIONED_NAMESPACE_DECL

#include /**/ "post.h"

#endif  /* ACE_TIMER_QUEUE_FWD_H */
