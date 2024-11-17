import QtQuick

Rectangle {
    id: obj
    width: (parent.width - 20) / 3
    height: parent.height
    color: "gray"
    property alias text: note.text
    Text{
        id: note
        font.pixelSize: 24
        anchors.centerIn: parent
    }
}
