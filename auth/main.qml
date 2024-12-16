import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.2

Window {
    width: 360
    height: 640
    visible: true
    title: qsTr("Task_for_login_page")

    property int defMargin:10
    property string username: "Demid"
    property string password: "Demid"

    StackView{
        id:stack_view
        anchors.fill: parent
        initialItem: initpage
    }
    Page{
        id:initpage
        anchors.fill: parent
        background: Rectangle{anchors.fill: initpage; color:"lightgray"}
        Text {
            id: label
            text: ""
            font.pixelSize: 20
            anchors.bottom: auth.top
            anchors.bottomMargin: 20
            color: "red"
            anchors.horizontalCenter: parent.horizontalCenter
            Layout.alignment: Qt.AlignCenter
        }
        Item{
            id: auth
            width: 200
            height: 130
            anchors.centerIn: parent
            TextField {
                id: usernameField
                width: auth.width
                height: (auth.height-20)/3
                placeholderText: "Username"
                font.pixelSize: 20
                anchors.top: auth.top
                color: focus ? "black" : "gray"
            }
            TextField {
                id: passwordField
                placeholderText: "Password"
                width: auth.width
                height: (auth.height-20)/3
                font.pixelSize: 20
                echoMode: TextInput.Password
                anchors.verticalCenter: auth.verticalCenter
                color: focus ? "black" : "gray"
            }
            Button{
                id: confirm
                width: (auth.width-10)/2
                height: (auth.height-20)/3
                anchors.bottom: auth.bottom
                anchors.left: auth.left
                font.pixelSize: 20
                background: Rectangle{anchors.fill: parent; color:"gray"}
                text: "Log In"
                onClicked: {
                    if (usernameField.text===username && passwordField.text===password){
                        console.log("Successful authorization");
                        label.text="";
                        stack_view.push(page1);
                    }
                    else{
                        console.log("Login failed");
                        label.text="Wrong username or password";
                        cancel.clicked();
                    }
                }
            }
            Button{
                id: cancel
                width: (auth.width-10)/2
                height: (auth.height-20)/3
                anchors.bottom: auth.bottom
                anchors.right: auth.right
                font.pixelSize: 20
                background: Rectangle{anchors.fill: parent; color:"lightgray"}
                text: "Cancel"
                onClicked: {
                    console.log("Clear fields");
                    usernameField.text="";
                    passwordField.text="";
                }
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
