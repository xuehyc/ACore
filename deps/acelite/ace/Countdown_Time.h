﻿// -*- C++ -*-

//=============================================================================
/**
 *  @file    Countdown_Time.h
 *
 *  @author Douglas C. Schmidt <schmidt@cs.wustl.edu>
 *  @author Irfan Pyarali <irfan@cs.wustl.edu>
 */
//=============================================================================

#ifndef ACE_COUNTDOWN_TIME_H
#define ACE_COUNTDOWN_TIME_H

#include /**/ "pre.h"

#if !defined (ACE_LACKS_PRAGMA_ONCE)
# pragma once
#endif /* ACE_LACKS_PRAGMA_ONCE */

#include "ace/Countdown_Time_T.h"

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

// The following typedef is here for ease of use and backward
// compatibility.
typedef ACE_Countdown_Time_T<ACE_Default_Time_Policy>
        ACE_Countdown_Time;

ACE_END_VERSIONED_NAMESPACE_DECL

#include /**/ "post.h"

#endif /* ACE_COUNTDOWN_TIME_H */
