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

            if (ind === 4  | ind === 16 | ind === 13 | ind === 15 ){
                return('red')
            }
            else if ( ind === 3 | ind === 1){
                return('#ffa600')
            }
            else if (ind === 5 | ind === 6 ){
                return('#808000')
            }

            else if (ind === 0 | ind === 14){
                return('#008000')
            }
            //else if (ind === 14 | ind === 15 | ind === 16){
            //    return('#ff7f50')
            //}
            else if ( ind === 13){
                return('#00008b')
            }
            else if (ind === 29 | ind === 31){
                return('#7b68ee')
            }
            else if (ind === 28 | ind === 30){
                return('#fa8072')
            }
            else if (ind === 33){
                return('#778899')
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
        x: controlArea.width *(3/40) + 2 *introductionBox.width
        y: controlArea.height *(1/20)
        width: introductionBox.width * 3/2
        height: introductionBox.height * 17/8
        border.width : 5
        border.color : "#808080"
        color: 'transparent'

        Rectangle{
            id: title
            width: borderRec.width
            height: titleHeight * 0.7
            //color: Qt.rgba(red - 1 * 0.02, green - 1 * 0.02, blue - 1 * 0.02, 1)
            color: '#808080'

            Text {
                x: title.width/2 -width/2
                y: height/10
                text: titles[box_index]
                font.family: "Helvetica"
                font.pointSize: 16
                color: 'white'
            }
        }


        Row{
            spacing: 5
            x: titleHeight * 1/4
            y: titleHeight * 5/4
            Repeater{
                id: row6
                model:3
                ActionButton{
                    id: row6n
                    width: buttonWidth * 2/3
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

        Row{
            spacing: 5
            x: titleHeight * 1/4
            y: titleHeight * 9/4 + 15
            Repeater{
                id: row2
                model:2
                ActionButton{
                    id: row2n
                    width: buttonWidth
                    height: buttonHeight
                    color: colorSelection(index+3, red, green, blue)
                    hoverColor: hoverColorSelection(index+3, red, green, blue)
                    pressColor: pressColorSelection(index+3, red, green, blue)
                    buttonText: texMex [index+3]
                    columnNum: box_index
                    columnTitle: titles
                    title: titles[box_index]
                }
            }
        }

            Row{
                spacing: 5
                x: titleHeight * 1/4
                y: titleHeight * 13/4 + 30
                Repeater{
                    id: row3
                    model:2
                    ActionButton{
                        id: row3n
                        width: buttonWidth
                        height: buttonHeight
                        color: colorSelection(index+5, red, green, blue)
                        hoverColor: hoverColorSelection(index+5, red, green, blue)
                        pressColor: pressColorSelection(index+5, red, green, blue)
                        buttonText: texMex [index+5]
                        columnNum: box_index
                        columnTitle: titles
                        title: titles[box_index]
                    }
                }
            }


            Grid{
                spacing: 5
                x: titleHeight * 1/4
                y: titleHeight * 17/4 + 45
                rows: 3; columns: 2
                Repeater{
                    id: row4
                    model:6
                    ActionButton{
                        id: row4n
                        width: buttonWidth
                        height: buttonHeight
                        color: colorSelection(index+7, red, green, blue)
                        hoverColor: hoverColorSelection(index+7, red, green, blue)
                        pressColor: pressColorSelection(index+7, red, green, blue)
                        buttonText: texMex [index+7]
                        columnNum: box_index
                        columnTitle: titles
                        title: titles[box_index]
                    }
                }
            }


            Row{
                spacing: 5
                x: titleHeight * 1/4
                y: titleHeight * 31/4 + 50
                Repeater{
                    id: row5
                    model:3
                    ActionButton{
                        id: row5n
                        width: buttonWidth * 2/3
                        height: buttonHeight
                        color: colorSelection(index+13, red, green, blue)
                        hoverColor: hoverColorSelection(index+13, red, green, blue)
                        pressColor: pressColorSelection(index+13, red, green, blue)
                        buttonText: texMex [index+13]
                        columnNum: box_index
                        columnTitle: titles
                        title: titles[box_index]
                    }
                }
            }


    }

}
