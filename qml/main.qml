// NavButton.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: qsTr("FFmpeg 工具面板")

    RowLayout {
        anchors.fill: parent

        // 左侧菜单栏
        Rectangle {
            width: 120
            color: "#f5f5f5"
            Layout.fillHeight: true
            border.color: "#dcdcdc"

            Column {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 15

                // 首页
                Button {
                    id: navBtn1
                    text: "首页"
                    width: parent.width
                    Layout.fillWidth: true
                    height: 40
                    checkable: true
                    autoExclusive: true
                    focusPolicy: Qt.StrongFocus


                    background: Rectangle {
                        anchors.fill: parent
                        radius: 6
                        border.width: 0
                        color: navBtn1.down ? "#c0d8ff"
                             : navBtn1.checked ? "#d0e8ff"
                             : navBtn1.hovered ? "#e0e0e0"
                                                : "transparent"
                    }

                    // 👇 自定义内容，文字靠左
                    contentItem: Text {
                        text: parent.text
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 10   // 左边留点间距
                        font.pixelSize: 20
                        font.family: "Microsoft YaHei"
                        color: "#000000"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                    }

                    onClicked: console.log("点击了 首页")
                }

                Button {
                    id: navBtn2
                    text: "ffprobe"
                    width: parent.width
                    Layout.fillWidth: true
                    height: 40
                    checkable: true
                    autoExclusive: true
                    focusPolicy: Qt.StrongFocus


                    background: Rectangle {
                        anchors.fill: parent
                        radius: 6
                        border.width: 0
                        color: navBtn2.down ? "#c0d8ff"
                             : navBtn2.checked ? "#d0e8ff"
                             : navBtn2.hovered ? "#e0e0e0"
                                                : "transparent"
                    }

                    // 👇 自定义内容，文字靠左
                    contentItem: Text {
                        text: parent.text
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 10   // 左边留点间距
                        font.pixelSize: 20
                        font.family: "Microsoft YaHei"
                        color: "#000000"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                    }

                    onClicked: console.log("点击了 ffprobe")
                }

                // ffplay
                Button {
                    id: navBtn3
                    text: "ffplay"
                    width: parent.width
                    Layout.fillWidth: true
                    height: 40
                    checkable: true
                    autoExclusive: true
                    focusPolicy: Qt.StrongFocus


                    background: Rectangle {
                        anchors.fill: parent
                        radius: 6
                        border.width: 0
                        color: navBtn3.down ? "#c0d8ff"
                             : navBtn3.checked ? "#d0e8ff"
                             : navBtn3.hovered ? "#e0e0e0"
                                                : "transparent"
                    }

                    contentItem: Text {
                        text: parent.text
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        font.pixelSize: 20
                        font.family: "Microsoft YaHei"
                        color: "#000000"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                    }
                }

                // ffmpeg
                Button {
                    id: navBtn4
                    text: "ffmpeg"
                    width: parent.width
                    Layout.fillWidth: true
                    height: 40
                    checkable: true
                    autoExclusive: true
                    focusPolicy: Qt.StrongFocus


                    background: Rectangle {
                        anchors.fill: parent
                        radius: 6
                        border.width: 0
                        color: navBtn4.down ? "#c0d8ff"
                             : navBtn4.checked ? "#d0e8ff"
                             : navBtn4.hovered ? "#e0e0e0"
                                                : "transparent"
                    }

                    contentItem: Text {
                        text: parent.text
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        font.pixelSize: 20
                        font.family: "Microsoft YaHei"
                        color: "#000000"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                    }
                }

                // 关于
                Button {
                    id: navBtn5
                    text: "关于"
                    width: parent.width
                    Layout.fillWidth: true
                    height: 40
                    checkable: true
                    autoExclusive: true
                    focusPolicy: Qt.StrongFocus


                    background: Rectangle {
                        anchors.fill: parent
                        radius: 6
                        border.width: 0
                        color: navBtn5.down ? "#c0d8ff"
                             : navBtn5.checked ? "#d0e8ff"
                             : navBtn5.hovered ? "#e0e0e0"
                                                : "transparent"
                    }

                    // 👇 自定义内容，文字靠左
                    contentItem: Text {
                        text: parent.text
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 10   // 左边留点间距
                        font.pixelSize: 20
                        font.family: "Microsoft YaHei"
                        color: "#000000"
                        verticalAlignment: Text.AlignVCenter   // 👈 保证垂直居中
                        horizontalAlignment: Text.AlignLeft
                    }

                    onClicked: console.log("点击了 关于")
                }
            }
        }

        // 右侧主界面（占位）
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#ffffff"

            Text {
                anchors.centerIn: parent
                text: "右侧内容区"
                font.pixelSize: 24
                color: "#666"
            }
        }
    }
}

// import QtQuick 2.15
// import QtQuick.Controls 2.15
// import QtQuick.Controls.Material 2.15

// ApplicationWindow {
//     visible: true
//     width: 400
//     height: 300

//     Material.theme: Material.Light
//     Material.accent: Material.Blue

//     Button {
//         text: "首页"
//         id:btn
//         focusPolicy: Qt.StrongFocus   // 可以保留键盘焦点

//         background: Rectangle {
//             radius: 4
//             color: btn.down ? "#cccccc"
//                  : btn.hovered ? "#eeeeee"
//                                     : "#ffffff"
//             // ❌ 不绘制 focus ring
//         }
//     }
// }
