import QtQuick 2.0
import "../../../Material2"

Rectangle {

    width: 500
    height: 667
    color: "white"

    ListView {
        anchors.top : parent.top
        anchors.topMargin: 8
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        model : 5
        spacing : 16
        delegate : Item {
            width:100
            height:100

            Column {
                width: parent.width

                MaterialShadow {
                    anchors.fill: card
                    shader: true
                    depth: (modelData + 1)
                }

                Rectangle {
                    id: card
                    width: 100
                    height: 100
                }

                Item {
                    height: 8
                    width: parent.width
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text : "Depth : " + (modelData + 1)
                }
            }
        }

    }


}
