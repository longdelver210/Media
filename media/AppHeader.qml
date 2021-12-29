import QtQuick 2.0

Item {
    property alias playlistButtonStatus: playlist_button.status
    signal clickPlaylistButton
    Image {
        id: headerItem
        source: "qrc:/Image/title.png"
        SwitchButton {
            id: playlist_button
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            icon_off: "qrc:/Image/drawer.png"
            icon_on: "qrc:/Image/back.png"
            onClicked: {
                if(status == 0){
                    status = 1;

                }else{
                    status = 0;
                }
                clickPlaylistButton();
            }
        }
        Text {
            anchors.left: playlist_button.right
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            text: qsTr("playlist") + translator.up
            color: "white"
            font.pixelSize: 32
        }
        Text {
            id: headerTitleText
            text: qsTr("MediaPlayer") + translator.up
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 46
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    Qt.quit()
                }
            }
        }
        Image {
            id: vn_flag
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            width: 50
            height: 50
            source: "qrc:/Image/vn.png"
            Rectangle{
                id: c1
                width: 50
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                border.color: "gray"
                border.width: 3
                color: "transparent"
                visible: true
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    translator.selectLanguage("vn")
                    c1.visible = true
                    c2.visible = false
                }
            }
        }
        Image {
            id: us_flag
            anchors.right: vn_flag.left
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            width: 50
            height: 50
            source: "qrc:/Image/us.png"
            Rectangle{
                id: c2
                width: 50
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                border.color: "gray"
                border.width: 3
                color: "transparent"
                visible: false
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    translator.selectLanguage("us")
                    c1.visible = false
                    c2.visible = true
                }
            }
        }
    }
}
