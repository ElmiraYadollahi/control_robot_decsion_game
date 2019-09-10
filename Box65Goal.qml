import QtQuick 2.0
import Box2D 2.0
import './shared/'

Rectangle {
    id:root
    property int row_nb // index of this row
    property int box_index // index of this row
    property int nbButtons // sets the number of bead per row
    property int width_empty: Math.floor(introductionBox.width * 0.4)/10 // defines the size of the empty space in a row
    property int rowCounter :0
    property int temp_width: 0
    property int mid_point: 0
    //property int row_nb
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
    property variant titles



    function colorSelection(ind, red, green, blue){
        if (box_index >0){

            if (ind === 33){
                return('#778899')
            }


            else if (ind > 0 & ind < 9){
                return('#ff7f50')
            }
            else {
                return(Qt.rgba(red - ind * 0.02, green - ind * 0.02, blue - ind * 0.02, 1))
            }
        }

        if (box_index === 3){

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

        if (box_index === 2){

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
            return(Qt.rgba(red - 0.08 - ind * 0.04, green - 0.1 - ind * 0.04, blue - 0.08 - ind * 0.04, 1))
        }

    }

    function pressColorSelection(ind, red, green, blue){
        if (ind === 220){
            return('#D79207')
        }
        else {
            return(Qt.rgba(red - 0.16 - ind * 0.05, green - 0.2 - ind * 0.05, blue - 0.16 - ind * 0.05, 1))
        }

    }

    Rectangle {
        id: borderRec
        //y:this_row.height *index + rectangleBox.height * 1/12
        x: controlArea.width *(1/30)
        y: controlArea.height *(11/20)
        width: introductionBox.width
        height: introductionBox.height  * 1.2
        border.width : 7
        border.color : "#C0C0C0"
        color: 'transparent'

        Rectangle{
            id: title
            width: borderRec.width
            height: titleHeight * 0.7
            //color: Qt.rgba(red - 1 * 0.02, green - 1 * 0.02, blue - 1 * 0.02, 1)
            color: '#C0C0C0'

            Text {
                x: title.width/2 -width/2
                y: height/10
                text: titles[box_index]
                font.family: "Helvetica"
                font.pointSize: 16
                color: 'white'
            }
        }
        Grid{
            spacing: 5
            x: titleHeight * 4/5
            y: titleHeight * 0.9
            rows: 1; columns: 1
            Repeater{
                id: row1
                model:1
                ActionButton{
                    id: row1n
                    width: buttonWidth
                    height: buttonHeight
                    color: colorSelection(index, red, green, blue)
                    hoverColor: hoverColorSelection(index, red, green, blue)
                    pressColor: pressColorSelection(index, red, green, blue)
                    buttonText: texMex [index]
                    columnNum: box_index
                    columnTitle: titles
                    title: titles[box_index]
                }
            }
        }


        Grid{
            spacing: 2
            x: titleHeight * 4/5
            y: titleHeight * 2 + 5
            rows: 3; columns: 1
            Repeater{
                id: row7
                model:3
                ActionButton{
                    id: row7n
                    width: buttonWidth
                    height: buttonHeight
                    color: colorSelection(index+1, red, green, blue)
                    hoverColor: hoverColorSelection(index+1, red, green, blue)
                    pressColor: pressColorSelection(index+1, red, green, blue)
                    buttonText: texMex [index+1]
                    columnNum: box_index
                    columnTitle: titles
                    title: titles[box_index]
                }
            }
        }

    }

}
