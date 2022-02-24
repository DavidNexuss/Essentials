all:
	cd j4dmenu_dir; cmake .; make -j j4-dmenu-desktop
	rm -f j4dmenu
	ln -s j4dmenu_dir/j4-dmenu-desktop j4dmenu

clean:
	cd j4dmenu_dir; make clean
	rm -f j4dmenu
