import QtQuick

Rectangle{
    id: eye
    width: head.width*0.12
    height: head.width*0.12
    radius: head.width*0.06
    color: "white"
    Rectangle{
        id: pupil
        width: eye.width*0.6
        height: eye.width*0.6
        radius: eye.width*0.3
        color: "black"
        anchors.centerIn: eye
        Rectangle{
            id: blick
            width: pupil.width*0.2
            height: width
            radius: eye.width*0.3
            color: "white"
            anchors.bottom: pupil.verticalCenter
            anchors.right: pupil.horizontalCenter
        }
    }
}
