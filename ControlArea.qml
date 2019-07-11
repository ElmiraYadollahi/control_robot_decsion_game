import QtQuick 2.0
import Box2D 2.0
import './shared/'


Rectangle {
    id:controlArea
    anchors.fill: parent
    property int nbRows: 2
    property int nbBeads: 10
    property real tolerence: 2
    property real recwidth: controlArea.width - 20 - controlArea.width/10
    property real recheight: controlArea.height/(nbRows)
    property variant speakingText: ["SETUP , child_instruct",
                                    "STAT , I am ready",

                                    "COLOR , yellow",
                                    "COLOR , red",
                                    "COLOR , blue",

                                    "OBJECT , ball",
                                    "OBJECT , square",
                                    "OBJECT , object",

                                    "DIREC , robot LEFT",
                                    "DIREC , robot RIGHT",

                                    "DIREC , child LEFT",
                                    "DIREC , child RIGHT ",

                                    "DIREC , the LEFT",
                                    "DIREC , the RIGHT",

                                    "ACTION , action",
                                    "NEXT , next instruction",

                                    "RANDOMIZE , randomize",
                                    "COLLECT , collect",

                                    "STAT , What color?",
                                    "STAT , How many?",
                                    "STAT , Which object?",
                                    "STAT , Which direction?",
                                    "STAT , Which right?",
                                    "STAT , Which left?",
                                    "STAT , Who's right?",
                                    "STAT , Who's left?",




                                    "LEVEL , EASY",
                                    "LEVEL , MEDIUM",
                                    "LEVEL , HARD",

                                    "EMPTY"]

    property variant movementText: ["SETUP , robot_instruct",
                                    "STAT , are you ready?",

                                    "COLOR , yellow",
                                    "COLOR , red",
                                    "COLOR , blue",


                                    "OBJECT , ball",
                                    "OBJECT , square",
                                    "OBJECT , object",

                                    "DIREC , robot LEFT",
                                    "DIREC , robot RIGHT",

                                    "DIREC , child LEFT",
                                    "DIREC , child RIGHT ",

                                    "DIREC , the LEFT",
                                    "DIREC , the RIGHT",

                                    "ACTION , action",
                                    "NEXT , next instruction",

                                    "RANDOMIZE , randomize",
                                    "COLLECT , collect",

                                    "STAT , Should I Repeat?  ",
                                    "REPEAT , Repeat  ",
                                    "STAT , Was it clear?  ",
                                    "STAT , Sure ",
                                    "CORRECT , Egocentric",
                                    "CORRECT , Addresee-Centric",
                                    "STAT , Yes",
                                    "STAT , No",

                                    //"RESP , That's exactly",
                                    //"RESP , I am not sure ",

                                    "LEVEL , EASY",
                                    "LEVEL , MEDIUM",
                                    "LEVEL , HARD",

                                    "EMPTY"]

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



    ControlRow {
        id: top_row
        box_index: 0

        color: 'transparent'

        //x: 0
        //y: 0
        width: controlArea.width - 20
        height: controlArea.height/(nbRows)-10

        nbButtons: 10
        gridRow: 15
        gridColumn: 3
        texMex: speakingText
        buttonWidth: recwidth * 1/5
        buttonHeight: recheight * 1/12
        titleHeight: recheight * 1/12

        red: 0.41
        green:0.41
        blue: 0.41
    }

    ControlRow {
        id: bottom_row
        box_index: 1
        color: 'transparent'

        //x:0
        //y: controlArea.height/(nbRows)
        width:  controlArea.width - 20
        height: controlArea.height/(nbRows) - 10

        nbButtons: 10
        gridRow: 15
        gridColumn: 3
        texMex: movementText
        buttonWidth: recwidth * 1/5
        buttonHeight: recheight * 1/12
        titleHeight: recheight * 1/12

        red: 0.18
        green:0.3
        blue: 0.3
    }


}
