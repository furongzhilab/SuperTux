import QtQuick 2.0

Rectangle {
    id: button
    width: button_image.width
    height: button_image.height
    x:button_image.x
    y:button_image.y
    radius: 100
    color:"#1fa0cf"

    property alias image_button: button_image
    // this will be the default size, it is same size as the contained text + some padding
    Image {
      anchors.fill: parent
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.verticalCenter: parent.verticalCenter
      id:button_image
      width: 50
      height: 50
    }



    // this handler is called when the button is clicked.
    signal clicked


    MouseArea {
        id: mouseArea
        anchors.fill: parent
//        hoverEnabled: true
        onClicked: button.clicked()
        onPressed: button.opacity = 0.5
        onReleased: button.opacity = 1
    }
}
