// NavButton.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
// import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Fusion

// Button {}

Button {
    id: control
    width: parent.width
    Layout.fillWidth: true
    implicitHeight: 40
    checkable: true
    autoExclusive: true
    focusPolicy: Qt.StrongFocus
    // focusPolicy: Qt.NoFocus
    // focus: false
    // focusIndicator: null
    // 不知道为什么alias不生效，采用下面的方式
    // property alias labelText: label.text
    // property alias iconSource: icon.source
    property string labelText: ""     // 自定义属性
    property url iconSource: ""       // 自定义属性


    background: Rectangle {
        anchors.fill: parent
        radius: 6
        border.width: 0
        color: control.down ? "#c0d8ff"
             : control.checked ? "#d0e8ff"
             : control.hovered ? "#e0e0e0"
                                : "transparent"
    }

    contentItem: Row {
        anchors.fill: parent
        anchors.leftMargin: 10
        spacing: 40

        Image {
            id: icon
            width: 24
            height: 24
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
            source: control.iconSource
        }

        Text {
            id: label
            font.pixelSize: 18
            font.family: "Microsoft YaHei"
            color: "#000000"
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            text: control.labelText
        }
    }
}
