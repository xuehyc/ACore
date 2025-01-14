﻿// The following configuration file is designed to work for LynxOS,
// version 4.0.0 and later, using the GNU g++ compiler.

#ifndef ACE_CONFIG_H
#define ACE_CONFIG_H
#include /**/ "pre.h"

// System include files are not in sys/, this gets rid of warning.
#define __NO_INCLUDE_WARN__

#define __FREEBSDCODE__
#include <param.h>
#undef __FREEBSDCODE__

#include "ace/config-g++-common.h"

// Compile using multi-thread libraries.
#if !defined (ACE_MT_SAFE)
#  define ACE_MT_SAFE 1
#endif

#include "ace/config-posix.h"

#if defined (__x86__)
#  define ACE_HAS_PENTIUM
#elif defined (__powerpc__)
   // It looks like the default stack size is 15000.
   // ACE's Recursive_Mutex_Test needs more.
#  define ACE_NEEDS_HUGE_THREAD_STACKSIZE 65536
   // This doesn't work on LynxOS 3.0.0, because it resets the TimeBaseRegister.
   // # define ACE_HAS_POWERPC_TIMER
#endif /* __x86__ || __powerpc__ */

#define ACE_HAS_2_PARAM_ASCTIME_R_AND_CTIME_R
#define ACE_HAS_3_PARAM_READDIR_R
#define ACE_HAS_4_4BSD_SENDMSG_RECVMSG
#define ACE_HAS_ALLOCA
#define ACE_HAS_ALLOCA_H
#define ACE_HAS_AUTOMATIC_INIT_FINI
#define ACE_HAS_BROKEN_PREALLOCATED_OBJECTS_AFTER_FORK 1
#define ACE_HAS_BROKEN_SIGEVENT_STRUCT
#define ACE_HAS_CHARPTR_SHMAT
#define ACE_HAS_CHARPTR_SHMDT
#define ACE_HAS_CLOCK_GETTIME
#define ACE_HAS_CLOCK_SETTIME
#define ACE_HAS_CPLUSPLUS_HEADERS
#define ACE_HAS_DIRENT
#define ACE_HAS_GETIFADDRS
#define ACE_HAS_GETPAGESIZE
#define ACE_HAS_GETRUSAGE
#define ACE_HAS_GETRUSAGE_PROTOTYPE
#define ACE_HAS_GPERF
#define ACE_HAS_HANDLE_SET_OPTIMIZED_FOR_SELECT
#define ACE_HAS_ICMP_SUPPORT 1
#define ACE_HAS_IP_MULTICAST
#define ACE_HAS_MEMCHR
#define ACE_HAS_MKDIR
#define ACE_HAS_MSG
#define ACE_HAS_NANOSLEEP
#define ACE_HAS_NEW_NOTHROW
#define ACE_HAS_NONCONST_CLOCK_SETTIME
#define ACE_HAS_NONCONST_MSGSND
#define ACE_HAS_NONCONST_READV
#define ACE_HAS_NONCONST_SELECT_TIMEVAL
#define ACE_HAS_NONCONST_SETRLIMIT
#define ACE_HAS_NONCONST_WRITEV
#define ACE_HAS_POSIX_NONBLOCK
#define ACE_HAS_POSIX_TIME
#define ACE_HAS_PTHREADS_UNIX98_EXT
#define ACE_HAS_PTHREAD_GETCONCURRENCY
#define ACE_HAS_PTHREAD_SETCONCURRENCY
#define ACE_HAS_PTHREAD_SIGMASK_PROTOTYPE
#define ACE_HAS_RECURSIVE_THR_EXIT_SEMANTICS
#define ACE_HAS_REENTRANT_FUNCTIONS
#define ACE_HAS_SCANDIR
#define ACE_HAS_SIGACTION_CONSTP2
#define ACE_HAS_SIGINFO_T
#define ACE_HAS_SIGSUSPEND
#define ACE_HAS_SIGTIMEDWAIT
#define ACE_HAS_SIGWAIT
#define ACE_HAS_SIG_ATOMIC_T
#define ACE_HAS_SIG_C_FUNC
#define ACE_HAS_SOCKADDR_IN6_SIN6_LEN
#define ACE_HAS_SOCKADDR_IN_SIN_LEN
#define ACE_HAS_SOCKADDR_MSG_NAME
#define ACE_HAS_SOCKLEN_T
#define ACE_HAS_SSIZE_T
#define ACE_HAS_STREAMS
#define ACE_HAS_STRINGS
#define ACE_HAS_STRING_CLASS
#define ACE_HAS_SYSCTL
#define ACE_HAS_SYS_FILIO_H
#define ACE_HAS_SYS_SOCKIO_H
#define ACE_HAS_TERMIOS
#define ACE_HAS_THREAD_SPECIFIC_STORAGE
#define ACE_HAS_TIMEZONE_GETTIMEOFDAY

#define ACE_LACKS_ALPHASORT_PROTOTYPE
#define ACE_LACKS_ISCTYPE
#define ACE_LACKS_MADVISE
#define ACE_LACKS_NETDB_REENTRANT_FUNCTIONS
#define ACE_LACKS_REALPATH
#define ACE_LACKS_SCANDIR_PROTOTYPE
#define ACE_LACKS_SIGINFO_H
#define ACE_LACKS_STRPTIME
#define ACE_LACKS_SUSECONDS_T
#define ACE_LACKS_TIMESPEC_T
#define ACE_LACKS_UCONTEXT_H
#define ACE_LACKS_STD_WSTRING

#define ACE_DEFAULT_BASE_ADDR ((char *) 0)
#define ACE_EXPLICIT_TEMPLATE_DESTRUCTOR_TAKES_ARGS
#define ACE_MALLOC_ALIGN 8
#define ACE_PAGE_SIZE 4096
#define ACE_POSIX_SIG_PROACTOR
#define ACE_SCANDIR_CMP_USES_CONST_VOIDPTR

// LynxOS has poll.h but it is unusable since implementation is not provided
#define ACE_LACKS_POLL_H

#if defined (ACE_HAS_SVR4_DYNAMIC_LINKING)
#  define ACE_HAS_BROKEN_THREAD_KEYFREE
#endif /* ACE_HAS_SVR4_DYNAMIC_LINKING */

#if ACE_LYNXOS_MAJOR == 4 && ACE_LYNXOS_MINOR == 0
// LynxOS 4.0
#  define ACE_LACKS_GETOPT_PROTOTYPE
#  define ACE_LACKS_INET_ATON_PROTOTYPE
#  define ACE_LACKS_PTHREAD_ATTR_SETSTACKADDR
#  define ACE_LACKS_REGEX_H
#  define ACE_LACKS_RWLOCK_T
#  define ACE_LACKS_SETDETACH
#  define ACE_LACKS_STRCASECMP_PROTOTYPE
#  define ACE_LACKS_STRNCASECMP_PROTOTYPE
#  define ACE_LACKS_SYS_SELECT_H
#  define ACE_LACKS_THREAD_PROCESS_SCOPING
#endif

#if (ACE_LYNXOS_MAJOR > 4) || (ACE_LYNXOS_MAJOR == 4 && ACE_LYNXOS_MINOR >= 2)
// LynxOS 4.2 and 5.0
#  define ACE_HAS_POSIX_SEM_TIMEOUT
#  define ACE_HAS_MUTEX_TIMEOUTS
#endif

#if (ACE_LYNXOS_MAJOR < 5)
// LynxOS 4.x
#  define ACE_HAS_LYNXOS4_GETPWNAM_R
#  define ACE_HAS_LYNXOS4_SIGNALS
#  define ACE_HAS_SEMUN
#  define ACE_HAS_STRBUF_T
#  define ACE_HAS_SYSV_IPC
#  define ACE_LACKS_CONST_TIMESPEC_PTR
#  define ACE_LACKS_GETPGID
#  define ACE_LACKS_ISBLANK
#  define ACE_LACKS_MKSTEMP_PROTOTYPE
#  define ACE_LACKS_MKTEMP_PROTOTYPE
#  define ACE_LACKS_PTHREAD_ATTR_SETSTACK
#  define ACE_LACKS_PUTENV_PROTOTYPE
#  define ACE_LACKS_SETEGID
#  define ACE_LACKS_SETENV
#  define ACE_LACKS_SETEUID
#  define ACE_LACKS_SWAB_PROTOTYPE
#  define ACE_LACKS_UNSETENV
#  define ACE_LACKS_USECONDS_T
#  define ACE_LACKS_VSNPRINTF
#  define ACE_LACKS_WCHAR_H
#  define ACE_SYS_SIGLIST sys_siglist
#  if !defined (ACE_HAS_THREADS)
#    undef ACE_HAS_AIO_CALLS
#  endif
#else
// LynxOS 5.0
#  define ACE_HAS_CONSISTENT_SIGNAL_PROTOTYPES
#  define ACE_HAS_NONCONST_INET_ADDR
#  define ACE_LACKS_INET_ATON_PROTOTYPE
#  define ACE_LACKS_SEMBUF_T
#  define ACE_LACKS_STROPTS_H
#  define ACE_LACKS_STRRECVFD
#  define ACE_LACKS_SYS_SEM_H
#  define ACE_SYS_SIGLIST __sys_siglist
#endif

#include /**/ "post.h"

#endif /* ACE_CONFIG_H */
