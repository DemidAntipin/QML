import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.2

Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("Task_swipeview")

    property int defMargin:10
    property string username: "Demid"
    property string password: "Demid"

    SwipeView {
        id: view
        currentIndex: 0
        interactive: SwipeView.ForceElasticity
        anchors.fill: parent
        My_Page { id:page1
            backgroundColor: "red"
            text: "red page"
        }
        My_Page { id:page2
            backgroundColor: "yellow"
            text: "yellow page"
        }
        My_Page { id:page3
            backgroundColor: "green"
            text: "green page"
        }
    }
    PageIndicator {
        id: indicator
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
