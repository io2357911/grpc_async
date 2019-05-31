# целевая платформа -  arm | pc
TARGET=pc

# сборка - release | debug
BUILD=debug
#BUILD=release


# build (сборка приложений)


compile:
	if [ ! -d build/$(TARGET)/$(BUILD) ]; then \
		mkdir -p build/$(TARGET)/$(BUILD) ; \
		cd build/$(TARGET)/$(BUILD) ; cmake ../../../ -DTARGET=$(TARGET) -DBUILD=$(BUILD) -DENABLE_TESTS=ON ; \
	fi
	cd build/$(TARGET)/$(BUILD) ; $(MAKE) -j12

clean:
	- rm -rf build/$(TARGET)/$(BUILD)

distclean:
	- rm -rf build

style:
	find src/ -iname *.h -o -iname *.cc | xargs clang-format -i
