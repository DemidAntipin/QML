import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12

Window {
    width: 600
    height: 600
    visible: true
    title: qsTr("Fox")
    Head{
        id: head
        Nose{
            id: nose
            Mouth{
                id: mouth
                Moustache{
                    anchors.right: mouth.left
                    anchors.bottomMargin: 0
                }
                Moustache{
                    anchors.right: mouth.left
                    anchors.bottomMargin: 6
                    rotation: 10
                }
                Moustache{
                    anchors.right: mouth.left
                    anchors.bottomMargin: -6
                    rotation: -10
                }
                Moustache{
                    anchors.left: mouth.right
                    anchors.bottomMargin: 0
                }
                Moustache{
                    anchors.left: mouth.right
                    anchors.bottomMargin: 6
                    rotation: -10
                }
                Moustache{
                    anchors.left: mouth.right
                    anchors.bottomMargin: -6
                    rotation: 10
                }
            }
        }
        Ear{
            rotation: -35
            anchors.left: head.left
        }
        Ear{
            rotation: 35
            anchors.right: head.right
        }
        Eye{
            anchors.right: head.horizontalCenter
            anchors.bottom: head.verticalCenter
            anchors.rightMargin: head.width*0.1
            anchors.bottomMargin: head.width*0.04
        }
        Eye{
            anchors.left: head.horizontalCenter
            anchors.bottom: head.verticalCenter
            anchors.leftMargin: head.width*0.1
            anchors.bottomMargin: head.width*0.04
        }
    }
}
