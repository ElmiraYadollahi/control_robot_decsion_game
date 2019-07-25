//Import the declarative plugins
import QtQuick 2.0

import './shared/'
import Ros 1.0

//Implementation of the Button control.
Item {
    id: button
    width: 30
    height: 30
    property alias buttonText: innerText.text;
    property variant columnTitle
    property color color: "lightgreen"
    property color hoverColor: "green"
    property color pressColor: "darkgreen"
    property int fontSize: 10
    property int borderWidth: 1
    property int borderRadius: 2
    property int columnNum
    property string title
    scale: state === "Pressed" ? 0.96 : 1.0
    onEnabledChanged: state = ""
    signal clicked


    onClicked:{
        //button_contentPublisher.text = '' + buttonText
        //console.log(title)
        if (title === "Child_Instruct_pt"){
            button_clickedPublisher.text = 'true'
            button_childTurnPublisher.text = '' + title + ' , ' + buttonText
        }
        if (title === "Robot_Instruct_pt"){
            button_clickedPublisher.text = 'true'
            button_robotTurnPublisher.text = '' + title + ' , ' + buttonText
        }
        if (title === "Extra_Behavior"){
            button_numberPublisher.text = '' + title + ' , ' + buttonText
        }
        if (buttonText === "REPEAT , Repeat" | buttonText === "CLARIFY , Clarify" | buttonText === "STOP , Pare"){
            button_repeatPublisher.text = '' + buttonText
        }
        if (buttonText === "STAT , queres que repita?" | buttonText === "STAT , queres que repita?" | buttonText === "STAT , acabaste?"){
            button_repeatPublisher.text = '' + buttonText
        }
    }

    RosStringPublisher {
        id: button_clickedPublisher
        topic: "control/button/pressedsignal"
    }

    RosStringPublisher {
        id: button_childTurnPublisher
        topic: "control/button/content"
    }

    RosStringPublisher {
        id: button_repeatPublisher
        topic: "control/button/repeat"
    }

    RosStringPublisher {
        id: button_robotTurnPublisher
        topic: "control/button/content"
    }

    RosStringPublisher {
        id: button_numberPublisher
        topic: "control/button/content"
    }

    //define a scale animation
    Behavior on scale {
        NumberAnimation {
            duration: 100
            easing.type: Easing.InOutQuad
        }
    }

    //Rectangle to draw the button
    Rectangle {
        id: rectangleButton
        anchors.fill: parent
        radius: borderRadius
        color: button.enabled ? button.color : "#808080"
        border.width: borderWidth
        border.color: "#808080"

        Text {
            id: innerText
            text: parent.description
            anchors.centerIn: parent
            font.pixelSize: parent.height * .24
            font.bold: true
            style: Text.Sunken
            color: "white"
            styleColor: "black"

        }
    }

    //change the color of the button in differen button states
    states: [
        State {
            name: "Hovering"
            PropertyChanges {
                target: rectangleButton
                color: hoverColor
            }
        },
        State {
            name: "Pressed"
            PropertyChanges {
                target: rectangleButton
                color: pressColor
            }
        }
    ]

    //define transmission for the states
    transitions: [
        Transition {
            from: ""; to: "Hovering"
            ColorAnimation { duration: 200 }
        },
        Transition {
            from: "*"; to: "Pressed"
            ColorAnimation { duration: 10 }
        }
    ]

    //Mouse area to react on click events
    MouseArea {
        hoverEnabled: true
        anchors.fill: button
        onEntered: { button.state='Hovering'}
        onExited: { button.state=''}
        onClicked: { button.clicked();}
        onPressed: { button.state="Pressed" }
        onReleased: {
            if (containsMouse)
              button.state="Hovering";
            else
              button.state="";
        }
    }
}
