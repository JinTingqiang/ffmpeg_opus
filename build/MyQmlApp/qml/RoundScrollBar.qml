// 滚动条组件
import QtQuick 2.15
import QtQuick.Controls 2.15
// Basic 样式是专为自定义设计的，完全支持修改 background 和 contentItem 属性，避免警告
import QtQuick.Controls.Basic 2.15  // 导入支持自定义的Basic样式

ScrollBar {
    id: customScrollBar

    // 确保滚动条在右侧
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.margins: 2  // 与边缘保持一点距离

    // 滚动条宽度
    width: 8

    // 滚动条颜色相关属性
    property color trackColor: "#f0f0f0"
    property color handleColor: "#c0c0c0"
    property color handleHoverColor: "#a0a0a0"

    // 轨道（滚动条背景）
    background: Rectangle {
        color: customScrollBar.trackColor
        radius: customScrollBar.width / 2

        // 这里的parent指customScrollBar本身，background的parent就是customScrollBar，就是他上面的那个
        width: parent.width
        height: parent.height
    }

    // 滑块（可拖动的部分）
    contentItem: Rectangle {
        color: customScrollBar.pressed ? customScrollBar.handleHoverColor :
               customScrollBar.hovered ? customScrollBar.handleHoverColor :
               customScrollBar.handleColor
        radius: customScrollBar.width / 2
        width: parent.width
    }

    // 启用鼠标悬停检测
    hoverEnabled: true
    // 垂直方向
    orientation: Qt.Vertical
}
