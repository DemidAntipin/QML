import QtQuick 2.15
import QtQuick.Window 2.15
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    minimumWidth: 400
    minimumHeight: 450

    Item{
        id:root
        anchors.fill: parent

        Rectangle{
            id: rect_red
            width: 100
            height: 100
            anchors.horizontalCenter: root.horizontalCenter
            anchors.bottom: root.verticalCenter
            anchors.bottomMargin: 60
            color: "red"
            radius: 50
        }
        Rectangle{
            id: rect_yellow
            width: 100
            height: 100
            anchors.centerIn: parent
            color: "yellow"
            radius: 50
        }
        Rectangle{
            id: rect_green
            width: 100
            height: 100
            anchors.horizontalCenter: root.horizontalCenter
            anchors.top: root.verticalCenter
            anchors.topMargin: 60
            color: "green"
            radius: 50
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                if (parent.state == "stop") {
                    parent.state = "caution";
                } else if (parent.state == "caution") {
                    parent.state = "go";
                } else {
                    parent.state = "stop";
                }
            }
        }
        states:[
            State {
                name: "stop"
                PropertyChanges {target: rect_red; color: "red"}
                PropertyChanges {target:rect_yellow; color: "black"}
                PropertyChanges {target:rect_green; color: "black"}
            },
            State {
                name: "caution"
                PropertyChanges {target: rect_red; color: "black"}
                PropertyChanges {target:rect_yellow; color: "yellow"}
                PropertyChanges {target:rect_green; color: "black"}
            },
            State {
                name: "go"
                PropertyChanges {target: rect_red; color: "black"}
                PropertyChanges {target:rect_yellow; color: "black"}
                PropertyChanges {target:rect_green; color: "green"}
            } ]
        state:"stop" // Задаём начальное состояние системы
        transitions:[
            Transition {
                from: "stop"
                to: "caution"
                ColorAnimation { target: rect_red; duration: 500; property: "color" }
                ColorAnimation { target: rect_yellow; duration: 500; property: "color" }
                ColorAnimation { target: rect_green; duration: 500; property: "color" }},
            Transition {
                from: "caution"
                to: "go"
                ColorAnimation { target: rect_red; duration: 500; property: "color" }
                ColorAnimation { target: rect_yellow; duration: 500; property: "color" }
                ColorAnimation { target: rect_green; duration: 500; property: "color" }},
            Transition {
                from: "go"
                to: "stop"
                ColorAnimation { target: rect_red; duration: 500; property: "color" }
                ColorAnimation { target: rect_yellow; duration: 500; property: "color" }
                ColorAnimation { target: rect_green; duration: 500; property: "color" }}
        ]
    }
}
