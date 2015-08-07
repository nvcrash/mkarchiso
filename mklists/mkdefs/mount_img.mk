MOUNT_IMG=$(call SUDO, mount -o loop $(1) $(2))
REMOUNT_IMG=(lsblk | grep $(2) && $(call SUDO, umount $(2))); $(call MOUNT, $(1), $(2))
UMOUNT=$(call SUDO, umount $(1)))