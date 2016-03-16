build:
	sudo ./build-linux.sh
	
clean:
	rm -f disk_images/*.iso
	rm -f disk_images/*.flp
	rm -f source/*.bin
	rm -f programs/*.bin
	rm -f source/bootload/*.bin

vm:
	sudo qemu-system-i386 -curses -fda disk_images/EricOS.flp
    
test: clean build vm
