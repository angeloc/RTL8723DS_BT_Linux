DRV_SRC_DIR	:= bluetooth_uart_driver
TOOL_SRC_DIR 	:= rtk_hciattach
FIRMWARE_DIR 	:= 8723D

PREFIX ?= $(DESTDIR)/usr
BINDIR ?= ${PREFIX}/bin

all: module userspace

module:
	make -C $(DRV_SRC_DIR)

userspace:
	make -C $(TOOL_SRC_DIR)

install: module_install firmware_install userspace_install

module_install:
	make -C $(DRV_SRC_DIR) install

firmware_install:
	make -C $(FIRMWARE_DIR)

userspace_install:
	mkdir -p $(BINDIR)
	install -m 755 $(TOOL_SRC_DIR)/rtk_hciattach $(BINDIR)/rtk_hciattach

