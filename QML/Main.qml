import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

ApplicationWindow{
    id: mainWindow
    width: 400
    height: 500
    visible: true

    flags: Qt.FramelessWindowHint | Qt.Dialog | Qt.CustomizeWindowHint | Qt.Window

    Material.theme: Material.Dark
    Material.accent: Material.Green

    Rectangle {
        width: 180; height: 200
        ListModel {
        id: nameModel
            ListElement{
                name: "Bill"
            }
            ListElement{
                name: "John"
            }
            ListElement{
                name: "Harry"
            }
        }
        Component {
            id: contactDelegate
            Item {
                width: 180; height: 40
                Column {
                    Text { text: '<b>Name:</b> ' + name }
                }
            }
        }

        ListView {
            anchors.fill: parent
            model: nameModel
            delegate: contactDelegate
            highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
            focus: true
        }
    }
    Connections{
        target: mmain
        
        function onListSignal(fList) {
            console.log(fList);
            nameModel.append({"name": fList})            
        }
    }
}