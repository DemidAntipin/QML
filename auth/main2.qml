import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.2

Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("Task_for_login_page")

    property int buttonWidth: 100
    property int buttonHeight: 50
    property string password: "120504"
    StackView{
        id:stack_view
        anchors.fill: parent
        initialItem: initpage
    }
    Page{
        id:initpage
        anchors.fill: parent
        background: Rectangle{anchors.fill: initpage; color:"white"}
        TextField {
            id: passwordField
            anchors.bottom: parent.top
        }
        Text {
            id: label
            text: "Enter your password:"
            font.pixelSize: 20
            anchors.bottom: passwordField1.top
            anchors.horizontalCenter: parent.horizontalCenter
            Layout.alignment: Qt.AlignCenter
        }
        Rectangle {
            id: passwordField1
            color: "white"
            width: parent.width
            height: 50
            anchors.top: parent.top
            anchors.topMargin: 140
            Layout.alignment: Qt.AlignCenter
            Row {
                spacing: 6
                anchors.centerIn: parent
                // Добавляем 6 элементов Label для отображения введенных символов
                Repeater {
                    model:6
                    Label {
                        width: 20
                        height: 20
                        font.pixelSize: 36
                        text: "*"
                        Layout.alignment: Qt.AlignCenter
                        color:index <passwordField.text.length ? "black" : "light grey"
                    }
                }
            }
        }
        GridLayout {
            id: keypad
            rows: 4
            columns: 3
            width: implicitWidth
            anchors.top: passwordField1.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            columnSpacing: 10
            rowSpacing: 10
            anchors.topMargin: 30
            Button {
                text: "1"
                Layout.preferredWidth: buttonWidth
                Layout.preferredHeight: buttonHeight
                onClicked: passwordField.text += "1"
                font.pixelSize: 20
            }
            Button {
                text: "2"
                Layout.preferredWidth: buttonWidth
                Layout.preferredHeight: buttonHeight
                onClicked: passwordField.text+= "2"
                font.pixelSize: 20
            }
            Button {
                text: "3"
                Layout.preferredWidth: buttonWidth
                Layout.preferredHeight: buttonHeight
                onClicked: passwordField.text += "3"
                font.pixelSize: 20
            }
            Button {
                text: "4"
                Layout.preferredWidth: buttonWidth
                Layout.preferredHeight: buttonHeight
                onClicked: passwordField.text+= "4"
                font.pixelSize: 20
            }
            Button {
                text: "5"
                Layout.preferredWidth: buttonWidth
                Layout.preferredHeight: buttonHeight
                onClicked: passwordField.text += "5"
                font.pixelSize: 20
            }
            Button {
                text: "6"
                Layout.preferredWidth: buttonWidth
                Layout.preferredHeight: buttonHeight
                onClicked: passwordField.text+= "6"
                font.pixelSize: 20
            }
            Button {
                text: "7"
                Layout.preferredWidth: buttonWidth
                Layout.preferredHeight: buttonHeight
                onClicked: passwordField.text += "7"
                font.pixelSize: 20
            }
            Button {
                text: "8"
                Layout.preferredWidth: buttonWidth
                Layout.preferredHeight: buttonHeight
                onClicked: passwordField.text+= "8"
                font.pixelSize: 20
            }
            Button {
                text: "9"
                Layout.preferredWidth: buttonWidth
                Layout.preferredHeight: buttonHeight
                onClicked: passwordField.text += "9"
                font.pixelSize: 20
            }
            Button {
                text: ""
                Layout.preferredWidth: buttonWidth
                Layout.preferredHeight: buttonHeight
                font.pixelSize: 20
                enabled: false
            }
            Button {
                text: "0"
                Layout.preferredWidth: buttonWidth
                Layout.preferredHeight: buttonHeight
                onClicked: passwordField.text += "0"
                font.pixelSize: 20
            }
            Button {
                id: clear
                text: "Clear"
                Layout.preferredWidth: buttonWidth
                Layout.preferredHeight: buttonHeight
                onClicked: {
                    console.log("Cleared password");
                    passwordField.text="";}
                font.pixelSize: 20
            }
        }
        Button {
            text: "Log In"
            width: buttonWidth
            height: buttonHeight
            onClicked: {
                if (passwordField.text===password){
                    console.log("Successful authorization");
                    label.text="Enter your password:";
                    label.color= "black";
                    stack_view.push(page1)
                }
                else{
                    console.log("Wrong password");
                    label.text="Wrong password";
                    label.color= "red";
                    clear.clicked();
                }}
            font.pixelSize: 20
            anchors.left: keypad.left
            anchors.top: keypad.bottom
            anchors.topMargin: 20
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
