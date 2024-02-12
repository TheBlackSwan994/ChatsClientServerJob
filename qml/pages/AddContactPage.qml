import QtQuick 2.0
import Sailfish.Silica 1.0


Page{
    objectName: "AddChatPg"
    backgroundColor: "#DCDCDC"
    allowedOrientations: Orientation.All
    PageHeader{
        MouseArea{
        anchors.left: parent.left
        width: 120
        height:parent.height
        Text {
            anchors.centerIn: parent
            font.pointSize: 35
            color: "#000000"
            text:pageStack.depth? "\u2190":"\u2190"
        }
        onClicked: pageStack.pop()

        }


        Label{
            id:headerLabel
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text:"Создать переписку"
            font.pointSize: 12
            color: "#000000"

        }
        MouseArea{
        id: addChatButton
        anchors.right: parent.right
        width: 120
        height:parent.height

        Text {
            anchors.centerIn: parent
            font.pointSize: 20
            color: "#000000"
            text:"Лупа"
             }

        onClicked: {findContactField.visible = true; createGroupBut.visible=false; changeStateOfFindField.visible=true}

        }



    }//Конец PageHeader

    TextField{
    id:findContactField
    width: window.width
    y:addChatButton.height
    color: "#000000"
    visible: false
    }

    Button{
    id: createGroupBut
    anchors.horizontalCenter:parent.horizontalCenter
    width: window.width/2
    backgroundColor: "#d6d2d2"
    Text {
        anchors.centerIn: parent
        font.pointSize: 20
        color: "#000000"
        text:"Создать Группу"
         }
    Text {
        text:pageStack.depth? "\u203a":"\u203a"
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 42
        anchors.rightMargin: 20
    }
    y:addChatButton.height
    visible: true

}


    MouseArea{id:changeStateOfFindField
    y:addChatButton.height*2
    width: parent.width
    height: parent.height-addChatButton.height*2
    visible: false
    onClicked: {findContactField.visible = false; createGroupBut.visible=true; changeStateOfFindField.visible=false}

    }
//Место под ListView с контактами / чатами



}
