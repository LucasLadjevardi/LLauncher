import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects

ApplicationWindow{
    id: loginView
    width: 400
    height: 500
    visible: true

    flags: Qt.FramelessWindowHint | Qt.Dialog | Qt.CustomizeWindowHint | Qt.Window

    Material.theme: Material.Dark
    Material.accent: Material.Green

    Rectangle {
        id: toolTip
        height: 25
        color: Material.color(Material.Green)
        anchors{
            left: parent.left
            top: parent.top
            right: parent.right
        }
        
        Text {
            id: loginPageText
            font.pointSize: 12
            anchors{
                left: parent.left
                topMargin: 5
                leftMargin: 5
            }
            text: qsTr("Login Page")
        }
        
        Button {
            id: exitWindow
            width: 15
            height: 15
            anchors{
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            background: Rectangle {
            color: "transparent"
            }
            Image {
                anchors.fill: parent
                source: "../Images/times-solid.svg"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: Qt.quit()
        }
        
        Button {
            id: maximizeWindow
            width: 15
            height: 15
            anchors{ 
                right: exitWindow.left
                verticalCenter: parent.verticalCenter
                rightMargin: 5 
            }
            background: Rectangle {
            color: "transparent"
            }
            Image {
                anchors.fill: parent
                source: "../Images/window-maximize-regular.svg"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: Qt.maximize()
        }
        
        Button {
            id: minimizeWindow
            width: 15
            height: 15
            anchors{
                right: maximizeWindow.left
                rightMargin: 5
                verticalCenter: parent.verticalCenter
            }
            background: Rectangle {
            color: "transparent"
            }
            Image {
                anchors.fill: parent
                source: "../Images/window-minimize-regular.svg"
                fillMode: Image.PreserveAspectFit
            }
            onClicked: Qt.maximize()
        }
    }

    Item {
        width: 124
        height: 124
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: toolTip.bottom
            topMargin: 40
        }
        Image {
            id: logo
            width: 124
            height: 124
            source: "../Images/battle-net-brands.svg"
        }
        ColorOverlay{
            anchors.fill: logo
            source: logo
            color: Material.color(Material.Green)
        }
    }
}