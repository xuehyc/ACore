﻿// -*- C++ -*-

//=============================================================================
/**
 *  @file    SOCK_Dgram_Mcast.h
 *
 *  @author Irfan Pyrali <irfan@cs.wustl.edu>
 *  @author Tim Harrison <harrison@cs.wustl.edu>
 *  @author Douglas C. Schmidt <schmidt@cs.wustl.edu>
 *  @author Bill Fulton <bill_a_fulton@raytheon.com>
 *  @author Don Hinton <dhinton@objectsciences.com>
 */
//=============================================================================

#ifndef ACE_SOCK_DGRAM_MCAST_H
#define ACE_SOCK_DGRAM_MCAST_H

#include /**/ "pre.h"

#include /**/ "ace/ACE_export.h"

#if !defined (ACE_LACKS_PRAGMA_ONCE)
# pragma once
#endif /* ACE_LACKS_PRAGMA_ONCE */

#include "ace/SOCK_Dgram.h"
#include "ace/INET_Addr.h"

#if defined (ACE_SOCK_DGRAM_MCAST_DUMPABLE)
# include "ace/Containers_T.h"
# include "ace/Synch_Traits.h"
# include "ace/Thread_Mutex.h"
# if !defined (ACE_SDM_LOCK)
#  define ACE_SDM_LOCK ACE_SYNCH_MUTEX
# endif /* ACE_SDM_LOCK */
#endif /* ACE_SOCK_DGRAM_MCAST_DUMPABLE */

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

/**
 * @class ACE_SOCK_Dgram_Mcast
 *
 * @brief Defines the ACE socket wrapper for UDP/IP multicast.
 *
 * Supports multiple simultaneous subscriptions, unsubscription from one or
 * all subscriptions, and independent send/recv address and interface
 * specifications.  Constructor arguments determine per-instance optional
 * functionality.
 *
 * Note that multicast semantics and implementation details are @i very
 * environment-specific; this class is just a wrapper around the underlying
 * implementation and does not try to normalize the concept of multicast
 * communications.
 *
 * Usage Notes:
 * - Send and receive addresses and network interfaces, but not port number,
 *   are independent. While this instance is open, one send interface (and a
 *   default send address) is in effect and 0, 1, or multiple receive
 *   addresses/interfaces are in effect.
 * - The first open()/subscribe() invocation defines the network interface
 *   and default address used for all sends by this instance, defines the
 *   port number and optionally the multicast address bound to the underlying
 *   socket, and defines the (one) port number that is used for all subscribes
 *   (subsequent subscribes must pass the same port number or 0).
 * - The default loopback state is not explicitly set; the environment will
 *   determine the default state.  Note that some environments (e.g. some
 *   Windows versions) do not allow the default to be changed, and that the
 *   semantics of loopback control are environment dependent (e.g. sender vs.
 *   receiver control).
 * - In general, due to multicast design and implementation quirks/bugs, it is
 *   difficult to tell which address a received message was sent to or which
 *   interface it was received on (even if only one subscription is active).
 *   However, there are filtering options that can be applied, to narrow it
 *   down considerably.
 *
 * Interface specification notes (for subscribe() and unsubscribe()):
 * - If @a net_if == 0, the @c OPT_NULLIFACE_ALL and @c OPT_NULLIFACE_ONE
 *   options determine whether only the system default interface
 *   (if @c OPT_NULLIFACE_ONE is set) or all interfaces (if
 *   @c OPT_NULLIFACE_ALL is set) is affected.  Specifying all interfaces
 *   functions correctly only on:
 *      + Windows
 *      + Platforms with the ACE_HAS_GETIFADDRS config setting (includes Linux)
 *      + Platforms which accept the IP address as an interface
 *        name/specification
 *      + Systems with only one non-loopback interface.
 *   Other platforms require additional supporting code.
 * - Multiple subscriptions for the same address but different interfaces is
 *   normally supported, but re-subscription to an address/interface that is
 *   already subscribed is normally not allowed.
 * - The @a net_if interface specification syntax is environment-specific.
 *   UNIX systems will normally use device specifications such as "le0" or
 *   "elxl1", while other systems will use the IP address of the interface.
 *   Some platforms, such as pSoS, support only cardinal numbers as network
 *   interface specifications; for these platforms, just give these numbers in
 *   string form and join() will convert them into numbers.
 */
class ACE_Export ACE_SOCK_Dgram_Mcast : public ACE_SOCK_Dgram
{
public:

  /**
   * @brief Option parameters.
   *
   * These control per-instance optional functionality.  They are set via
   * an optional constructor argument.
   *
   * @note Certain option values are not valid for all environments (see
   * comments in source file for environment-specific restrictions).  Default
   * values are always valid values for the compilation environment.
   */
  enum options
  {
    /* Define whether a specific multicast address (in addition to the port
     * number) is bound to the socket.
     * @note:
     * - Effect of doing this is stack/environment dependent, but in most
     *   environments can be used to filter out unwanted unicast, broadcast,
     *   and (other) multicast messages sent to the same port number.
     * - Some IP stacks (e.g. some Windows) do not support binding multicast
     *   addresses.  Using this option will always cause an open() error.
     * - It's not strictly possible for user code to do this level of filtering
     *   without the bind; some environments support ways to determine which
     *   address a message was sent to, but this class interface does not
     *   support access to that information.
     * - The address (and port number) passed to open() (or the first
     *   join(), if open() is not explicitly invoked) is the one that is bound.
     */

    /// Disable address bind. (Bind only port.)
    /// @note This might seem odd, but we need a way to distinguish between
    /// default behavior, which might or might not be to bind, and explicitly
    /// choosing to bind or not to bind--which "is the question." ;-)
    OPT_BINDADDR_NO   = 0,
    /// Enable address bind. (Bind port and address.)
    OPT_BINDADDR_YES   = 1,
    /// Default value for BINDADDR option. (Environment-dependent.)
#if defined (ACE_LACKS_PERFECT_MULTICAST_FILTERING) \
    && (ACE_LACKS_PERFECT_MULTICAST_FILTERING == 1)
      /// Platforms that don't support perfect filtering. Note that perfect
      /// filtering only really applies to multicast traffic, not unicast
      /// or broadcast.
      DEFOPT_BINDADDR  = OPT_BINDADDR_YES,
# else
      /// At least some Win32 OS's can not bind mcast addr, so disable it.
      /// General-purpose default behavior is 'disabled', since effect is
      /// environment-specific and side-effects might be surprising.
      DEFOPT_BINDADDR  = OPT_BINDADDR_NO,
#endif /* ACE_LACKS_PERFECT_MULTICAST_FILTERING = 1) */

    /*
     * Define the interpretation of NULL as a join interface specification.
     * If the interface part of a multicast address specification is NULL, it
     * will be interpreted to mean either "the default interface" or "all
     * interfaces", depending on the setting of this option.
     * @note
     * - The @c OPT_NULLIFACE_ALL option can be used only in the following
     *   environments:
     *      + Windows
     *      + Platforms with the ACE_HAS_GETIFADDRS config setting (includes
     *        Linux)
     *      + Platforms which accept the IP address as an interface
     *        name/specification and for which
     *        ACE_Sock_Connect::get_ip_interfaces() is fully implemented
     *      + Systems with only one non-loopback interface.
     *   Other platforms require additional supporting code.
     * - The default behavior in most IP stacks is to use the default
     *   interface where "default" has rather ad-hoc semantics.
     * - This applies only to receives, not sends (which always use only one
     *   interface; NULL means use the "system default" interface).
     */
    /// Supported values:
    /// If (net_if==NULL), use default interface.
    /// @note This might seem odd, but we need a way to distinguish between
    /// default behavior, which might or might not be to bind, and explicitly
    /// choosing to bind or not to bind--which "is the question." ;-)
    OPT_NULLIFACE_ONE  = 0,
    /// If (net_if==NULL), use all mcast interfaces.
    OPT_NULLIFACE_ALL  = 2,
    /// Default value for NULLIFACE option. (Environment-dependent.)
#ifdef ACE_WIN32
      /// This is the (ad-hoc) legacy behavior for Win32/WinSock.
      /// @note Older version of WinSock/MSVC may not get all multicast-capable
      /// interfaces (e.g. PPP interfaces).
      DEFOPT_NULLIFACE = OPT_NULLIFACE_ALL,
#else
      /// General-purpose default behavior (as per legacy behavior).
      DEFOPT_NULLIFACE = OPT_NULLIFACE_ONE,
#endif /* ACE_WIN32 */
    /// All default options.
    DEFOPTS = DEFOPT_BINDADDR | DEFOPT_NULLIFACE
  };

  // = Initialization routines.

  /// Create an unitialized instance and define per-instance optional
  /// functionality.
  /**
   * You must invoke open() or join(), to create/bind a socket and define
   * operational parameters, before performing any I/O with this instance.
   */
  ACE_SOCK_Dgram_Mcast (options opts = DEFOPTS);

  /// Release all resources and implicitly or explicitly unsubscribe
  /// from all currently subscribed groups.
  /**
   * The OPT_DTORUNSUB_YES_ option defines whether an explicit unsubscribe() is
   * done by the destructor.  If not, most systems will automatically
   * unsubscribe upon the close of the socket.
   */
  ~ACE_SOCK_Dgram_Mcast (void);

  /**
   * Explicitly open/bind the socket and define the network interface
   * and default multicast address used for sending messages.
   *
   * This method is optional; if not explicitly invoked, it is invoked by
   * the first join(), using the subscribed address/port number and network
   * interface parameters.
   *
   * @param mcast_addr  Defines the default send address/port number and,
   *        if the @c OPT_BINDADDR_YES option is used, the multicast address
   *        that is bound to this socket. The port number in @a mcast_addr
   *        may be 0, in which case a system-assigned (ephemeral) port number
   *        is used for sending and receiving.
   *
   * @param net_if  If @a net_if is not 0, it defines the network interface
   *        used for all sends by this instance, otherwise the system default
   *        interface is used. (The @a net_if parameter is ignored if this
   *        feature is not supported by the environment.)
   *
   * @param reuse_addr  If @a reuse_addr is not 0, the @c SO_REUSEADDR option
   *        and, if it is supported, the SO_REUSEPORT option are enabled.
   *
   * @retval 0 on success
   * @retval -1 if the call fails. Failure can occur due to problems with
   * the address, port, and/or interface parameters or during system open()
   * or socket option processing.
   */
  int open (const ACE_INET_Addr &mcast_addr,
            const ACE_TCHAR *net_if = 0,
            int reuse_addr = 1);

  // = Multicast group subscribe/unsubscribe routines.

  /// Join a multicast group on a given interface (or all interfaces, if
  /// supported).
  /**
   * The given group is joined on the specified interface.  If option
   * OPT_NULLIFACE_ALL is used and @a net_if is = 0, the group is joined on
   * all multicast capable interfaces (IFF supported).  Multiple subscriptions
   * to various address and interface combinations are supported and tracked.
   * If this is the first invocation of subscribe(), and open() was not
   * previously invoked, open() will be invoked using @a mcast_addr for binding
   * the socket and @a net_if as the interface for send().
   *
   * Returns: -1 if the call fails.  Failure can occur due to problems with
   * the address, port#, and/or interface parameters or during the subscription
   * attempt.  Once bind() has been invoked (by the first open() or
   * subscribe()), returns errno of ENXIO if the port# is not 0 and does not
   * match the bound port#, or if OPT_BINDADDR_YES option is used
   * and the address does not match the bound address.  Returns errno of
   * ENODEV if the addr/port#/interface parameters appeared valid, but no
   * subscription(s) succeeded.  An error is unconditionally returned if
   * option OPT_NULLIFACE_ALL is used, @a net_if is NULL, and
   * ACE_Sock_Connect::get_ip_interfaces() is not implemented in this
   * environment.
   *
   * Note that the optional @a reuse_addr parameter does not apply to
   * subscriptions; it is only used if open() is implicitly invoked (see above).
   *
   * Uses the mcast_addr to determine protocol_family, and protocol which
   * we always pass as 0 anyway.
   */
  int join (const ACE_INET_Addr &mcast_addr,
            int reuse_addr = 1,               // (see above)
            const ACE_TCHAR *net_if = 0);


  /// Leave a multicast group on a given interface (or all interfaces, if
  /// supported).
  /**
   * The specified group/interface combination is unsubscribed.  If option
   * OPT_NULLIFACE_ALL is used and @a net_if is = 0, the group is unsubscribed
   * from all interfaces (IFF supported).
   *
   * Returns: -1 if the unsubscribe failed. Most environments will return -1
   * if there was no active subscription for this address/interface combination.
   * An error is unconditionally returned if option OPT_NULLIFACE_ALL is used,
   * @a net_if is = 0, and ACE_Sock_Connect::get_ip_interfaces() is not
   * implemented in this environment (_even if_ the subscribe() specifies a
   * non- NULL @a net_if).
   *
   * leave() replaces unsubscribe() and uses mcast_addr to determine
   * protocol_family, and protocol which we always pass as 0 anyway.
   */
  int leave (const ACE_INET_Addr &mcast_addr,
             const ACE_TCHAR *net_if = 0);

  // = Data transfer routines.

  /// Send @a n bytes in @a buf, using the multicast address and network interface
  /// defined by the first open() or subscribe().
  ssize_t send (const void *buf,
                size_t n,
                int flags = 0) const;

  /// Send @a n iovecs, using the multicast address and network interface
  /// defined by the first open() or subscribe().
  ssize_t send (const iovec iov[],
                int n,
                int flags = 0) const;

  // = Options.

  /// Set a socket option.
  /**
   * Set an IP option that takes a char as input, such as IP_MULTICAST_LOOP
   * or IP_MULTICAST_TTL.  This is just a more concise, nice interface to a
   * subset of possible ACE_SOCK::set_option calls, but only works for
   * IPPROTO_IP or IPPROTO_IPV6 level options.
   *
   * Returns 0 on success, -1 on failure.
   *
   * @deprecated  This method has been deprecated since it cannot be used
   * easily with with IPv6 options. Use ACE_SOCK::set_option instead.
   */
  int set_option (int option, char optval);

  /// Dump the state of an object.
  /**
   * Logs the setting of all options, the bound address, the send address and
   * interface, and the list of current subscriptions.
   */
  void dump (void) const;

  /// Declare the dynamic allocation hooks.
  ACE_ALLOC_HOOK_DECLARE;

  /// Override write acessor for the constructor options (@see enum options above)
  /// This class is typically default instantiated in a connection handler templated
  /// framework so these cannot be specified on construction.
  void opts (int opts);

  /// Read acessor for the constructor options (@see enum options above)
  int opts () const;

private:

  /// Subscribe to a multicast address on one or more network interface(s).
  /// (No QoS support.)
  int subscribe_ifs (const ACE_INET_Addr &mcast_addr,
                     const ACE_TCHAR *net_if,
                     int reuse_addr);

  /// Do subscription processing w/out updating the subscription list.
  /// (Layered method for <subscribe> processing).
  int subscribe_i (const ACE_INET_Addr &mcast_addr,
                   int reuse_addr = 1,
                   const ACE_TCHAR *net_if = 0);

  /// Unsubscribe from a multicast address on one or more network interface(s).
  int unsubscribe_ifs (const ACE_INET_Addr &mcast_addr,
                       const ACE_TCHAR *net_if = 0);

  /// Do unsubscription processing w/out udpating subscription list.
  ///  (Layered method for <unsubscribe> processing).
  int unsubscribe_i (const ACE_INET_Addr &mcast_addr,
                     const ACE_TCHAR *net_if = 0);

protected:

  /// Contains common open functionality so that inheriting classes can
  /// reuse it.
  int open_i (const ACE_INET_Addr &mcast_addr,        // Bound & sendto address.
              const ACE_TCHAR *net_if = 0,            // Net interface for sends.
              int reuse_addr = 1);

  /// Empty the dynamic subscription list.
  int clear_subs_list (void);

private:
  /// Per-instance options..
  int opts_;

  /// Multicast address to which local send() methods send datagrams.
  ACE_INET_Addr  send_addr_;
  /// Network interface to which all send() methods send multicast datagrams.
  ACE_TCHAR *send_net_if_;

#if defined (ACE_SOCK_DGRAM_MCAST_DUMPABLE)
 typedef ACE_DLList<ip_mreq>  subscription_list_t;
 typedef ACE_DLList_Iterator<ip_mreq>  subscription_list_iter_t;
 /// List of currently subscribed addr/iface pairs (and assc. types).
 mutable subscription_list_t  subscription_list_;
 /// Lock used to protect subscription list.
 mutable ACE_SDM_LOCK subscription_list_lock_;
     // (Lock type does not need to support recursive locking.)
#endif /* ACE_SOCK_DGRAM_MCAST_DUMPABLE */

};

ACE_END_VERSIONED_NAMESPACE_DECL

#if defined (__ACE_INLINE__)
#include "ace/SOCK_Dgram_Mcast.inl"
#endif /* __ACE_INLINE__ */

#include /**/ "post.h"
#endif /* ACE_SOCK_DGRAM_MCAST_H */
