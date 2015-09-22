MOUNT_ISO=$(call SUDO, mount -t iso9660 -o loop $(1) $(2))
REMOUNT_ISO=$(FIND_MOUNT_POINT) && $(call SUDO, umount $(2))); $(call MOUNT, $(1), $(2))
