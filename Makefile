
# do not forget that to build pvsneslib, you have to install compiler and tools first !
all:
	cd compiler && \
	make && \
	make install && \
	cd ../tools && \
	make && \
	make install && \
	cd ../pvsneslib && \
	make && \
	cd ../snes-examples && \
	make && \
	make install && \
	echo && \
	echo Build finished successfully ! && \
	echo


clean:
	cd compiler ; \
	make clean ; \
	cd ../tools ; \
	make clean ; \
	cd ../pvsneslib ; \
	make clean ; \
	cd ../devkitsnes/bin ; \
	find . -type f -not -name '816-opt.py' -delete ; \
	rm -f ../tools/* ; \
	cd ../../snes-examples ; \
	make clean ; \
	rm -rf release
	
# to create the release version for github containing binaries and all snes-examples :
release: all
	rm -rf release && mkdir -p release/pvsneslib && \
	cp -r devkitsnes release/pvsneslib/devkitsnes && \
	mkdir release/pvsneslib/pvsneslib && cp -r pvsneslib/include release/pvsneslib/pvsneslib/include && \
	cp -r pvsneslib/lib release/pvsneslib/pvsneslib/lib && \
	mkdir release/pvsneslib/pvsneslib/docs && cp -r pvsneslib/docs/html release/pvsneslib/pvsneslib/docs/html && \
	cp pvsneslib/PVSnesLib_Logo.png release/pvsneslib/pvsneslib/PVSnesLib_Logo.png && \
	cp pvsneslib/pvsneslib_license.txt release/pvsneslib/pvsneslib/pvsneslib_license.txt && \
	cp pvsneslib/pvsneslib_snesmod.txt release/pvsneslib/pvsneslib/pvsneslib_snesmod.txt && \
	cp -r snes-examples release/pvsneslib/snes-examples && \
	cd release && zip -r -m pvsneslib.zip pvsneslib && \
	echo && echo Release created successfully ! && echo

.PHONY: all