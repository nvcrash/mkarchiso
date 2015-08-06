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


current_dir := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

# Make configuration files

MKCONFIG?=${current_dir}/config.mk
MKLISTS?=${current_dir}/mklists
MKDEFS?=${MKLISTS}/mkdefs/*.mk
MKVARS?=${MKLISTS}/vars.mk
MKDISTROS?=${MKLISTS}/mkdistros/*.mk




all: ${ISO}

-include ${MKVARS}
-include ${MKDEFS}
-include ${MKCONFIG}
-include ${MKDISTROS}

%.copy: % custom

%.chroot64: %_x86_64_root
	${CHROOT} $^

%.chroot32: %_x86_32_root
	setarch i386
	${CHROOT} $^
