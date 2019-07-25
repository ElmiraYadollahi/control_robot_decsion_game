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

            if (ind === 27  | ind === 16 | ind === 24 | ind === 32 ){
                return('red')
            }
            else if (ind === 26 | ind === 14){
                return('#ffa600')
            }
            else if (ind === 25 | ind === 23 | ind === 15 ){
                return('#006400')
            }

            else if (ind === 2 | ind === 3){
                return('#808000')
            }
            else if (ind >= 17 & ind <= 22){
                return('#808000')
            }
            else if (ind === 12 | ind === 13){
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
            x: titleHeight * 3/2
            y: titleHeight * 5/2 + 20
            Repeater{
                id: row6
                model:2
                ActionButton{
                    id: row6n
                    width: buttonWidth * 2/3
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

        Grid{
            spacing: 5
            x: titleHeight * 3/2
            y: titleHeight * 7/2 + 40
            rows: 4; columns: 2
            Repeater{
                id: row7
                model:8
                ActionButton{
                    id: row7n
                    width: buttonWidth * 2/3
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

        Row{
            spacing: 5
            x: titleHeight * 1/2
            y: titleHeight * 15/2 + 80
            Repeater{
                id: row8
                model:2
                ActionButton{
                    id: row8n
                    width: buttonWidth
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


        Row{
            spacing: 5
            x: titleHeight * 9/2  + buttonWidth * 2
            y: titleHeight * 3/2
            Repeater{
                id: row2
                model:3
                ActionButton{
                    id: row2n
                    width: buttonWidth * 2/3
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
                x: titleHeight * 9/2  + buttonWidth * 2
                y: titleHeight * 5/2 + 10
                rows: 3; columns: 2
                Repeater{
                    id: row4
                    model:6
                    ActionButton{
                        id: row4n
                        width: buttonWidth
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
                x: titleHeight * 9/2  + buttonWidth * 2
                y: titleHeight * 11/2 + 30
                Repeater{
                    id: row3
                    model:2
                    ActionButton{
                        id: row3n
                        width: buttonWidth
                        height: buttonHeight
                        color: colorSelection(index+23, red, green, blue)
                        hoverColor: hoverColorSelection(index+23, red, green, blue)
                        pressColor: pressColorSelection(index+23, red, green, blue)
                        buttonText: texMex [index+23]
                        columnNum: box_index
                        columnTitle: titles
                        title: titles[box_index]
                    }
                }
            }


            Row{
                spacing: 5
                x: titleHeight * 9/2  + buttonWidth * 2
                y: titleHeight * 13/2 + 40
                Repeater{
                    id: row10
                    model:3
                    ActionButton{
                        id: row10n
                        width: buttonWidth * 2/3
                        height: buttonHeight
                        color: colorSelection(index+25, red, green, blue)
                        hoverColor: hoverColorSelection(index+25, red, green, blue)
                        pressColor: pressColorSelection(index+25, red, green, blue)
                        buttonText: texMex [index+25]
                        columnNum: box_index
                        columnTitle: titles
                        title: titles[box_index]
                    }
                }
            }

            Row{
                spacing: 5
                x: titleHeight * 9/2  + buttonWidth * 2
                y: titleHeight * 15/2 + 50
                Repeater{
                    id: row12
                    model:2
                    ActionButton{
                        id: row12n
                        width: buttonWidth
                        height: buttonHeight
                        color: colorSelection(index+28, red, green, blue)
                        hoverColor: hoverColorSelection(index+28, red, green, blue)
                        pressColor: pressColorSelection(index+28, red, green, blue)
                        buttonText: texMex [index+28]
                        columnNum: box_index
                        columnTitle: titles
                        title: titles[box_index]
                    }
                }
            }

            Row{
                spacing: 5
                x: titleHeight * 9/2  + buttonWidth * 2
                y: titleHeight * 17/2 + 60
                Repeater{
                    id: row13
                    model:2
                    ActionButton{
                        id: row13n
                        width: buttonWidth
                        height: buttonHeight
                        color: colorSelection(index+30, red, green, blue)
                        hoverColor: hoverColorSelection(index+30, red, green, blue)
                        pressColor: pressColorSelection(index+30, red, green, blue)
                        buttonText: texMex [index+30]
                        columnNum: box_index
                        columnTitle: titles
                        title: titles[box_index]
                    }
                }
            }

            ActionButton{
                id: row9n
                x: titleHeight * 5/2  + buttonWidth *3/2
                y: titleHeight * 9/2 + 75
                width: buttonWidth * 1/3
                height: buttonHeight
                color: colorSelection(32, red, green, blue)
                hoverColor: hoverColorSelection(32, red, green, blue)
                pressColor: pressColorSelection(32, red, green, blue)
                buttonText: texMex [32]
                columnNum: box_index
                columnTitle: titles
                title: titles[box_index]
            }

            ActionButton{
                id: row11n
                x: titleHeight * 5/2  + buttonWidth *3/2
                y: titleHeight * 3/2 + 75
                width: buttonWidth * 2/3
                height: buttonHeight
                color: colorSelection(33, red, green, blue)
                hoverColor: hoverColorSelection(33, red, green, blue)
                pressColor: pressColorSelection(33, red, green, blue)
                buttonText: texMex [33]
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
