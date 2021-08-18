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
        height: 35
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
                verticalCenter: parent.verticalCenter
                left: parent.left
                topMargin: 5
                leftMargin: 5
            }
            text: qsTr("LOR Launcher")
        }
        
        Button {
            id: exitWindow
            width: 15
            height: 15
            anchors{
                right: parent.right
                rightMargin: 5
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
        id: logoHolder
        width: 120
        height: 120
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
    Text {
        id: loginText
        font.pointSize: 16
        color: Material.color(Material.Green)
        anchors{
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
            top: logoHolder.bottom
            topMargin: 40
        }
        text: qsTr("Login")
    }

    TextField {
        id: usernameField
        width: 300
        text: qsTr("")
        selectByMouse: true
        placeholderText: qsTr("Username")
        verticalAlignment: text.AlignVCenter
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: loginText.bottom
            topMargin: 10
        }
    }

    TextField {
        id: passwordField
        width: 300
        text: qsTr("")
        selectByMouse: true
        placeholderText: qsTr("Password")
        verticalAlignment: text.AlignVCenter
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: usernameField.bottom
            topMargin: 10
        }
        echoMode: TextInput.Password
    }

    Button {
        id:logonButton
        width: 300
        height: 50
        focus: true
        checked: false
        text: qsTr("Login")
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: passwordField.bottom
            topMargin: 20
        }
        Keys.onPressed: {
            if (event.key == Qt.Key_Return) {
                console.log("Key Enter was pressed");
                event.accepted = true;
                mlogin.onLogin(usernameField.text, passwordField.text, logonButton.checked)
            }
            if (event.key == Qt.Key_Space) {
                console.log("Key Space was pressed");  
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("Mouse click pressed");
                mlogin.onLogin(usernameField.text, passwordField.text, logonButton.checked) 
            }
        }
    }

    Rectangle {        
        id: footer
        height: 35
        color: Material.color(Material.Green)
        anchors{
            left: parent.left
            bottom: parent.bottom
            right: parent.right
        }
        Text {
            id: link
            text: '<html><style type="text/css"></style><a href="http://google.com">Can´t sign-in?</a></html>'
            font.pointSize: 10
            anchors{
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
                topMargin: 5
            }
            onLinkActivated: Qt.openUrlExternally(link)
        }
    }

    Connections{
        target: mlogin

        function changeWindow(isVisible){
            loginView.visible = isVisible
        }
    }
}