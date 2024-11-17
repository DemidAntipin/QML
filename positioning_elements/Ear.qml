import QtQuick 2.15

Rectangle {
    id: ear
    clip: true
    width: parent.width * 0.3
    height: parent.width / 2
    color: "transparent"
    anchors.bottom: head.verticalCenter
    anchors.bottomMargin: head.width / 6

    property alias rotation: ear.rotation
    property color innerColor: "white"

    Rectangle {
        width: parent.width * 0.5
        height: parent.width * 0.5
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: parent.height * 0.25 / 2
        anchors.horizontalCenter: parent.horizontalCenter
        color: "orange"
        rotation: 45
    }

    Rectangle {
        width: parent.width
        height: parent.height * 0.85
        color: "orange"
        anchors.horizontalCenter: ear.horizontalCenter
        anchors.bottom: ear.bottom
        radius: width / 2
    }

    Rectangle {
        width: parent.width * 0.35
        height: parent.width * 0.35
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: parent.height * 0.25 / 2
        anchors.horizontalCenter: parent.horizontalCenter
        color: innerColor
        rotation: 45
    }

    Rectangle {
        width: parent.width * 0.7
        height: parent.height * 0.75
        anchors.bottomMargin: parent.height * 0.05
        color: innerColor
        anchors.horizontalCenter: ear.horizontalCenter
        anchors.bottom: ear.bottom
        radius: width / 2
    }
}
