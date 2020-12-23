# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)

all: clean

	mkdir --parents $(PWD)/build/Boilerplate.AppDir
	apprepo --destination=$(PWD)/build appdir boilerplate smplayer smplayer-l10n smplayer-themes mencoder vdr-plugin-mplayer vdr-plugin-streamdev-client vdr-plugin-streamdev-server

	rm --force $(PWD)/build/Boilerplate.AppDir/*.desktop 				| true
	rm --force $(PWD)/build/Boilerplate.AppDir/*.svg 					| true
	rm --force $(PWD)/build/Boilerplate.AppDir/*.png					| true

	cp --force $(PWD)/AppDir/*.desktop $(PWD)/build/Boilerplate.AppDir/	| true
	cp --force $(PWD)/AppDir/*.png $(PWD)/build/Boilerplate.AppDir/ 	| true
	cp --force $(PWD)/AppDir/*.svg $(PWD)/build/Boilerplate.AppDir/ 	| true

	echo "exec \$${APPDIR}/bin/smplayer \"\$${@}\"" >> $(PWD)/build/Boilerplate.AppDir/AppRun

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage  $(PWD)/build/Boilerplate.AppDir $(PWD)/SMPlayer.AppImage


clean:
	rm -rf $(PWD)/build


# # Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
# #
# # Licensed under the Apache License, Version 2.0 (the "License");
# # you may not use this file except in compliance with the License.
# # You may obtain a copy of the License at
# #
# # http://www.apache.org/licenses/LICENSE-2.0
# #
# # Unless required by applicable law or agreed to in writing, software
# # distributed under the License is distributed on an "AS IS" BASIS,
# # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# PWD:=$(shell pwd)
# DESTINATION="MPlayer.AppImage"

# all: clean

# 	mkdir --parents $(PWD)/build

# 	wget --output-document=$(PWD)/build/build.rpm https://download1.rpmfusion.org/free/el/updates/8/x86_64/m/mplayer-1.4-9.el8.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

# 	wget --output-document=$(PWD)/build/build.rpm https://download1.rpmfusion.org/free/el/updates/8/x86_64/s/smplayer-20.6.0-1.el8.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

# 	wget --output-document=$(PWD)/build/build.rpm https://download1.rpmfusion.org/free/el/updates/8/x86_64/s/smplayer-themes-20.6.0-1.el8.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

# 	wget --output-document=$(PWD)/build/build.rpm https://download1.rpmfusion.org/free/el/updates/8/x86_64/m/mplayer-tools-1.4-9.el8.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

# 	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/libdvdread-5.0.3-9.el8.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

# 	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/PowerTools/x86_64/os/Packages/enca-1.19-1.el8.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

# 	wget --output-document=$(PWD)/build/build.rpm https://download1.rpmfusion.org/free/el/updates/8/x86_64/x/x264-libs-0.157-12.20190717git34c06d1.el8.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

# 	wget --output-document=$(PWD)/build/build.rpm https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/l/lirc-libs-0.10.0-19.el8.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

# 	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/libvdpau-1.1.1-7.el8.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

# 	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/qt5-qtbase-5.12.5-4.el8.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

# 	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/qt5-qtbase-gui-5.12.5-4.el8.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

# 	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/qt5-qtx11extras-5.12.5-1.el8.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

# 	wget --output-document=$(PWD)/build/build.rpm https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/q/qtsingleapplication-qt5-2.6.1-37.el8.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

# 	wget --output-document=$(PWD)/build/build.rpm https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/q/qtlockedfile-qt5-2.4-30.20150629git5a07df5.el8.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

# 	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/libicu-60.3-2.el8_1.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

# 	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/pcre2-utf16-10.32-1.el8.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

# 	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/libxcb-1.13.1-1.el8.x86_64.rpm
# 	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..



# 	cp -r --force $(PWD)/AppDir $(PWD)/build
# 	cp -r --force $(PWD)/build/usr/* $(PWD)/build/AppDir
# 	cp -r --force $(PWD)/build/usr/lib64/qt5/plugins/platforms $(PWD)/build/AppDir/bin/

# 	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage  $(PWD)/build/AppDir $(PWD)/SMPlayer.AppImage
# 	make clean


# clean:
# 	rm -rf $(PWD)/build
