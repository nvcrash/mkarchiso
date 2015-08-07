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

arch_%.iso: arch_%
	echo ${current_dir}
	rm ${current_dir}/$@ ; echo
	${XORRISO} -abort_on NEVER -as mkisofs \
-iso-level 3 \
-full-iso9660-filenames \
-volid "ARCH_${ARCH_RELEASE}" \
-eltorito-boot /isolinux/isolinux.bin \
-eltorito-catalog /isolinux/boot.cat \
-no-emul-boot -boot-load-size 4 -boot-info-table \
-isohybrid-mbr ${current_dir}/$</isolinux/isohdpfx.bin \
-eltorito-alt-boot \
-e /EFI/archiso/efiboot.img \
-no-emul-boot -isohybrid-gpt-basdat \
-output ${current_dir}/$@ \
 ${current_dir}/$<

ARCH_PKG_INIT=pacman-key --init && pacman-key --populate archlinux
ARCH_PKGINSTALL=pacman -Sy

ARCH_MAKE_ROOT=\
cd $(current_dir) \
&& mkdir -p $(current_dir)/$(1)/arch/$(2)/$(1)_$(2)_root \
&& cd $(1)/arch/$(2) && ${UNSQUASHFS} airootfs.sfs \
; MOUNTPOINT=$(current_dir)/$(1)/arch/$(2)/$(1)_$(2)_root \
; IMAGEPATH=$(current_dir)/$(1)/arch/$(2)/squashfs-root/airootfs.img \
&& $(call REMOUNT,$$IMAGEPATH,$$MOUNTPOINT) \
&& ln -sft $(current_dir) $$MOUNTPOINT

ARCH_LOCK=\
cd $(current_dir)/$(1) \
&& cd `pwd -P` \
&& sudo mv $(current_dir)/$(1)/pkglist.txt ../pkglist.$(2).txt; \
cd $${PWD}/.. \
&& $(call UMOUNT,$(1)) \
&& $(RMDIR) $(1) \
&& rm airootfs.sfs \
&& ${MKSQUASHFS} squashfs-root airootfs.sfs \
&& rm -r squashfs-root \
&& md5sum airootfs.sfs > airootfs.md5


arch_%_x86_64_root: arch_%
	$(call ARCH_MAKE_ROOT,$^,x86_64)

arch_%_i386_root: arch_%
	$(call ARCH_MAKE_ROOT,$^,i386)

arch_%.lock64: arch_%_x86_64_root
	$(call ARCH_LOCK,$^,x86_64)

arch_%.lock32: arch_%_i386_root
	$(call ARCH_LOCK,$^,x86_64)


# arch_%.clean64: arch_%
# 	@${RM} $(current_dir)/arch_%_X86_64_root/root/.bash_history 2> /dev/null;echo -n
# 	@${RM} $(current_dir)/arch_%_X86_64_root/root/.zsh_history  2> /dev/null;echo -n


# arch_%.lock64: arch_%_X86_64_root
# 	mv $(current_dir)/arch_%_X86_64_root/pkglist.txt $^/arch/pkglist.x86_64.txt; \
# 	cd $^/arch/x86_64 && umount arch_%_X86_64_root && rm airootfs.sfs && ${MKSQUASHFS} squashfs-root airootfs.sfs && $(RMDIR) $^ && rm -r squashfs-root && md5sum airootfs.sfs > airootfs.md5


.PHONY: arch_%.clean64
