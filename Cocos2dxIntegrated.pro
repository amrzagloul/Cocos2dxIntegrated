APP_NAME = Cocos2dxIntegrated

CONFIG += qt warn_on cascades10

INCLUDEPATH += 	"ext-libs/cocos2d-2.1beta3-x-2.1.1/cocos2dx" \
				"ext-libs/cocos2d-2.1beta3-x-2.1.1/cocos2dx/include" \
				"ext-libs/cocos2d-2.1beta3-x-2.1.1/cocos2dx/kazmath/include" \
				"ext-libs/cocos2d-2.1beta3-x-2.1.1/cocos2dx/platform" \
				"ext-libs/cocos2d-2.1beta3-x-2.1.1/cocos2dx/platform/blackberry" \
				"ext-libs/cocos2d-2.1beta3-x-2.1.1/CocosDenshion/include"

LIBS += -lEGL \
		-lGLESv2 \
		-lbps \
		-lcurl \
		-lxml2 \
		-lOpenAL \
		-lalut \
		-lasound \
		-ljpeg \
		-lpng \
		-lfreetype \
		-lscreen \
		-lm \
		-lz
	
include(config.pri)

device {
    CONFIG(debug, debug|release) {
        # Device-Debug custom configuration
        LIBS += -L$$_PRO_FILE_PWD_"/ext-libs/cocos2d-2.1beta3-x-2.1.1/CocosDenshion/proj.blackberry/Device-Debug" -lCocosDenshion \
        		-L$$_PRO_FILE_PWD_"/ext-libs/cocos2d-2.1beta3-x-2.1.1/cocos2dx/proj.blackberry/Device-Debug" -lcocos2dx \
        		-L$$_PRO_FILE_PWD_"/ext-libs/cocos2d-2.1beta3-x-2.1.1/cocos2dx/platform/third_party/blackberry/libraries/armle-v7" -ltiff
    }

    CONFIG(release, debug|release) {
        # Device-Release custom configuration
        LIBS += -L$$_PRO_FILE_PWD_"/ext-libs/cocos2d-2.1beta3-x-2.1.1/CocosDenshion/proj.blackberry/Device-Release" -lCocosDenshion \
        		-L$$_PRO_FILE_PWD_"/ext-libs/cocos2d-2.1beta3-x-2.1.1/cocos2dx/proj.blackberry/Device-Release" -lcocos2dx \
        		-L$$_PRO_FILE_PWD_"/ext-libs/cocos2d-2.1beta3-x-2.1.1/cocos2dx/platform/third_party/blackberry/libraries/armle-v7" -ltiff
    }
}

simulator {
    CONFIG(debug, debug|release) {
        # Simulator-Debug custom configuration
    }
}
