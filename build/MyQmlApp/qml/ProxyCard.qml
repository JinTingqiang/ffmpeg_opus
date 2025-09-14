import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    width: parent ? parent.width : 400
    radius: 8
    color: "#f9f9f9"
    border.color: "#dcdcdc"

    implicitHeight: mainCol.implicitHeight + 24   // 24 给上下 margin

    property string title: "代理组"
    property int value: 100
    property bool expanded: false
    property var options: ["-hide_banner", "-v quiet", "-v warning"]

    // 👇 控制箭头和复选框的右对齐列
    property int rightColumn: 520

    Column {
        id: mainCol
        anchors.fill: parent
        anchors.margins: 12
        spacing: 8

        // 顶部 row
        Item {
            width: parent.width
            height: 40

            // 左边文字 + 数值
            Row {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10

                Text {
                    text: root.title
                    font.pixelSize: 16
                    color: "#333"
                    verticalAlignment: Text.AlignVCenter
                }

                Rectangle {
                    width: 40
                    height: 24
                    radius: 12
                    color: "#e0f0ff"
                    anchors.verticalCenter: parent.verticalCenter

                    Text {
                        anchors.centerIn: parent
                        text: root.value
                        font.pixelSize: 14
                        color: "#0077ff"
                    }
                }
            }

            // 右侧箭头：对齐 rightColumn
            ToolButton {
                text: root.expanded ? "▲" : "▼"
                font.pixelSize: 14
                background: Item {}
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: parent.width - root.rightColumn
                onClicked: root.expanded = !root.expanded
            }
        }

        // 下方复选框区域
        Column {
            width: parent.width
            spacing: 8
            visible: root.expanded

            Repeater {
                model: root.options
                delegate: Item {
                    width: parent.width
                    height: 24

                    // 左边文字
                    Text {
                        text: modelData
                        font.pixelSize: 14
                        color: "#333"
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    // 右边复选框：对齐 rightColumn
                    Rectangle {
                        id: box
                        width: 18
                        height: 18
                        radius: 3
                        border.color: "#666"
                        color: checkItem.checked ? "#409EFF" : "transparent"
                        anchors.right: parent.right
                        anchors.rightMargin: parent.width - root.rightColumn
                        anchors.verticalCenter: parent.verticalCenter

                        // 小钩子
                        Canvas {
                            anchors.fill: parent
                            visible: checkItem.checked
                            onPaint: {
                                var ctx = getContext("2d")
                                ctx.clearRect(0,0,width,height)
                                ctx.strokeStyle = "white"
                                ctx.lineWidth = 2
                                ctx.beginPath()
                                ctx.moveTo(width*0.2, height*0.5)
                                ctx.lineTo(width*0.45, height*0.75)
                                ctx.lineTo(width*0.8, height*0.25)
                                ctx.stroke()
                            }
                        }
                    }

                    // 逻辑用的 CheckBox（透明）
                    CheckBox {
                        id: checkItem
                        anchors.fill: box
                        opacity: 0
                    }
                }
            }
        }
    }
}
