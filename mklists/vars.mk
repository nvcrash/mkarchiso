# Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
#
# Everyone is permitted to copy and distribute verbatim copies
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# maintained by Tom SCHNEIDER <dev.tomschneider@gmail.com>

# default variable configuration
XORRISO?=/usr/bin/xorriso
CHROOTSH?=/bin/bash
CHROOT?=/usr/bin/arch-chroot
MKSQUASHFS?=/usr/bin/mksquashfs
UNSQUASHFS?=/usr/bin/unsquashfs
RMDIR?=/bin/rmdir
RMREC?=/bin/rm -rf
MKDIRP?= /bin/mkdir -p
MOUNTLOOP?=/bin/mount -o loop
RM?=/bin/rm -v
RSYNC?=/usr/bin/rsync

SYNCDIRS?=${RSYNC} -ua
SYNCDIRS_LINK_COPY= ${RSYNC} -ua
