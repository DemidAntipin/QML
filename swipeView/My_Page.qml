import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.2

Page {
    id: root
    property alias backgroundColor: back_fon.color
    property alias text: header_page_text.text

    background: Rectangle {
        id: back_fon
        color: "white"
    }

    header: ToolBar {
        id: page_header
        height: 40
        visible: stack_view.depth > 1
        RowLayout {
            anchors.fill: parent
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: header_page_text
                font.pixelSize: 20
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }
        }
    }
    footer: ToolBar{

    }
}

