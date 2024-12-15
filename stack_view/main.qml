import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.2

Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("StackView_test")

    property int defMargin:10

    StackView{
        id:stack_view
        anchors.fill: parent
        initialItem: initpage
    }
    Page{
        id:initpage
        anchors.fill: parent

        Rectangle{
            id: rect_red
            width: 100
            height: 100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.verticalCenter
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
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: 60
            color: "green"
            radius: 50
        }
        Text{
                id: note
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: rect_green.bottom
                font.pixelSize: 24
                text: "Кликни, чтобы продолжить"
            }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                stack_view.replace(initpage, page1)
            }
        }
    }
    My_Page { id:page1
        backgroundColor: "red"
        buttonNextText: "To_Yellow"
        buttonBackText: "To_Green"
        next: page2
        prev: page3
    }
    My_Page { id:page2
        visible: false
        backgroundColor: "yellow"
        buttonNextText: "To_Green"
        buttonBackText: "To_Red"
        next: page3
        prev: page1
    }
    My_Page { id:page3
        visible: false
        backgroundColor: "green"
        buttonNextText: "To_Red"
        buttonBackText: "To_Yellow"
        next: page1
        prev: page2
    }
}
