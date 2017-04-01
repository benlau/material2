import QtQuick 2.0
import QtQuick.Controls 2.1

AbstractButton {
    id: button

    property alias ink: ink

    background: Item {
    }

    Ink {
        id: ink
        anchors.fill: parent

        propagateComposedEvents: true

        preventStealing: true
    }

    Connections {
        target: ink
        onPressed: {
            mouse.accepted = false;
        }
    }

    onPressedChanged: {
        if (!pressed) {
            ink.clear();
        }
    }
}
