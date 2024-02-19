import QtQuick 2.0
import Sailfish.Silica 1.0


Page{
    id:chatPg
    backgroundColor: "#DCDCDC"
    allowedOrientations: Orientation.All

PageHeader{
z:1

id:pageOfChatHeader
height: 100
width: parent.width
Rectangle{

    anchors.fill:pageOfChatHeader
    color:  "#DCDCDC"
    Rectangle{
     width: parent.width
     height: 2
     color: "#000000"
     anchors.top: parent.bottom
    }
}

MouseArea{
    id:menuBut
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

}



//Добавление с базы данны ListElement

property alias chat: chatHistory
  ListView {
      id: openedChatView
      clip: true
      spacing: 8
      anchors.margins: 16
      height: window.height - pageOfChatHeader.height -backgrOfText.height-70
      width: window.width
      y:pageOfChatHeader.height+10
      highlightFollowsCurrentItem: true
        model:chatHistory

        delegate: Item{
            id: userMSG


            height: shouldShowTime? backgroundMSG.height +25: backgroundMSG.height
            width: backgroundMSG.width
            x: sender? 30: openedChatView.width - width-30

            property bool shouldShowTime: chatHistory.count -1 == index? true :chatHistory.get(index+1).sender !== sender

            Rectangle {
                id: backgroundMSG
                anchors.margins: 5
                height: messageText.implicitHeight +24
                width: Math.min(messageText.implicitWidth + 24, (openedChatView.width * 0.8))
                radius: 32


                color: sender? color="#ffffff" : color ="#0f2049"


                Text {
                    id: messageText
                    text: message
                    anchors.centerIn: parent
                    wrapMode: Label.Wrap
                    font.pointSize: 26
                    color: sender? color="#000000":color="#ffffff"
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: sender? Qt.AlignLeft: Qt.AlignRight

                }

                Text {
                    anchors.top: backgroundMSG.bottom; anchors.topMargin: 10
                    anchors.right: sender? undefined: parent.right
                    horizontalAlignment: sender? Qt.AlignLeft: Qt.AlignRight
                    text: time
                    width: backgroundMSG.width
                    height: 20

                    color: "#000000"
                    opacity: 0.3
                }

            }
        }



  }

  ListModel{
      id:chatHistory
     ListElement{sender: false; message: "dsfgsdfgsdfgre2"; time:"11:15"}
     ListElement{sender: true; message: "dsafeawqgew"; time: "11:20"}


  }




//footer

Rectangle{
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 60
    width: parent.width*0.9
    z:1
    anchors.horizontalCenter: parent.horizontalCenter
    height: 90
    radius: 28
    color: "#ffffff"
    clip: true

TextArea{
    id:youreTextInput
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: parent.width *0.9
    label: "..."
    visible: true
    labelVisible: false
    font.pointSize: 16
    color: "#000000"
    placeholderText: label
    wrapMode: TextArea.Wrap
    z:1
    placeholderColor: "#000000"





    }
Rectangle{
    id:backgrOfText
    anchors.right: parent.right
    anchors.rightMargin: 10
    anchors.verticalCenter: parent.verticalCenter
    width: height
    height: parent.height*0.8
    radius: width/2
    color: "#0f2049"
MouseArea{
    id: sendButt
    anchors.centerIn:parent
    width: parent.width
    height: parent.height
    onClicked: sendMSG();

    Text {
        text: pageStack.depth?"\u2332":"\u2332"
        color: "#ffffff"
        anchors.right: parent.right
        anchors.rightMargin: 14
        font.pointSize: 32


    }
}



}

}


function sendMSG(){
    if(youreTextInput.text == "")
    return;

   var isSender = Math.random() > 0.5;
    console.log("Sending mesage");
   var currentTime = new Date();
   var  hours = currentTime.getHours() < 10 ? "0" + currentTime.getHours() : currentTime.getHours();
   var  minutes = currentTime.getMinutes() < 10 ? "0" + currentTime.getMinutes() : currentTime.getMinutes();

    chat.append({
        "sender": isSender,
        "message": youreTextInput.text,
        "time": hours + ":" + minutes
                           });

}


}
