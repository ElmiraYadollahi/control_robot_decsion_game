import QtQuick 2.0
import Box2D 2.0
import './shared/'

Rectangle {
    id:root
    property int row_nb // index of this row
    property int box_index // index of this row
    property int nbButtons // sets the number of bead per row
    property int width_empty: Math.floor(top_row.width * 0.4)/10 // defines the size of the empty space in a row
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
    property variant titles: [  "Child_Instruct_pt",
                                "Robot_Instruct_pt",
                                "Extra_Behavior"]
    function colorSelection(ind, red, green, blue){
        if (box_index === 0 | box_index === 1){

            if (ind === 3 | ind === 22 | ind === 23){
                return('red')
            }
            else if (ind === 2 | ind === 21){
                return('#ffa600')
            }

            else if (ind === 4 | ind === 5 | ind === 14 | ind === 15 | ind === 16){
                return('#808000')
            }
            else if (ind === 12 | ind === 13){
                return('#00008b')
            }
            else if (ind >= 17 & ind < 20){
                return('#955196')
            }
            else if (ind === 24){
                return('#778899')
            }
            else if (ind === 20){
                return('#008000')
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
        x: 0
        y: top_row.height *box_index
        width: controlArea.width - 20
        height: controlArea.height /(nbRows) - 10
        border.width : 7
        border.color : "grey"
        color: 'transparent'

        Rectangle{
            id: title
            width: controlArea.width /(nbRows) - 10
            height: titleHeight
            //color: Qt.rgba(red - 1 * 0.02, green - 1 * 0.02, blue - 1 * 0.02, 1)
            color: 'grey'

            Text {
                x: title.width/2 -width/2
                y: height/10
                text: titles[box_index]
                font.family: "Helvetica"
                font.pointSize: 24
                color: 'white'
            }
        }

        Row{
            spacing: 5
            x: titleHeight * 1/2
            y: titleHeight * 3/2
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


        Row{
            spacing: 5
            x: titleHeight * 1/2
            y: titleHeight * 5/2 + 20
            Repeater{
                id: row2
                model:2
                ActionButton{
                    id: row2n
                    width: buttonWidth
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

            Row{
                spacing: 5
                x: titleHeight * 1/2
                y: titleHeight * 7/2 + 40
                Repeater{
                    id: row3
                    model:2
                    ActionButton{
                        id: row3n
                        width: buttonWidth
                        height: buttonHeight
                        color: colorSelection(index+4, red, green, blue)
                        hoverColor: hoverColorSelection(index+4, red, green, blue)
                        pressColor: pressColorSelection(index+4, red, green, blue)
                        buttonText: texMex [index+4]
                        columnNum: box_index
                        columnTitle: titles
                        title: titles[box_index]
                    }
                }
            }


            Grid{
                spacing: 5
                x: titleHeight * 1/2
                y: titleHeight * 9/2 + 60
                rows: 3; columns: 2
                Repeater{
                    id: row4
                    model:6
                    ActionButton{
                        id: row4n
                        width: buttonWidth
                        height: buttonHeight
                        color: colorSelection(index+6, red, green, blue)
                        hoverColor: hoverColorSelection(index+6, red, green, blue)
                        pressColor: pressColorSelection(index+6, red, green, blue)
                        buttonText: texMex [index+6]
                        columnNum: box_index
                        columnTitle: titles
                        title: titles[box_index]
                    }
                }
            }


            Row{
                spacing: 5
                x: titleHeight * 5/2  + buttonWidth * 3
                y: titleHeight * 3/2
                Repeater{
                    id: row5
                    model:2
                    ActionButton{
                        id: row5n
                        width: buttonWidth * 2/3
                        height: buttonHeight
                        color: colorSelection(index+12, red, green, blue)
                        hoverColor: hoverColorSelection(index+12, red, green, blue)
                        pressColor: pressColorSelection(index+12, red, green, blue)
                        buttonText: texMex [index+12]
                        columnNum: box_index
                        columnTitle: titles
                        title: titles[box_index]
                    }
                }
            }



            Grid{
                spacing: 5
                x: titleHeight * 5/2  + buttonWidth * 3
                y: titleHeight * 5/2 + 20
                rows: 3; columns: 1
                Repeater{
                    id: row6
                    model:3
                    ActionButton{
                        id: row6n
                        width: buttonWidth
                        height: buttonHeight
                        color: colorSelection(index+14, red, green, blue)
                        hoverColor: hoverColorSelection(index+14, red, green, blue)
                        pressColor: pressColorSelection(index+14, red, green, blue)
                        buttonText: texMex [index+14]
                        columnNum: box_index
                        columnTitle: titles
                        title: titles[box_index]
                    }
                }
            }

            Grid{
                spacing: 5
                x: titleHeight * 5/2  + buttonWidth * 3
                y: titleHeight * 11/2 + 40
                rows: 4; columns: 2
                Repeater{
                    id: row7
                    model:3
                    ActionButton{
                        id: row7n
                        width: buttonWidth * 2/3
                        height: buttonHeight
                        color: colorSelection(index+17, red, green, blue)
                        hoverColor: hoverColorSelection(index+17, red, green, blue)
                        pressColor: pressColorSelection(index+17, red, green, blue)
                        buttonText: texMex [index+17]
                        columnNum: box_index
                        columnTitle: titles
                        title: titles[box_index]
                    }
                }
            }


            Row{
                spacing: 5
                x: titleHeight * 5/2  + buttonWidth * 3
                y: titleHeight * 15/2 + 70
                Repeater{
                    id: row8
                    model:3
                    ActionButton{
                        id: row8n
                        width: buttonWidth * 1/2
                        height: buttonHeight
                        color: colorSelection(index+20, red, green, blue)
                        hoverColor: hoverColorSelection(index+20, red, green, blue)
                        pressColor: pressColorSelection(index+20, red, green, blue)
                        buttonText: texMex [index+20]
                        columnNum: box_index
                        columnTitle: titles
                        title: titles[box_index]
                    }
                }
            }

            ActionButton{
                id: row9n
                x: titleHeight * 5/2  + buttonWidth * 2
                y: titleHeight * 9/2 + 75
                width: buttonWidth * 1/3
                height: buttonHeight
                color: colorSelection(23, red, green, blue)
                hoverColor: hoverColorSelection(23, red, green, blue)
                pressColor: pressColorSelection(23, red, green, blue)
                buttonText: texMex [23]
                columnNum: box_index
                columnTitle: titles
                title: titles[box_index]
            }

            ActionButton{
                id: row10n
                x: titleHeight * 5/2  + buttonWidth * 2
                y: titleHeight * 3/2 + 75
                width: buttonWidth * 2/3
                height: buttonHeight
                color: colorSelection(24, red, green, blue)
                hoverColor: hoverColorSelection(24, red, green, blue)
                pressColor: pressColorSelection(24, red, green, blue)
                buttonText: texMex [24]
                columnNum: box_index
                columnTitle: titles
                title: titles[box_index]
            }




        /*Grid{
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
                    columnNum: box_index
                    columnTitle: titles
                    title: titles[box_index]
                }
            }
        }*/
    }

}
