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

            if (ind === 1 ){
                return('#ffa600')
            }
            else if (ind === 2 | ind === 3){
                return('#9370db')
            }

            else {
                return(Qt.rgba(red - ind * 0.02, green - ind * 0.02, blue - ind * 0.02, 1))
            }
        }



    }

    function hoverColorSelection(ind, red, green, blue){
        if (box_index >0){

            if (ind === 1 ){
                return('#b0c4de')
            }
            else if (ind === 2 | ind === 3){
                return('#ffa600')
            }

            else {
                return(Qt.rgba(red - ind * 0.02, green - ind * 0.02, blue - ind * 0.02, 1))
            }
        }

    }

    function pressColorSelection(ind, red, green, blue){
        if (box_index >0){

            if (ind === 1 ){
                return('#b0c4de')
            }
            else if (ind === 2 | ind === 3){
                return('#ffa600')
            }

            else {
                return(Qt.rgba(red - ind * 0.02, green - ind * 0.02, blue - ind * 0.02, 1))
            }
        }

    }

    Rectangle {
        id: borderRec
        //y:this_row.height *index + rectangleBox.height * 1/12
        x: controlArea.width *(1/40)
        y: controlArea.height *(1/20)
        width: introductionBox.width
        height: introductionBox.height
        border.width : 5
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
            y: titleHeight * 5/4
            rows: 3; columns: 1
            Repeater{
                id: row1
                model:2
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
            spacing: 5
            x: titleHeight * 4/5
            y: titleHeight * 13/4 + 10
            rows: 1; columns: 2
            Repeater{
                id: row6
                model:2
                ActionButton{
                    id: row6n
                    width: buttonWidth/2
                    height: buttonHeight
                    color: colorSelection(index+2, red, green, blue)
                    hoverColor: hoverColorSelection(index+2, red, green, blue)
                    pressColor: pressColorSelection(index+2, red, green, blue)
                    buttonText: texMex [index+2]
                    columnNum: box_index
                    columnTitle: titles
                    title: titles[box_index]
                }
            }
        }

    }

}
