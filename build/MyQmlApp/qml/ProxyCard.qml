// 复选框组件
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    width: parent ? parent.width : 400
    radius: 8
    color: "#f9f9f9"
    border.color: "#dcdcdc"
    // 当外部没有显式设置 height 时，控件会用它的 implicitHeight 作为自身高度。
    // mainCol.implicitHeight 就是这一列里所有内容叠加的高度。
    // 所以 root 的高度会自动随着里面内容多少而变化。
    implicitHeight: mainCol.implicitHeight + 24   // 24 给上下 margin

    property string title: "代理组"
    property int value: 100
    property bool expanded: false
    // var 数组
    property var options: ["-hide_banner", "-v quiet", "-v warning"]

    // 👇 控制箭头和复选框的右对齐列
    property int rightColumn: 520

    // 定义参数说明表
    property var paramTips: ({})

    // Column → 垂直排列子元素。
    Column {
        id: mainCol
        // 填满父容器（就是那个 Rectangle root）
        anchors.fill: parent
        // 四周都留 12px 空隙。
        anchors.margins: 12
        // 子元素之间垂直间距 8px。
        spacing: 8

        // 顶部 row
        // 一个项目，可以理解为一个长条框
        Item {
            width: parent.width
            height: 40
            // 这个 Item 里面分为两个部分，一个是Row，一个是下拉按钮
            // 左边文字 + 数值
            // 这个Row分为两个部分，左边是文字，右边是下拉框数值
            Row {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10
                // 文字
                Text {
                    text: root.title
                    font.pixelSize: 16
                    color: "#333"
                    verticalAlignment: Text.AlignVCenter
                }
                // 蓝色背景矩形
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
            // 与root.expanded 绑定在一起，根据它的属性值变化判断是否需要显示Colunm的内容
            visible: root.expanded

            // 根据你提供的 model（数据） 和 delegate（模板），自动生成一组子项。“for 循环 + 模板” → 批量生成 UI。不是一个可见控件
            Repeater {
                // model: 数据源
                model: root.options
                // delegate: 模板（每一条数据要怎么显示）
                delegate: Item {
                    width: parent.width
                    height: 24

                    Row {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 8   // 文字和输入框之间的间隔
                        // 左边文字
                        Text {
                            text: modelData
                            font.pixelSize: 16
                            color: "#333"
                            verticalAlignment: Text.AlignVCenter
                        }

                        // 单行文字输入框，用户可以输入、编辑文本。
                        // 如果是带参数的项（-x / -y / -window_title）
                        TextField {
                            id: inputField
                            width: 100
                            height: 20
                            // 输入框要“贴着右边界”
                            // anchors.right: parent.right
                            //右边再留一大块间距
                            // anchors.rightMargin: parent.width - root.rightColumn
                            // anchors.verticalCenter: parent.verticalCenter
                            // 关键在这，visible，是否可见，只要带这几个选项的都不可见
                            visible: modelData.startsWith("-x") || modelData.startsWith("-y") || modelData.startsWith("-window_title")
                            font.pixelSize: 14
                            placeholderText: "输入值"
                            verticalAlignment: Text.AlignVCenter   // 垂直居中
                            topPadding: 0
                            bottomPadding: 0
                        }

                        Rectangle {
                            anchors.verticalCenter: parent.verticalCenter  // 让图标跟文字居中对齐
                            width: 16; height: 16; radius: 8
                            color: "#409EFF"
                            Text {
                                anchors.centerIn: parent
                                text: "?"
                                font.pixelSize: 12
                                color: "white"
                            }
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                ToolTip.visible: containsMouse
                                ToolTip.text: paramTips[modelData] !== undefined ? paramTips[modelData] : ""
                            }
                        }
                    }

                    // 右边小方框 (Rectangle，充当复选框外框)：对齐 rightColumn
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

                    // 逻辑用的透明 CheckBox（负责状态，真正可点击
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
