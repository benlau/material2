#-------------------------------------------------
#
# Project created by QtCreator 2016-02-25T18:56:34
#
#-------------------------------------------------

QT       += testlib qml

TARGET = material2unittests
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app

SOURCES +=     main.cpp    

DEFINES += SRCDIR=\\\"$$PWD/\\\" QUICK_TEST_SOURCE_DIR=\\\"$$PWD/qmltests\\\"

include(vendor/vendor.pri)
include(../../material2.pri)

DISTFILES +=     qpm.json     qmltests/tst_QmlTests.qml \
    mockup/mockup_Shadow.qml

HEADERS +=    

