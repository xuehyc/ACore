﻿// -*- C++ -*-

//=============================================================================
/**
 *  @file    os_syslog.h
 *
 *  definitions for system error logging
 *
 *  @author Don Hinton <dhinton@dresystems.com>
 *  @author This code was originally in various places including ace/OS.h.
 */
//=============================================================================

#ifndef ACE_OS_INCLUDE_OS_SYSLOG_H
#define ACE_OS_INCLUDE_OS_SYSLOG_H

#include /**/ "pre.h"

#include /**/ "ace/config-all.h"

#if !defined (ACE_LACKS_PRAGMA_ONCE)
# pragma once
#endif /* ACE_LACKS_PRAGMA_ONCE */

#if !defined (ACE_LACKS_SYSLOG_H)
#  include /**/ <syslog.h>
#endif /* !ACE_LACKS_SYSLOG_H */

#include /**/ "post.h"
#endif /* ACE_OS_INCLUDE_OS_SYSLOG_H */
