.PHONY: help check debian test-debian clean

help:
	@echo "Moegi OS build commands:"
	@echo "  make check        - Check build environment"
	@echo "  make debian       - Build Moegi OS Debian Edition"
	@echo "  make test-debian  - Boot Debian Edition ISO with QEMU"
	@echo "  make clean        - Remove generated output files"

check:
	sh scripts/check

debian:
	sh scripts/build debian

test-debian:
	sh tests/qemu/debian.sh

clean:
	rm -f output/*.iso
