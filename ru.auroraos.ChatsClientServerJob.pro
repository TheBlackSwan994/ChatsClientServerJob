TARGET = ru.auroraos.ChatsClientServerJob

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

HEADERS += \

DISTFILES += \
    qml/pages/AddContactPage.qml \
    qml/pages/PageOfChatUsers.qml \
    rpm/ru.auroraos.ChatsClientServerJob.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/ru.auroraos.ChatsClientServerJob.ts \
    translations/ru.auroraos.ChatsClientServerJob-ru.ts \
