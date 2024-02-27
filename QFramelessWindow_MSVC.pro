QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
INCLUDEPATH += \
    $$PWD/TitleBar \

SOURCES += \
    TitleBar/titlebar.cpp \
    TitleBar/titlebarbutton.cpp \
    main.cpp \
    qframelesswindow.cpp

HEADERS += \
    TitleBar/titlebar.h \
    TitleBar/titlebarbutton.h \
    TitleBar/titlebarbuttonprivate.h \
    TitleBar/titlebarprivate.h \
    qframelesswindow.h

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    Resources.qrc \
    StyleSheet.qrc

win32 {
    contains(QT_ARCH, i386) {
        message("32-bit")
    }else {
        message("64-bit")
        CONFIG(debug, debug|release) {
            include("$$PWD\qwindowkit_debug\share\QWindowKit\qmake/QWKWidgets.pri")
        } else {
            include("$$PWD\qwindowkit_release\share\QWindowKit\qmake/QWKWidgets.pri")
        }

    }
}
