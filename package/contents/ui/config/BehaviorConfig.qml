import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Item {
    id: behaviorConfig

    property alias cfg_keepOneEmptyDesktop: keepOneEmptyDesktop.checked
    property alias cfg_dropRedundantDesktops: dropRedundantDesktops.checked
    property alias cfg_switchToNewDesktop: switchToNewDesktop.checked
    property alias cfg_renameNewDesktop: renameNewDesktop.checked
    property alias cfg_switchWithWheel: switchWithWheel.checked
    property alias cfg_invertWheelSwitch: invertWheelSwitch.checked
    property alias cfg_wheelSwitchWrap: wheelSwitchWrap.checked

    GridLayout {
        columns: 1

        Item {
            height: 8
        }

        Label {
            text: "GNOME-like"
            font.pixelSize: theme.defaultFont.pixelSize + 4
            Layout.columnSpan: 1
        }

        Item {
            height: 1
        }

        CheckBox {
            id: keepOneEmptyDesktop
            text: "Always keep at least one empty desktop"
            Layout.columnSpan: 1
        }

        CheckBox {
            id: dropRedundantDesktops
            enabled: keepOneEmptyDesktop.checked
            text: "Automatically remove redundant empty desktops"
            Layout.columnSpan: 1
        }

        Item {
            height: 8
        }

        Label {
            text: "Adding new desktops"
            font.pixelSize: theme.defaultFont.pixelSize + 4
            Layout.columnSpan: 1
        }

        Item {
            height: 1
        }

        CheckBox {
            id: switchToNewDesktop
            text: "Automatically switch to a manually added desktop"
            Layout.columnSpan: 1
        }

        CheckBox {
            id: renameNewDesktop
            text: "Immediately prompt to rename a manually added desktop"
            enabled: switchToNewDesktop.checked
            Layout.columnSpan: 1
        }

        Item {
            height: 8
        }

        Label {
            text: "Mouse wheel handling"
            font.pixelSize: theme.defaultFont.pixelSize + 4
            Layout.columnSpan: 1
        }

        Item {
            height: 1
        }

        CheckBox {
            id: switchWithWheel
            text: "Switch desktops with a mouse wheel"
            Layout.columnSpan: 1
        }

        CheckBox {
            id: invertWheelSwitch
            text: "Invert mouse wheel desktop switching direction"
            enabled: switchWithWheel.checked
            Layout.columnSpan: 1
        }

        CheckBox {
            id: wheelSwitchWrap
            text: "Wrap desktop navigation after reaching first or last one"
            enabled: switchWithWheel.checked
            Layout.columnSpan: 1
        }
    }
}
