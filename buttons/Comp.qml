import QtQuick 2.0
Rectangle{
    id:rect1
    width: 100
    height: 100
    border.width: 1
    color: "gray"
    property alias text: note.text
    property alias color: rect1.color
    property bool mouseAreaEnabled: true
    property string headerStyle: "gray"
    property string headerText: "header"
    property string contentStyle: "transparent"
    property string contentText: "content"
    Text{
        id: note
        anchors.centerIn: rect1
        font.pixelSize: 24
    }
    MouseArea{
        anchors.fill: rect1
        hoverEnabled: true
        enabled: mouseAreaEnabled
        onClicked: {
            for (var i = 0; i < parent.parent.children.length; i++) {
                var item = parent.parent.children[i];
                if (item !== parent && item instanceof Comp) {
                    item.opacity = 0.4;
                }
            };
            rect1.opacity = 1;
            header.children[0].color = headerStyle;
            header.children[0].text = headerText;
            body.children[0].color = contentStyle;
            body.children[0].text = contentText;
        }
    }
}
