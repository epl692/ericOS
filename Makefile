build:
	sudo ./build-linux.sh
	
clean:
	rm -f ~/Workspaces/nasm/mikeOS/disk_images/*.iso
	rm -f ~/Workspaces/nasm/mikeOS/disk_images/*.flp
	rm -f ~/Workspaces/nasm/mikeOS/source/*.bin
	rm -f ~/Workspaces/nasm/mikeOS/programs/*.bin
	rm -f ~/Workspaces/nasm/mikeOS/source/bootload/*.bin
	rm -f ~/Web/*.iso
	rm -f ~/Web/*.flp

vm:
	sudo qemu-system-i386 -curses -fda disk_images/EricOS.flp
    
publish: clean build
	cp ~/Workspaces/nasm/mikeOS/disk_images/*.iso ~/Web/
	cp ~/Workspaces/nasm/mikeOS/disk_images/*.flp ~/Web/

test: clean build vm