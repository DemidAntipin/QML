import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Layout Example")

    property int myMargin: 10 // Устанавливаем отступы
    minimumHeight: footer.implicitHeight + body.implicitHeight + header.implicitHeight + 2 * myMargin // Минимальная высота окна
    minimumWidth: Math.max(footer.implicitWidth, body.implicitWidth, header.implicitWidth) // Минимальная ширина окна

    Item {
        id: root
        anchors.fill: parent
        ColumnLayout {
            id: column
            anchors.fill: parent
            Layout.fillWidth: true
            spacing: myMargin

            RowLayout {
                id: header
                spacing: myMargin
                Layout.alignment: Qt.AlignTop
                Comp{
                    id: header_elem
                    Layout.alignment: Qt.AlignHCenter
                    text: "Header"
                    Layout.fillWidth: true
                    Text{
                        id: back
                        text: "<-"
                        visible: false
                        font.pointSize: 20
                        anchors.left: header.left
                        anchors.verticalCenter: parent.verticalCenter
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                let s = root.state;
                                root.state = root.prev_state;
                                root.prev_state=s;// Убедитесь, что prev_state определен и содержит нужные данные
                            }
                        }
                    }
                }
            }

            GridLayout {
                id: body
                Layout.alignment: Qt.AlignVCenter
                Layout.rightMargin: myMargin
                Layout.leftMargin: myMargin
                rows: 1; columns: 1
                Comp{
                    id: body_elem
                    text: "Content"
                    color: "transparent"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }

            RowLayout {
                id: footer
                Layout.alignment: Qt.AlignBottom
                spacing: myMargin

                Comp{
                    Layout.alignment: Qt.AlignLeft
                    text: "1"
                    Layout.fillWidth: true
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {root.prev_state=root.state;root.state="first";}
                    }
                }
                Comp{
                    Layout.alignment: Qt.AlignHCenter
                    text: "2"
                    Layout.fillWidth: true
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {root.prev_state=root.state;root.state="second";}
                    }
                }
                Comp{
                    Layout.alignment: Qt.AlignRight
                    text: "3"
                    Layout.fillWidth: true
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {root.prev_state=root.state;root.state="third";}
                    }
                }
            }
        }
        states:[
            State {
                name: "idle"
            },
            State {
                name: "first"
                PropertyChanges {target: header_elem; color: "gold"; text: "first header"}
                PropertyChanges {target: body_elem; color: "deepskyblue"; text: "some text"}
                PropertyChanges {target: back; visible: false}
                PropertyChanges {target: footer.children[0]; opacity: 1}
                PropertyChanges {target: footer.children[1]; opacity: 0.4}
                PropertyChanges {target: footer.children[2]; opacity: 0.4}
            },
            State {
                name: "second"
                PropertyChanges {target: header_elem; color: "sienna"; text: "H_E_A_D_E_R"}
                PropertyChanges {target: body_elem; color: "sandybrown"; text: "Text was here"}
                PropertyChanges {target: back; visible: true}
                PropertyChanges {target: footer.children[0]; opacity: 0.4}
                PropertyChanges {target: footer.children[1]; opacity: 1}
                PropertyChanges {target: footer.children[2]; opacity: 0.4}
            },
            State {
                name: "third"
                PropertyChanges {target: header_elem; color: "teal"; text: "Secretly hidden header"}
                PropertyChanges {target: body_elem; color: "powderblue"; text: "Another text. Perhaps."}
                PropertyChanges {target: back; visible: true}
                PropertyChanges {target: footer.children[0]; opacity: 0.4}
                PropertyChanges {target: footer.children[1]; opacity: 0.4}
                PropertyChanges {target: footer.children[2]; opacity: 1}
            } ]
        state:"idle" // Задаём начальное состояние системы
        property string prev_state: ""
        transitions:[
            Transition{
                from: "idle"
                to: "first"

                NumberAnimation {target: footer.children[0];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[1];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[2];property: "opacity";duration: 500}
                ColorAnimation { target: header_elem; duration: 500; property: "color" }
                ColorAnimation { target: body_elem; duration: 500; property: "color" }
            },
            Transition{
                from: "idle"
                to: "second"

                NumberAnimation {target: footer.children[0];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[1];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[2];property: "opacity";duration: 500}
                ColorAnimation { target: header_elem; duration: 500; property: "color" }
                ColorAnimation { target: body_elem; duration: 500; property: "color" }
            },
            Transition{
                from: "idle"
                to: "third"

                NumberAnimation {target: footer.children[0];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[1];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[2];property: "opacity";duration: 500}
                ColorAnimation { target: header_elem; duration: 500; property: "color" }
                ColorAnimation { target: body_elem; duration: 500; property: "color" }
            },
            Transition{
                from: "first"
                to: "second"

                NumberAnimation {target: footer.children[0];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[1];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[2];property: "opacity";duration: 500}
                ColorAnimation { target: header_elem; duration: 500; property: "color" }
                ColorAnimation { target: body_elem; duration: 500; property: "color" }
            },
            Transition{
                from: "second"
                to: "first"

                NumberAnimation {target: footer.children[0];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[1];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[2];property: "opacity";duration: 500}
                ColorAnimation { target: header_elem; duration: 500; property: "color" }
                ColorAnimation { target: body_elem; duration: 500; property: "color" }
            },
            Transition{
                from: "first"
                to: "third"

                NumberAnimation {target: footer.children[0];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[1];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[2];property: "opacity";duration: 500}
                ColorAnimation { target: header_elem; duration: 500; property: "color" }
                ColorAnimation { target: body_elem; duration: 500; property: "color" }
            },
            Transition{
                from: "third"
                to: "first"

                NumberAnimation {target: footer.children[0];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[1];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[2];property: "opacity";duration: 500}
                ColorAnimation { target: header_elem; duration: 500; property: "color" }
                ColorAnimation { target: body_elem; duration: 500; property: "color" }
            },
            Transition{
                from: "second"
                to: "third"

                NumberAnimation {target: footer.children[0];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[1];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[2];property: "opacity";duration: 500}
                ColorAnimation { target: header_elem; duration: 500; property: "color" }
                ColorAnimation { target: body_elem; duration: 500; property: "color" }
            },            Transition{
                from: "third"
                to: "second"

                NumberAnimation {target: footer.children[0];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[1];property: "opacity";duration: 500}
                NumberAnimation {target: footer.children[2];property: "opacity";duration: 500}
                ColorAnimation { target: header_elem; duration: 500; property: "color" }
                ColorAnimation { target: body_elem; duration: 500; property: "color" }
            }
        ]
    }
}
