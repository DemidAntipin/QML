import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQml.XmlListModel

Window {
    width: 360
    height: 640
    visible: true
    minimumHeight: page.implicitHeight+200
    minimumWidth: page.implicitWidth+200
    title: qsTr("Task_for_ListView_Model")
    property int defMargin: 8
    Page{
        id:page
        anchors.fill:parent
        footer: PageFooter {
            onNewMessage: {
                //Append new message
                var newMsg = {};
                newMsg.name = "You";
                newMsg.content = msg;
                newMsg.time = Qt.formatTime(new Date(), "hh:mm");
                my_model.append(newMsg);
            }
        }
        XmlListModel {
            id: my_model
            source: "https://stackoverflow.com/feeds"
            query: "/feed/entry"

            XmlListModelRole { name: "title"; elementName: "author/name" }
            XmlListModelRole { name: "description"; elementName: "summary" }
            XmlListModelRole { name: "time"; elementName: "published" }
        }

        Component{
            id:my_delegate
            MyDeligate{
                name: model.title
                content: model.description
                time: model.time
                width: parent.width
            }
        }
        Rectangle{
            width:page.width
            height:page.height
            gradient:Gradient{
                GradientStop{position:0;color:"gold"}
                GradientStop{position:1;color:"teal"}
            }
        }
        ListView{
            id:my_list
            anchors.fill:parent
            anchors.topMargin: 6
            model: my_model
            delegate:my_delegate
            spacing: 6
            height: my_list.contentHeight
        }
    }
}
