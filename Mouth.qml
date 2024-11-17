import QtQuick

Rectangle {
    id: mouth
    width: nose.width/1.5
    height: width/2.3
    color: "transparent"
    anchors.top: nose.bottom
    anchors.horizontalCenter: nose.horizontalCenter
    Rectangle{
        width: nose.width*0.8
        height: width
        radius: width
        color: "white"
        anchors.left: parent.horizontalCenter
        anchors.leftMargin: -3
        anchors.top: parent.top
        anchors.topMargin: -8
        border.width: 4
        Rectangle{
            width: parent.width*0.95
            height: width
            radius: width
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: 4
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
        }
    }
    Rectangle{
        width: nose.width*0.8
        height: width
        radius: width
        color: "white"
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: -3
        anchors.top: parent.top
        anchors.topMargin: -8
        border.width: 4
        Rectangle{
            width: parent.width*0.95
            height: width
            radius: width
            color: "white"
            anchors.right: parent.right
            anchors.rightMargin: 4
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
        }
    }
}
