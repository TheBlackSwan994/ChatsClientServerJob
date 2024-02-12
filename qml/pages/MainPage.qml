import QtQuick 2.0
import Sailfish.Silica 1.0


Page{
    id: chatsPgId
    objectName: "ChatsPage_mainPg.qml"
    backgroundColor: "#DCDCDC"
    allowedOrientations: Orientation.All


    MouseArea{
        x:+chatsDrawer.width
       width: window.width-chatsDrawer.width
       height: window.height

    onClicked: {
            chatsDrawer.y=window.height;
            menuBut.visible=true;
            headerLabel.visible=true;
            chatsPgId.backgroundColor="#DCDCDC";
            addChatButton.enabled=true;

        }
}

    PageHeader{

        z:1
        id:chatsHeader
    height: 100
    width: parent.width
    Rectangle{
     anchors.fill: chatsHeader
     color: "#DCDCDC"
       Rectangle{
        width: parent.width
        height: 2
        color: "#000000"
        anchors.top: parent.bottom
       }
    }

    Rectangle{
        id:chatsDrawer
        height: window.height
        width: window.width *0.66
        color: "#ffffff"
        y: window.height*1.2

        Column{
        anchors.fill: parent

        spacing: 10

        Item{
      //spacer
            height: 30
            width: parent.width
        }

        Item {
        width: parent.width
        height: 120
        anchors.horizontalCenter: parent.horizontalCenter
        IconButton{
        icon.source:Qt.resolvedUrl("unknown.png")

        anchors.left: parent.left
        anchors.leftMargin: 20
        }


        Label{
            anchors.horizontalCenter: parent.horizontalCenter
        color: "#000000"
        font.pointSize: 20
        text: qsTr("Undefined")
        }

        }


        Button{
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            anchors.centerIn: parent
            font.pointSize: 24
            text: qsTr("Контакты")
        }
        Text{
            anchors.left: parent.left
            anchors.leftMargin: 10
            text: "Изображение контактов"
            font.pointSize: 10
        }

        }

        Button{
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            anchors.centerIn: parent
            font.pointSize: 24
            text: qsTr("Настройи")
        }
        Text{
            anchors.left: parent.left
            anchors.leftMargin: 10
            font.pointSize: 10
            text: "Изображение настроек"
        }
        }

        Item{
        //Поменять на свитч для тёмной темы
            height: 120
            width: parent.width
        }

        Button{
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            anchors.centerIn: parent
            font.pointSize: 24
            text: qsTr("Выйти")
        }
        onClicked: pageStack.pop()

        }
        Image {
            source:Qt.resolvedUrl("unknown.png")

        }

        }//Конец Column
    }//Конец Rectangle (Drawer)


    MouseArea{
        id:menuBut
    anchors.left: parent.left
    width: 120
    height:parent.height
    enabled: false
    Text {
        anchors.centerIn: parent
        font.pointSize: 35
        color: "#000000"
        text:pageStack.depth? "\u2630":"\u2630"
         }
    onClicked: {
        transform: Translate: chatsDrawer.y=window.height*0;
    menuBut.visible=false;
    headerLabel.visible=false;
    chatsPgId.backgroundColor="#c9c7c7";
        addChatButton.enabled=false;

    }
    }


    Label{
        id:headerLabel
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text:"Чаты"
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
        font.pointSize: 32
        color: "#000000"
        text:"+"
         }
    onClicked: pageStack.push(Qt.resolvedUrl("AddContactPage.qml"))

    }



    }//Конец хэдера


    ListModel {
          id: chatsDataModel



          ListElement {
              text: "User1"
          }
          ListElement {
              text: "User2"

          }


      }


    //Добавление с базы данны ListElement


      ListView {
          id: view

          anchors.margins: 10
          height: window.height - chatsHeader.height
          width: window.width
          y:chatsHeader.height
          spacing: 10
          model: chatsDataModel
          clip: true

          highlight: Rectangle {
              color: "skyblue"
          }
          highlightFollowsCurrentItem: true

          delegate: Item{
              id: delegateOfListViewChats

              property var view: ListView.view
              property var isCurrent: ListView.isCurrentItem

              width: view.width
              height: 100
              Rectangle {
                  anchors.margins: 5
                  anchors.fill: parent
                  width: parent.width


                  color: "#ffffff"
                  border {
                      color: "#000000"
                      width: 1
                  }

                  Text {
                      anchors.centerIn: parent
                      text: "%1%2".arg(model.text).arg(isCurrent ? " *" : "")
                  }

                  MouseArea {
                      anchors.fill: parent
                      onClicked:{ view.currentIndex = model.index
                      pageStack.push(Qt.resolvedUrl("PageOfChatUsers.qml"))

                      }



                  }//Конец MouseArea
              }//Конец Rectangle

          }//Конец delegate: Item




      }//Конец ListView


}

