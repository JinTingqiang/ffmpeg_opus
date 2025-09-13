// NavButton.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Control {
    id: root
    property alias text: label.text
    property bool checked: false

    implicitWidth: 120
    implicitHeight: 40

    background: Rectangle {
        radius: 6
        border.width: 0
        color: root.checked ? "#d0e8ff"
              : root.pressed ? "#d9d9d9"
              : root.hovered ? "#f0f0f0"
                             : "transparent"
    }

    contentItem: Text {
        id: label
        anchors.centerIn: parent
        font.pixelSize: 20
        font.family: "Microsoft YaHei"
        color: "#000000"
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: root.checked = true
    }
}
