﻿//* -*- C++ -*- */
// The following configuration file is designed to work for VxWorks
// 6.7 platforms using one of these compilers:
// 1) The GNU g++ compiler that is shipped with VxWorks 6.7
// 2) The Diab compiler that is shipped with VxWorks 6.7

#ifndef ACE_CONFIG_VXWORKS_6_7_H
#define ACE_CONFIG_VXWORKS_6_7_H
#include /**/ "pre.h"

#if !defined (ACE_VXWORKS)
# define ACE_VXWORKS 0x670
#endif /* ! ACE_VXWORKS */

#include "ace/config-vxworks6.6.h"

#undef ACE_HAS_NONCONST_INET_ADDR

#include /**/ "post.h"
#endif /* ACE_CONFIG_VXWORKS_6_7_H */

