TEMPLATE = lib
CONFIG += plugin

TARGET = TagParserPro

QT += gui

#Enable c++11
CONFIG += c++11

#TODO 暂时链接库文件
#include(PhoenixPlayerCore/Core/Core.pri)
include (PhoenixPlayerCore/Core/CoreHeaders.pri)
include (PhoenixPlayerCore/Plugins/MusicLibrary/TagParserPro/TagParserPro.pri)

INCLUDEPATH += \
        $$PWD

unix {
    CONFIG += link_pkgconfig
    PKGCONFIG += taglib
}

#DESTDIR = ../../../plugins

win32 {
        INCLUDEPATH += $(TAGLIB_DIR)/include
        LIBS += -L$(TAGLIB_DIR)/lib -ltag
        DEFINES += TAGLIB_STATIC
}

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/release/ -lPhoenixPlayer
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/debug/ -lPhoenixPlayer
else:unix: LIBS += -L$$OUT_PWD/ -lPhoenixPlayer

INCLUDEPATH += $$PWD/
DEPENDPATH += $$PWD/