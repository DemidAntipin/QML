import QtQuick 2.15
import QtQuick.Window 2.15
Item {
    id:deleg
    height: rect.height
    property string name: "?"
    property string content: "?"
    property string time: "?"
    Rectangle{
        id:rect
        border.color:"darkgray"
        radius:5
        anchors.centerIn: parent
        width: parent.width*0.8
        height: Math.max(parent.height, user.implicitHeight+message.implicitHeight+send_time.implicitHeight)
        gradient:Gradient{
            GradientStop{position:0;color:"lightgray"}
            GradientStop{position:1;color:"white"}
        }
    }
    Row{
        id:row
        anchors.left:rect.left
        anchors.right: rect.right
        height: rect.height
        anchors.margins: 4
        spacing:2
        Text{
            id: user
            text:name;
            wrapMode: Text.WrapAnywhere
            anchors.top: row.top
            anchors.topMargin: 4
            anchors.left: row.left
            font.pointSize: 8
        }
        Text{
            id: message
            text:content;
            wrapMode: Text.Wrap
            anchors.top: user.bottom
            anchors.left: row.left
            anchors.right: send_time.left
            font.pointSize: 12
        }
        Text{
            id: send_time
            text:time;
            anchors.bottom: row.bottom
            anchors.right: row.right
            font.pointSize: 8
        }
    }
}
