import QtQuick 2.0
import Box2D 2.0
import './shared/'

Rectangle {
    id:root
    property int row_nb // index of this row
    property int nbButtons // sets the number of bead per row
    property int width_empty: Math.floor(first_column.width * 0.4)/10 // defines the size of the empty space in a row
    property int rowCounter :0
    property int temp_width: 0
    property int mid_point: 0
    property int column_nb
    property Body pressedBody: null
    property int gridRow
    property int gridColumn
    property variant texMex
    property real buttonWidth //controlArea.width * 1/12
    property real buttonHeight //controlArea.height * 4/40
    property real titleHeight
    property real red
    property real green
    property real blue
    property variant titles: [  "Child_Turn",
                                "Robot_Turn",
                                "Extra_Behavior"]

    function colorSelection(ind, red, green, blue){
        if (column_nb === 0){

            if (ind === 15){
                return('red')
            }
            else if (ind === 16){
                return('blue')
            }
            else if (ind === 17){
                return('#ffa600')
            }
            else if (ind === 18){
                return('#955196')
            }
            else if (ind === 19){
                return('#955196')
            }
            else {
                return(Qt.rgba(red - ind * 0.04, green - ind * 0.03, blue - ind * 0.04, 1))
            }
        }

        if (column_nb === 1){

            if (ind === 6){
                return('red')
            }
            else if (ind === 7){
                return('blue')
            }
            else if (ind === 8){
                return('#ffa600')
            }
            else if (ind === 220){
                return('#ffa600')
            }
            else {
                return(Qt.rgba(red - ind * 0.04, green - ind * 0.03, blue - ind * 0.04, 1))
            }
        }

        if (column_nb === 2){

            if (ind === 15){
                return('red')
            }
            else if (ind === 16){
                return('blue')
            }
            else if (ind === 17){
                return('#ffa600')
            }
            else if (ind === 220){
                return('#ffa600')
            }
            else {
                return(Qt.rgba(red - ind * 0.04, green - ind * 0.03, blue - ind * 0.04, 1))
            }
        }



    }

    function hoverColorSelection(ind, red, green, blue){
        if (ind === 220){
            return('#EEA107')
        }
        else {
            return(Qt.rgba(red - 0.08 - ind * 0.05, green - 0.1 - ind * 0.03, blue - 0.08 - ind * 0.07, 1))
        }

    }

    function pressColorSelection(ind, red, green, blue){
        if (ind === 220){
            return('#D79207')
        }
        else {
            return(Qt.rgba(red - 0.16 - ind * 0.05, green - 0.2 - ind * 0.03, blue - 0.16 - ind * 0.07, 1))
        }

    }

    Rectangle {
        id: borderRec
        //y:this_row.height *index + rectangleBox.height * 1/12
        x: first_column.width *column_nb
        y: 0
        width: controlArea.width /(nbColumns) - 10
        height: controlArea.height - 20
        border.width : 7
        border.color : "grey"
        color: 'transparent'

        Rectangle{
            id: title
            width: controlArea.width /(nbColumns) - 10
            height: titleHeight
            color: 'grey'

            Text {
                x: title.width/2 -width/2
                y: height/5
                text: titles[column_nb]
                font.family: "Helvetica"
                font.pointSize: 24
                color: 'white'
            }
        }

        Grid{
            x: buttonHeight/4; y: 10 + buttonHeight
            rows: gridRow; columns: gridColumn; spacing: 5
            Repeater{
                id: actions
                model:nbButtons
                ActionButton{
                    id: resetButton
                    //x: controlArea.width * 6/7
                    y: borderRec.height/nbButtons *index
                    width: buttonWidth
                    height: buttonHeight
                    color: colorSelection(index, red, green, blue)
                    hoverColor: hoverColorSelection(index, red, green, blue)
                    pressColor: pressColorSelection(index, red, green, blue)
                    buttonText: texMex [index]
                    columnNum: column_nb
                    columnTitle: titles
                    title: titles[column_nb]
                }
            }
        }
    }
}
