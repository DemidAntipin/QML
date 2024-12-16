import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.2
Page{
    id:root
    property alias backgroundColor:back_fon.color
    property alias buttonNextText:batton_nav.text
    property alias buttonBackText:batton_prev.text
    property Item next: null
    property Item prev: null
    signal buttonClicked();
    background: Rectangle{
        id:back_fon
    }
    header:ToolBar{
        id:page_header
        height:40
        visible: stack_view.depth>1
        RowLayout{
            ToolButton{
                id:back_btn
                Text{
                    text: "<-"
                    font.pixelSize: 24
                    anchors.verticalCenter: parent.verticalCenter}
                onClicked: {stack_view.pop()}
            }
            Text{
                id:header_page_text
                anchors.centerIn: page_header
            }
        }
    }
    Button {
        id:batton_nav
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: defMargin // look into main.qml
        background: Rectangle {
            color: "lightgray"
            radius: 10
        }
        font.pixelSize: 16
        font.bold: true
        onClicked: {
            onButtonNextClicked()
        }
    }
    function onButtonNextClicked() {
        console.log(stack_view.depth);
        let arr=[];
        if (stack_view.find(function(item){
            return item===next
        })){
            let arr=[];
            for (let i=stack_view.depth; i>0; i--){
                let item=stack_view.get(i);
                if (item!==next) arr.unshift(item)
                else break;
            }
            arr.push(next);
            stack_view.replace(next, arr)}
        else
            stack_view.push(next)
    }
    Button {
        id:batton_prev
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.margins: defMargin // look into main.qml
        background: Rectangle {
            color: "lightgray"
            radius: 10
        }
        font.pixelSize: 16
        font.bold: true
        onClicked: {
            onButtonBackClicked()
        }
    }
    function onButtonBackClicked() {
        console.log(stack_view.depth);
        let arr=[];
        if (stack_view.find(function(item){
            return item===prev
        })){
            let arr=[];
            for (let i=stack_view.depth; i>0; i--){
                let item=stack_view.get(i);
                if (item!==next) arr.unshift(item)
                else break;
            }
            arr.push(prev);
            stack_view.replace(prev, arr)}
        else
            stack_view.push(prev)
    }
}
