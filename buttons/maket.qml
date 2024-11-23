import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("MaketLayout")
    property int myMargin:10 // Устанавливаем отступы
    minimumHeight:footer.implicitHeight+body.implicitHeight+header.implicitHeight+2*myMargin // Минимальная высота окна
    minimumWidth: Math.max(footer.implicitWidth, body.implicitWidth, header.implicitWidth) // Минимальная ширина окна
    ColumnLayout{
        id: root
        anchors.fill: parent
        Layout.fillWidth: true
        spacing: myMargin
        RowLayout{
            id:header
            spacing: myMargin
            Layout.alignment: Qt.AlignTop
            Comp{
                Layout.alignment: Qt.AlignHCenter
                text: "Header"
                Layout.fillWidth: true
                mouseAreaEnabled: false
            }
        }
        GridLayout{
            id: body
            Layout.alignment: Qt.AlignVCenter
            Layout.rightMargin: myMargin
            Layout.leftMargin: myMargin
            rows: 1; columns: 1
            Comp{
                text: "Content"
                color: "transparent"
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
        RowLayout{
            id:footer
            Layout.alignment: Qt.AlignBottom
            spacing: myMargin
            Comp{
                Layout.alignment: Qt.AlignLeft
                text: "1"
                Layout.fillWidth: true
                headerStyle: "gold"
                headerText: "first header"
                contentStyle: "deepskyblue"
                contentText: "some text"
            }
            Comp{
                Layout.alignment: Qt.AlignHCenter
                text: "2"
                Layout.fillWidth: true
                headerStyle: "sienna"
                headerText: "H_E_A_D_E_R"
                contentStyle: "sandybrown"
                contentText: "Text was here"
            }
            Comp{
                Layout.alignment: Qt.AlignRight
                text: "3"
                Layout.fillWidth: true
                headerStyle: "teal"
                headerText: "Secretly hidden header"
                contentStyle: "powderblue"
                contentText: "Another text. Perhaps."
            }
        }
    }
}
