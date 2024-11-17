import QtQuick

Rectangle{
    id: head
    width: parent.width/2
    height: parent.width/2
    anchors.centerIn: parent
    color: "orange"
    radius: parent.width/4
    border.color: "black"
    border.width: 4
    Rectangle{
        id: bottomhead
        width: head.width
        height: width/2.3
        radius: width/2
        anchors.horizontalCenter: head.horizontalCenter
        anchors.top: head.verticalCenter
        anchors.topMargin: height*0.2
        color: "transparent"
        clip: true
        Rectangle{
            width: head.width
            height: head.height
            anchors.bottom: bottomhead.bottom
            anchors.bottomMargin: 6
            anchors.horizontalCenter: bottomhead.horizontalCenter
            color: "white"
            radius: head.width/2
            border.width: 4
        }
    }
}
