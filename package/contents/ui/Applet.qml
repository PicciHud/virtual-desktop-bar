import QtQuick 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.private.mds 2.0
import org.kde.kquickcontrolsaddons 2.0 as KQuickControlsAddonsComponents

RowLayout {
    id: root

    MDSModel {
        id: mdsModel
    }

    Plasmoid.compactRepresentation: DesktopSwitcher {}
    Plasmoid.fullRepresentation: DesktopNamePopup {}
    Plasmoid.toolTipItem: Item { width: -999; height: -999 }

    Connections {
        target: mdsModel

        onCurrentDesktopChanged: {
            plasmoid.compactRepresentationItem.onCurrentDesktopChanged(desktopNumber);
            plasmoid.fullRepresentationItem.refreshDesktopNameInput();
        }

        onDesktopAmountChanged: {
            plasmoid.compactRepresentationItem.onDesktopAmountChanged(desktopAmount);
        }

        onDesktopNamesChanged: {
            plasmoid.compactRepresentationItem.onDesktopNamesChanged();
            plasmoid.fullRepresentationItem.refreshDesktopNameInput();
        }

        onCurrentDesktopNameChangeRequested: {
            plasmoid.expanded = true;
        }
    }

    Component.onCompleted: {
        plasmoid.setAction("addNewDesktop", "Add New Virtual Desktop", "list-add");
        plasmoid.setAction("removeLastDesktop", "Remove Last Virtual Desktop", "list-remove");
        plasmoid.setAction("removeCurrentDesktop", "Remove Current Virtual Desktop", "list-remove");
        plasmoid.setAction("renameCurrentDesktop", "Rename Current Virtual Desktop", "edit-rename");
        plasmoid.setAction("openDesktopSettings", "Configure Virtual Desktops...", "configure");
        plasmoid.action("removeDesktop").enabled = Qt.binding(function() {
            return plasmoid.compactRepresentationItem.desktopAmount > 1;
        });
    }

    function action_addNewDesktop() {
        mdsModel.addNewDesktop();
    }

    function action_removeLastDesktop() {
        mdsModel.removeLastDesktop();
    }

    function action_removeCurrentDesktop() {
        mdsModel.removeCurrentDesktop();
    }

    function action_renameCurrentDesktop() {
        plasmoid.expanded = true;
    }

    function action_openDesktopSettings() {
        KQuickControlsAddonsComponents.KCMShell.open("desktop");
    }
}
