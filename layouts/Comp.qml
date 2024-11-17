import QtQuick 2.0
Rectangle{
    id:rect1
    width: 100
    height: 100
    border.width: 1
    color: "gray"
    property alias text: note.text
    property alias color: rect1.color
    Text{
        id: note
        anchors.centerIn: rect1
        font.pixelSize: 24
    }
}
