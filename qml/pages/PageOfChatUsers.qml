import QtQuick 2.0
import Sailfish.Silica 1.0


Page{
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

}//Конец PageHeader




ListModel {
      id: chatsDataModel



      ListElement {
          text: "MSG1"
      }
      ListElement {
          text: "MSG2"

      }

  }


//Добавление с базы данны ListElement


  ListView {
      id: view

      anchors.margins: 10
      height: window.height - pageOfChatHeader.height -youreTextInput.height-30
      width: window.width
      y:pageOfChatHeader.height
      spacing: 10
      model: chatsDataModel
      clip: true



      delegate: Item{
          id: delegateOfListViewChats

          property var view: ListView.view
          property var isCurrent: ListView.isCurrentItem


          x:window.width-width
          width: view.width*0.75
          height: 100
          Rectangle {
              anchors.margins: 5
              anchors.fill: parent
              radius: 16
              width: parent.width


              color: "#ffffff"
              border {
                  color: "#000000"
                  width: 1
              }

              Text {
                  anchors.centerIn: parent
                  text: model.text
              }




          }//Конец Rectangle

      }//Конец delegate: Item




  }//Конец ListView





//footer
TextArea{
    z:1
    id:youreTextInput
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 30
    anchors.alignWhenCentered: Qt.horizontalCenter
    width: parent.width
    label: "..."
    visible: true
    labelVisible: false
    font.pointSize: 16
    color: "#000000"
    placeholderText: label
    placeholderColor: "#000000"
    }


}
