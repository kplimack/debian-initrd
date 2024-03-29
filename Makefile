.PHONY: tmp

initrd.ihr.gz: initrd.ihr
	gzip $<

initrd.ihr: tmp initrd
	cd tmp && cpio -id < ../initrd
	patch -p0 < http.patch
	cd tmp && find . | cpio --create --format="newc" > ../$@

initrd: initrd.gz
	gunzip -c $< > initrd

initrd.gz:
	wget 'http://ftp.nl.debian.org/debian/dists/wheezy/main/installer-amd64/current/images/netboot/debian-installer/amd64/initrd.gz' -O $@

tmp:
	rm -rf tmp
	mkdir $@

clean:
	rm -rf tmp
	rm -f initrd
	rm -f initrd.gz
