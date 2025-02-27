﻿// -*- C++ -*-

//=============================================================================
/**
 *  @file    os_stdarg.h
 *
 *  handle variable argument list
 *
 *  @author Don Hinton <dhinton@dresystems.com>
 *  @author This code was originally in various places including ace/OS.h.
 */
//=============================================================================

#ifndef ACE_OS_INCLUDE_OS_STDARG_H
#define ACE_OS_INCLUDE_OS_STDARG_H

#include /**/ "pre.h"

#include /**/ "ace/config-lite.h"

#if !defined (ACE_LACKS_PRAGMA_ONCE)
# pragma once
#endif /* ACE_LACKS_PRAGMA_ONCE */

#if !defined (ACE_LACKS_STDARG_H)
# include /**/ <stdarg.h>
#endif /* !ACE_LACKS_STDARG_H */

#if !defined (va_copy)
#if defined (__va_copy)
#define va_copy(d, s) __va_copy((d),(s))
#else
#define va_copy(d, s) memcpy((void *)&(d),(void *)&(s),sizeof(va_list))
#endif
#endif

#include /**/ "post.h"
#endif /* ACE_OS_INCLUDE_OS_STDARG_H */
