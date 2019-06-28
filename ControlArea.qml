import QtQuick 2.0
import Box2D 2.0
import './shared/'


Rectangle {
    id:controlArea
    anchors.fill: parent
    property int nbColumns: 3
    property int nbBeads: 10
    property real tolerence: 2
    property variant speakingText: ["SETUP , child_trun",
                                    "STAT , I am ready",
                                    "DIREC , robot LEFT",
                                    "DIREC , robot RIGHT",
                                    "DIREC , child LEFT",
                                    "DIREC , child RIGHT ",
                                    "DIREC , the LEFT",
                                    "DIREC , the RIGHT",
                                    "NUM , 1",
                                    "NUM , 2",
                                    "NUM , 3",
                                    "NUM , 4",
                                    "OBJECT , ball",
                                    "OBJECT , square",
                                    "OBJECT , object",
                                    "COLOR , red",
                                    "COLOR , blue",
                                    "COLOR , yellow",
                                    "ACTION , action",
                                    "NEXT , next instruction",
                                    "STAT , What color?",
                                    "STAT , How many?",
                                    "STAT , Which object?",
                                    "STAT , Which direction?",
                                    "Yes",
                                    "No",
                                    "RESET , reset",
                                    "RESET , reset"]

    property variant movementText: ["SETUP , robot_trun",
                                    "STAT , are you ready?",
                                    "NUM , 1",
                                    "NUM , 2",
                                    "NUM , 3",
                                    "NUM , 4",
                                    "COLOR , red",
                                    "COLOR , blue",
                                    "COLOR , yellow",
                                    "OBJECT , ball",
                                    "OBJECT , square",
                                    "OBJECT , object",
                                    "DIREC , robot LEFT",
                                    "DIREC , robot RIGHT",
                                    "DIREC , child LEFT",
                                    "DIREC , child RIGHT ",
                                    "DIREC , the LEFT",
                                    "DIREC , the RIGHT",
                                    "STAT , Can you  ",
                                    "STAT , Can you  ",
                                    "STAT , Can you  ",
                                    "RESP , Now , what ",
                                    "RESP , That's exactly",
                                    "RESP , I am not sure ",
                                    "RESET , Let me ",
                                    "RESET , I am going "]

    property variant secondMovementText: ["LOOK AT CHILD , Is this , X , ?",
                                    "LOOK AT ABACUS , It shows , X , ",
                                    "ACTION , Now I will show , X , on the abacus",
                                    "INSTRUCTION , of course , this is ,  X , ",
                                    "RESPONSE , Is it correct?",
                                    "RESPONSE , great , I was good",
                                    "RESPONSE , oh , I was wrong!",
                                    "RESPONSE , hmm , let me try!",
                                    "RESPONSE , hmm , let me try again!",
                                    "RESPONSE , great let's move to the next question",
                                    "RESPONSE , We move one bead , from the second row , and , it counts as 10",
                                    "RESPONSE , Oh , wait , and then in the first row , we move all of the beads back to zero",
                                    "ACTION , X",
                                    "ACTION , ROW2 , X",
                                    "ADD , moving , X",
                                    "ADD , moving , X"]
    //"ACTION , ROW1 , X",
    //"RESPONSE , Is it correct?",
    //"RESPONSE , I was good",
    //"RESPONSE , I was wrong!",
    //"RESPONSE , Can you move, 3 , to your right",
    //"RESPONSE , Can you move, 3 , to my right",
    //"RESPONSE , Can you move, 3 , to the right",
    property variant numbersText:  ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9","10",
                                    "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
                                    "30", "40", "50", "60", "70", "80", "90",
                                    "100", "200", "300", "400", "500"]

    function counterLevel(rowCn){
        console.log("width", controlArea.width);
        console.log("height", controlArea.height);
        if (rowCn.row_nb === 0)
            return (rowCn.rowCounter)
        else if (rowCn.row_nb === 1)
            return (rowCn.rowCounter * 10)
        else
            return (rowCn.rowCounter * 100)
    }

    /*Rectangle {
        x: 0
        y: 0
        width: controlArea.width - 20
        height: controlArea.height * 6/8
        border.width : 10
        border.color : "grey"
        color: 'transparent'
    }

    Rectangle {
        x: 0
        y: controlArea.height * 6/8 + tolerence
        width: controlArea.width - 20
        height: controlArea.height * 2/8
        border.width : 10
        border.color : "#808080"
        color: '#808080'
    }*/


    Column{
        id:rectangleBox
        width: controlArea.width /(nbColumns)
        height: controlArea.height - 20 - controlArea.height/10
        //border.color: "lightgrey"

        ControlColumn{
            id: first_column
            column_nb: 0
            color: 'transparent'
            x: first_column.width * 0
            y: 5
            gridRow: 15
            gridColumn: 2
            width: controlArea.width /(nbColumns)
            height: controlArea.height/10 - 20
            nbButtons: 28
            texMex: speakingText
            buttonWidth: rectangleBox.width * 4/9
            buttonHeight: rectangleBox.height * 1/15
            titleHeight: rectangleBox.height * 1/14
            red: 1
            green:0
            blue: 0
            //onReset: root.restartRowsNow()
        }

        ControlColumn{
            id: second_column
            column_nb: 1
            color: 'transparent'
            //x: second_column.width * 1
            //y: 5
            gridRow: 15
            gridColumn: 2
            width: controlArea.width /(nbColumns)
            height: 0
            nbButtons: 26
            texMex: movementText
            buttonWidth: rectangleBox.width * 4/9
            buttonHeight: rectangleBox.height * 1/15
            titleHeight: rectangleBox.height * 1/14
            red: 0
            green:0.8
            blue: 0
            //onReset: root.restartRowsNow()
        }


        ControlColumn{
            id: third_column
            column_nb: 2
            color: 'transparent'
            //x: third_column.width * 2
            //y: 5
            gridRow: 13
            gridColumn: 3
            width: controlArea.width /(nbColumns)
            height: 0
            nbButtons: 33
            texMex: numbersText
            buttonWidth: rectangleBox.width * 1/4
            buttonHeight: rectangleBox.height * 1/15
            titleHeight: rectangleBox.height * 1/14
            red: 0
            green:0
            blue: 1
            //onReset: root.restartRowsNow()
        }
    }
}
