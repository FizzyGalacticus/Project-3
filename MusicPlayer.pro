#-------------------------------------------------
#
# Project created by QtCreator 2014-05-01T18:35:59
#
#-------------------------------------------------

QT       += core gui multimedia

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = MusicPlayer
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp

HEADERS  += mainwindow.h \
    menus.h \
    actions.h \
    setup.h \
    componentactions.h \
    menuactions.h

FORMS    += mainwindow.ui

RESOURCES += \
    Resources.qrc

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

OTHER_FILES += \
    android/AndroidManifest.xml
