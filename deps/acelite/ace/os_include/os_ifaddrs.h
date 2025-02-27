﻿// -*- C++ -*-

//=============================================================================
/**
 *  @file    os_ifaddrs.h
 *
 *  os_ifaddrs.h include
 *
 *  @author Johnny Willemsen  <jwillemsen@remedy.nl>
 */
//=============================================================================

#ifndef ACE_OS_INCLUDE_OS_IFADDRS_H
#define ACE_OS_INCLUDE_OS_IFADDRS_H

#include /**/ "pre.h"

#include /**/ "ace/config-all.h"

#if !defined (ACE_LACKS_PRAGMA_ONCE)
# pragma once
#endif /* ACE_LACKS_PRAGMA_ONCE */

#if defined (ACE_VXWORKS)
#  include /**/ <net/ifaddrs.h>
#else
#  include /**/ <ifaddrs.h>
#endif /*ACE_VXWORKS */

#include /**/ "post.h"
#endif /* ACE_OS_INCLUDE_OS_IFADDRS_H */
