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
            width: 220
            color: "#f5f5f5"
            Layout.fillHeight: true
            border.color: "#dcdcdc"

            Column {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 15

                // 👆 顶部 Logo + 应用名
                   Row {
                       width: parent.width
                       height: 60
                       spacing: 5
                       anchors.horizontalCenter: parent.horizontalCenter

                       Image {
                           source: "qrc:/res/ffmpeg_ico.png"   // 你的软件图标
                           width: 48
                           height: 48
                           fillMode: Image.PreserveAspectFit
                           anchors.verticalCenter: parent.verticalCenter
                       }

                       Text {
                           text: "FFmpeg Opus"   // 软件名
                           font.pixelSize: 20
                           font.bold: true
                           font.family: "Microsoft YaHei"
                           color: "#000000"
                           anchors.verticalCenter: parent.verticalCenter
                       }
                   }

                   Rectangle {    // 👇 分割线
                       width: parent.width
                       height: 1
                       color: "#dcdcdc"
                   }

                // 使用封装自定义按钮
                // 首页
                NavButton {
                    labelText: "首页"
                    iconSource: "qrc:/res/home.png"
                    onClicked: {
                        stackLayout.currentIndex = 0
                        console.log("点击了 首页")
                    }
                }

                // FFprobe
                NavButton {
                    labelText: "FFprobe"
                    iconSource: "qrc:/res/ffprobe.png"
                    onClicked: {
                        console.log("点击了 FFprobe")
                        stackLayout.currentIndex = 1
                    }
                }

                // ffplay
                NavButton {
                    labelText: "FFplay"
                    iconSource: "qrc:/res/ffplay.png"
                    onClicked: {
                        stackLayout.currentIndex = 2
                        console.log("点击了 FFplay")
                    }
                }

                // ffmpeg
                NavButton {
                    labelText: "FFmpeg"
                    iconSource: "qrc:/res/ffmpeg.png"
                    onClicked: {
                        stackLayout.currentIndex = 3
                        console.log("点击了 ffmpeg")
                    }
                }

                // 关于
                NavButton {
                    labelText: "关于"
                    iconSource: "qrc:/res/about.png"
                    onClicked: {
                        stackLayout.currentIndex = 4
                        console.log("点击了 关于")
                    }
                }
            }
        }

        // 右侧主界面（占位）
        StackLayout {
            id: stackLayout
            // 只在 父容器是 Layout 系列（RowLayout、ColumnLayout、GridLayout …） 时才生效。告诉外层布局（比如 RowLayout 或 ColumnLayout）：“我希望高度尽量填满父容器”。
            Layout.fillHeight: true
            Layout.fillWidth: true

            // 页面0
            Rectangle {
                color: "#ffffff"
                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                    // 将文字的中心锚点对齐Rectangle
                    anchors.centerIn: parent
                    text: "这是首页"
                    font.pixelSize: 24
                }
            }

            // 页面1
            Page1 {}

            // 页面2
            Page2 {}

            // 页面3
            Rectangle {
                color: "#ffffff"
                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                    anchors.centerIn: parent
                    text: "这是ffmpeg"
                    font.pixelSize: 24
                }
            }

            // 页面4
            Rectangle {
                color: "#ffffff"
                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                    anchors.centerIn: parent
                    text: "这是关于"
                    font.pixelSize: 24
                }
            }
        }
        // Rectangle {
        //     Layout.fillWidth: true
        //     Layout.fillHeight: true
        //     color: "#ffffff"

        //     Column {
        //         anchors.fill: parent
        //         anchors.margins: 20
        //         spacing: 20

        //         // 上半部分
        //         Rectangle {
        //             width: parent.width
        //             height: 120
        //             radius: 8
        //             color: "#f5f5f5"

        //             Text {
        //                 anchors.centerIn: parent
        //                 text: "上半部分（比如状态、标题等）"
        //                 font.pixelSize: 20
        //                 color: "#333"
        //             }
        //         }

        //         // 下半部分：可滚动的卡片列表
        //         ScrollView {
        //             width: parent.width
        //             Layout.fillHeight: true

        //             Column {
        //                 width: parent.width
        //                 spacing: 10

        //                 ProxyCard { title: "基本用法"; value: 100 }
        //                 ProxyCard { title: "日志与输出控制"; value: 101 }
        //                 ProxyCard { title: "信息展示类别"; value: 102 }
        //                 ProxyCard { title: "输出格式控制"; value: 102 }
        //                 ProxyCard { title: "选择性过滤"; value: 102 }
        //                 ProxyCard { title: "统计与分析"; value: 102 }
        //                 ProxyCard { title: "区间与采样"; value: 102 }
        //                 ProxyCard { title: "进阶格式化"; value: 102 }
        //                 ProxyCard { title: "其他选项"; value: 102 }
        //             }
        //         }
        //     }
        // }
    }
}

