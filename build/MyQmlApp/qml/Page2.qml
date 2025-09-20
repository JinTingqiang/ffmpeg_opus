import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
// import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Fusion

Rectangle {
    color: "#ffffff"
    Layout.fillWidth: true
    Layout.fillHeight: true

    ColumnLayout {
        id: scrollView
        anchors.fill: parent
        spacing: 20

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: "lightblue"
        }

        ScrollView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: 2

            // 使用自定义滚动条
            ScrollBar.vertical: RoundScrollBar {}

            // ColumnLayout {
            //     anchors.fill: parent
            //     anchors.margins: 10
            //     spacing: 10
            Column {
                width: scrollView.width - 20     // 保证左右留边
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10

                // 如果是这样一行写多个属性，那么元素之间用分号;隔开
                ProxyCard { title: "基础播放控制"; value: options.length; options: ["-i", "-autoexit", "-loop N", "-nodisp", "-noborder", "-exitonkeydown", "-exitonmousedown"]}

                // 如果是换行写，不用分号
                ProxyCard {
                    title: "窗口与显示控制"
                    value: options.length
                    options: ["-x", "-y", "-fs", "-window_title", "-alwaysontop"]
                    paramTips: ({
                        "-x": "设置窗口的 X 坐标（水平位置）",
                        "-y": "设置窗口的 Y 坐标（垂直位置）",
                        "-fs": "全屏显示窗口",
                        "-window_title": "设置窗口标题",
                        "-alwaysontop": "窗口始终置顶"
                    })
                }

                ProxyCard {
                    title: "音视频流控制"
                    value: options.length
                    options: ["-an", "-vn", "-sn", "-ast index", "-vst index", "-sst index", "-map stream_spec", "-itsoffset sec -i input"]
                    paramTips: ({
                        "-an": "禁用音频流",
                        "-vn": "禁用视频流",
                        "-sn": "禁用字幕流",
                        "-ast index": "选择音频流",
                        "-vst index": "选择视频流",
                        "-sst index": "选择字幕流",
                        "-map stream_spec": "选择特定的流",
                        "-itsoffset sec -i input": "设置输入流的时间偏移"
                    })
                }

                ProxyCard {
                    title: "同步与解码设置"
                    value: options.length
                    options: ["-sync audio", "-sync video", "-sync ext", "-framedrop", "-fast", "-vf filter", "-af filter"]
                    paramTips: ({
                        "-sync audio": "以音频为基准进行同步（默认方式）",
                        "-sync video": "以视频为基准进行同步",
                        "-sync ext": "以外部时钟为基准进行同步",
                        "-framedrop": "解码/渲染过慢时丢帧以保持同步",
                        "-fast": "允许跳过某些安全检查，加快打开速度（可能降低兼容性）",
                        "-vf filter": "对视频流应用指定的滤镜（如缩放、旋转、裁剪等）",
                        "-af filter": "对音频流应用指定的滤镜（如音量调节、均衡、变速等）"
                    })
                }

                ProxyCard {
                    title: "音频播放设置"
                    value: options.length
                    options: ["-volume N", "-af volume=2.0", "-channels n"]
                    paramTips: ({
                        "-volume N": "设置播放音量，N 为百分比（256 = 正常音量，512 = 2倍音量）",
                        "-af volume=2.0": "通过音频滤镜调节音量，这里示例为放大 2.0 倍",
                        "-channels n": "设置音频输出的声道数，例如 1=单声道，2=立体声"
                    })
                }

                ProxyCard {
                    title: "网络流与延迟优化"
                    value: options.length
                    options: ["-rtsp_transport tcp/udp/http", "-fflags nobuffer", "-infbuf", "-rtbufsize size", "-timeout us"]
                    paramTips: ({
                        "-rtsp_transport tcp/udp/http": "设置 RTSP 传输协议（可选 tcp / udp / http），用于指定拉流方式",
                        "-fflags nobuffer": "禁用缓冲，降低延迟（适合实时播放，但可能更卡顿）",
                        "-infbuf": "启用无限缓冲，直到内存耗尽，不会因缓冲区满而阻塞",
                        "-rtbufsize size": "设置实时流缓冲区大小，例如 8M = 8 兆字节",
                        "-timeout us": "设置 I/O 操作超时时间（单位：微秒），例如 5000000 = 5 秒"
                    })
                }

                ProxyCard {
                    title: "日志与调试输出"
                    value: options.length
                    options: ["-stats", "-showmode [0/1/2]", "-benchmark", "-debug", "-loglevel level", "-hide_banner"]
                    paramTips: ({
                        "-stats": "在播放过程中周期性输出统计信息（如比特率、帧率、丢帧等）",
                        "-showmode [0/1/2]": "显示模式：0=自动，1=视频，2=波形图/频谱图",
                        "-benchmark": "播放完成后打印耗时和性能统计信息（常用于性能测试）",
                        "-debug": "输出调试信息（可用于问题排查，信息量较大）",
                        "-loglevel level": "设置日志级别，例如 quiet、error、warning、info、debug",
                        "-hide_banner": "隐藏启动时打印的版权、配置信息"
                    })
                }

                ProxyCard {
                    title: "控制快捷键参考"
                    value: options.length
                    options: ["q / ESC", "p / 空格", "f", "m", "0-9", "left/right", "down/up"]
                    paramTips: ({
                        "q / ESC": "退出播放",
                        "p / 空格": "暂停/继续播放",
                        "f": "切换全屏模式",
                        "m": "切换静音",
                        "0-9": "调整音量（0 最小，9 最大）",
                        "left/right": "快退/快进 10 秒",
                        "down/up": "快退/快进 1 分钟"
                    })
                }
            }
        }
    }
}
