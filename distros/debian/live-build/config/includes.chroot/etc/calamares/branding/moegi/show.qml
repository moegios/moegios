import QtQuick 2.5
import calamares.slideshow 1.0

Presentation
{
    id: presentation

    titleColor: "#202020"
    textColor: "#202020"

    Slide
    {
        Image
        {
            id: logo

            source: "moegi-os-logo.png"

            width: 320
            height: 200

            fillMode: Image.PreserveAspectFit

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 60
        }

        Text
        {
            anchors.top: logo.bottom
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter

            width: parent.width * 0.8

            text: qsTr("Installing Moegi OS")
            font.pixelSize: 32

            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
        }

        Text
        {
            anchors.top: logo.bottom
            anchors.topMargin: 90
            anchors.horizontalCenter: parent.horizontalCenter

            width: parent.width * 0.8

            text: qsTr("Please wait while Moegi OS is installed.")
            font.pixelSize: 18

            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
        }
    }
}
