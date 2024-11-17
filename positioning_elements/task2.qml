import QtQuick
import QtQuick.Window

Window {
    width: 480
    height: 1024
    visible: true
    minimumHeight: header.height + footer.height + 100
    minimumWidth: 200
    title: qsTr("Maket")
    Item{
        id: root
        anchors.fill: parent
        Item{
            id: header
            anchors.top: root.top
            anchors.left: root.left
            anchors.right: root.right
            width: root.width
            height: 100
            Head_obj{}
        }
        Item{
            id: body
            anchors.top: header.bottom
            anchors.left: root.left
            anchors.right: root.right
            anchors.bottom: footer.top
            anchors.margins: 5
            Body_obj{}
        }
        Item {
            id: footer
            anchors.bottom: root.bottom
            anchors.left: root.left
            anchors.right: root.right
            width: root.width
            height: 100
            Footer_obj{
                text: "1"
                anchors.left: footer.left
            }
            Footer_obj{
                text: "2"
                anchors.horizontalCenter: footer.horizontalCenter
            }

            Footer_obj{
                text: "3"
                anchors.right: footer.right
            }
        }
    }
}
