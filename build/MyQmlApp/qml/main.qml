// NavButton.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: root
    visible: true
    width: 800
    height: 600
    title: qsTr("FFmpeg Opus")

    RowLayout {
        anchors.fill: parent

        // 左侧菜单栏
        Rectangle {
            width: 200
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
                    implicitHeight: 40
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

                    // 👇 自定义内容
                    contentItem: Row {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        spacing: 40
                        height: parent.height   // 👈 让 Row 和按钮一样高

                        Image {
                            source: "qrc:/res/home.png"
                            width: 24
                            height: 24
                            fillMode: Image.PreserveAspectFit
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: navBtn1.text
                            font.pixelSize: 18
                            font.family: "Microsoft YaHei"
                            color: "#000000"
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    onClicked: console.log("点击了 首页")
                }

                Button {
                    id: navBtn2
                    text: "ffprobe"
                    width: parent.width
                    Layout.fillWidth: true
                    implicitHeight: 40
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

                    // 👇 自定义内容
                    contentItem: Row {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        spacing: 40
                        height: parent.height   // 👈 让 Row 和按钮一样高

                        Image {
                            source: "qrc:/res/ffprobe.png"
                            width: 24
                            height: 24
                            fillMode: Image.PreserveAspectFit
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: navBtn2.text
                            font.pixelSize: 18
                            font.family: "Microsoft YaHei"
                            color: "#000000"
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    onClicked: console.log("点击了 ffprobe")
                }

                // ffplay
                Button {
                    id: navBtn3
                    text: "ffplay"
                    width: parent.width
                    Layout.fillWidth: true
                    implicitHeight: 40
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

                    // 👇 自定义内容：图标 + 文字
                    contentItem: Row {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        spacing: 40
                        height: parent.height   // 👈 让 Row 和按钮一样高

                        Image {
                            source: "qrc:/res/ffplay.png"
                            width: 24
                            height: 24
                            fillMode: Image.PreserveAspectFit
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: navBtn3.text
                            font.pixelSize: 18
                            font.family: "Microsoft YaHei"
                            color: "#000000"
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    onClicked: console.log("点击了 首页")
                }

                // ffmpeg
                Button {
                    id: navBtn4
                    text: "ffmpeg"
                    width: parent.width
                    Layout.fillWidth: true
                    implicitHeight: 40
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

                    // 👇 自定义内容：图标 + 文字
                    contentItem: Row {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        spacing: 40
                        height: parent.height   // 👈 让 Row 和按钮一样高

                        Image {
                            source: "qrc:/res/ffmpeg.png"
                            width: 24
                            height: 24
                            fillMode: Image.PreserveAspectFit
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: navBtn4.text
                            font.pixelSize: 18
                            font.family: "Microsoft YaHei"
                            color: "#000000"
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    onClicked: console.log("点击了 首页")
                }

                // 关于
                Button {
                    id: navBtn5
                    text: "关于"
                    width: parent.width
                    Layout.fillWidth: true
                    implicitHeight: 40
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

                    // 👇 自定义内容：图标 + 文字
                    contentItem: Row {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        spacing: 40
                        height: parent.height   // 👈 让 Row 和按钮一样高

                        Image {
                            source: "qrc:/res/about.png"
                            width: 24
                            height: 24
                            fillMode: Image.PreserveAspectFit
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: navBtn5.text
                            font.pixelSize: 18
                            font.family: "Microsoft YaHei"
                            color: "#000000"
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                        }
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
