MOUNT=$(call SUDO, mount -o loop $(1) $(2))
REMOUNT=(lsblk | grep $(2) && $(call SUDO, umount $(2))); $(call MOUNT, $(1), $(2))
