import QtQuick 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import org.kde.plasma.plasmoid 2.0

RowLayout {
    id: root
    spacing: 6
    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation

    Component {
        id: desktopEntry

        Item {
            property int desktopLabelMargin: 2
            property int desktopIndicatorThickness: 2

            property string desktopName: "Desktop"
            property bool activeDesktop: false

            implicitWidth: desktopLabel.width + 2 * desktopLabelMargin
            implicitHeight: parent.height

            Label {
                id: desktopLabel
                text: desktopName
                x: desktopLabelMargin
                anchors.verticalCenter: parent.verticalCenter
                opacity: 0.75
            }

            Rectangle {
                id: desktopIndicator
                width: parent.width
                height: desktopIndicatorThickness
                anchors.bottom: parent.bottom
                color: "transparent"
            }

            state: {
                if (activeDesktop) {
                    return "active"
                }
            }

            states: [
                State {
                    name: "active"

                    PropertyChanges {
                        target: desktopLabel
                        opacity: 1
                    }

                    PropertyChanges {
                        target: desktopIndicator
                        color: theme.buttonHoverColor
                    }
                }
            ]
        }
    }

    Component.onCompleted: {
        desktopEntry.createObject(root, {"activeDesktop": true})
        desktopEntry.createObject(root, {"desktopName": "Other desktop"})
        desktopEntry.createObject(root, {"desktopName": "Another one"})
    }
}
