import QtQuick

Rectangle{
    id: nose
    width: head.width*0.15
    height: width*0.65
    radius: width/2
    color: "black"
    anchors.left: head.horizontalCenter
    anchors.top: head.verticalCenter
    anchors.topMargin: width*0.1
    Rectangle{
        width: nose.width*0.25
        height: width*0.4
        radius: nose.width*0.5
        color: "white"
        anchors.bottom: parent.verticalCenter
        anchors.right: parent.horizontalCenter
    }
}
