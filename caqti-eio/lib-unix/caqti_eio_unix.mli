(* Copyright (C) 2022  Petter A. Urkedal <paurkedal@gmail.com>
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or (at your
 * option) any later version, with the LGPL-3.0 Linking Exception.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * and the LGPL-3.0 Linking Exception along with this library.  If not, see
 * <http://www.gnu.org/licenses/> and <https://spdx.org>, respectively.
 *)

(** Establinging Connections for Eio with Unix

    This module provides database connections for applications using Eio.  It
    supports all database drivers. *)

include Caqti_connect_sig.S_without_connect with type 'a future := 'a
include Caqti_connect_sig.Connect
  with type 'a future := 'a
   and type ('a, 'e) pool := ('a, 'e) Pool.t
   and type connection := connection
   and type 'a connect_fun := Eio.Stdenv.t -> sw: Eio.Switch.t -> Uri.t -> 'a
   and type 'a with_connection_fun := Eio.Stdenv.t -> Uri.t -> 'a

val or_fail : ('a, [< Caqti_error.t]) result -> 'a
(** Eliminates the error-case by raising {!Caqti_error.Exn}. *)