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
    property variant speakingText: ["SETUP , crianca_instrucao",
                                    "STAT , Estou pronto",

                                    "COLOR , amarelo",
                                    "COLOR , vermelho",
                                    //"COLOR , azul",

                                    "OBJECT , circulo",
                                    "OBJECT , quadrado",
                                    //"OBJECT , objecto",

                                    "DIREC , a minha ESQUERDA",
                                    "DIREC , a minha DIREITA",

                                    "DIREC , a tua ESQUERDA",
                                    "DIREC , a tua DIREITA",

                                    "DIREC , a ESQUERDA",
                                    "DIREC , a DIREITA",

                                    //"ACTION , accao",
                                    //"NEXT , proxima instrucao",

                                    "RANDOMIZE , Aleatorizar",
                                    "COLLECT , recolher",

                                    "STAT , Acho que atingi o objectivo",
                                    "STAT , Não consigo advinhar",
                                    "STAT , Agora é a minha vez ",

                                    "STAT , Que cor?",
                                    //"STAT , Quantos?",
                                    "STAT , Que objecto?",
                                    "STAT , Em que direccao?",
                                    //"STAT , Which right?",
                                    //"STAT , Which left?",
                                    //"STAT , Who's right?",
                                    //"STAT , Who's left?",




                                    "LEVEL , FACIL",
                                    "LEVEL , MEDIO",
                                    "LEVEL , DIFICIL",

                                    "VAZIO , ",
                                    "INTRODUCTION , "]

    property variant movementText: ["SETUP , robot_instrucao",
                                    "STAT , estás pronto?",

                                    //"COLOR , yellow",
                                    //"COLOR , red",
                                    //"COLOR , blue",


                                    //"OBJECT , circle",
                                    //"OBJECT , square",
                                    //"OBJECT , object",

                                    //"DIREC , robot LEFT",
                                    //"DIREC , robot RIGHT",

                                    //"DIREC , child LEFT",
                                    //"DIREC , child RIGHT ",

                                    //"DIREC , the LEFT",
                                    //"DIREC , the RIGHT",


                                    "GOAL , E1",
                                    "GOAL , E2",

                                    "GOAL , M1",
                                    "GOAL , M2",
                                    "GOAL , M3",
                                    "GOAL , M4",
                                    "GOAL , M5",
                                    "GOAL , M6",
                                    "GOAL , M7",
                                    "GOAL , M8",

                                    "RANDOMIZE , Aleatorizar",
                                    "COLLECT , recolher",

                                    "REPEAT , Repeat",
                                    "CLARIFY , Clarify",
                                    "STOP , Pare",



                                    "STAT , queres que repita?",
                                    "STAT , queres que repita?",
                                    "STAT , acabaste?",
                                    "STAT , claro que sim!",
                                    "STAT , Sim",
                                    "STAT , Não",

                                    "RESULT , Correct",
                                    "RESULT , Wrong",



                                    //"RESP , That's exactly",
                                    //"RESP , I am not sure ",

                                    "LEVEL , FACIL",
                                    "LEVEL , MEDIO",
                                    "LEVEL , DIFICIL",
                                    "STAT , acho que ganhei",
                                    "STAT , acho que perdi",

                                    "EMOTION , Happy",
                                    "EMOTION , Sad",


                                    "VAZIO , ",
                                    "GOODBYE , "

                                    ]


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

    property variant introductionText:  [   "SETUP , crianca_instrucao",
                                            "INTRODUCTION , Ola",

                                            "RANDOMIZE , ",
                                            "COLLECT , "]

    property variant practiceText:  [
        "LEVEL , FACIL",
        "GOAL , E1",
        "GOAL , E2",
        ]

    property variant instructionText:  [

        "LEVEL , FACIL",
        "LEVEL , MEDIO",
        "STAT , Estou pronto",

        "COLOR , amarelo",
        "COLOR , vermelho",

        "OBJECT , circulo",
        "OBJECT , quadrado",

        "DIREC , a minha ESQUERDA",
        "DIREC , a minha DIREITA",

        "DIREC , a tua ESQUERDA",
        "DIREC , a tua DIREITA",

        "DIREC , a ESQUERDA",
        "DIREC , a DIREITA",

        "VAZIO , ",
        "RESULT , Boa",
        "RESULT , Mas"


        ]

    property variant dialogueText:  [
        "STAT , Que cor?",
        //"STAT , Quantos?",
        "STAT , Que objecto?",
        "STAT , Em que direccao?",
        "RESULT , YES"
        ]

    property variant feedbackText:  [
        "STAT , Acho que atingi o objectivo",
        "STAT , Não consigo advinhar",
        "STAT , Agora é a minha vez ",
        ]

    property variant conditionText:  [
        //"GOAL , E1",
        //"GOAL , E2",
        "SETUP , robot_instrucao",
        "CONDITION , Ambiguous",
        "CONDITION , Egocentric",
        "CONDITION , Addressee-centric"

        //"GOAL , M7",
        //"GOAL , M8"
        ]

    property variant goalText:  [
        //"GOAL , E1",
        //"GOAL , E2",
        "GOAL , M1",
        "GOAL , M2",
        "GOAL , M3",
        "GOAL , M4",
        "GOAL , M5",
        "GOAL , M6"
        //"GOAL , M7",
        //"GOAL , M8"
        ]

    property variant interferenceText: [
        "REPEAT , Repeat",
        "CLARIFY , Clarify",
        "STOP , Pare",
        "RANDOMIZE , ",
        "COLLECT , ",
    ]

    property variant dialogue2Text: [
        "STAT , queres que repita?",
        "STAT , acabaste?",
        "STAT , claro que sim!",
        "STAT , Sim",
        "STAT , Não",
        "STAT , Você está perto"
    ]

    property variant feedback2Text: [
        "RESULT , Correct",
        "RESULT , Wrong",
    ]

    property variant gameFeedbackText: [
        "STAT , acho que ganhei",
        "STAT , acho que perdi",

        //"EMOTION , Happy",
        //"EMOTION , Sad",
    ]

    property variant goodbyeText: [
        "GOODBYE , ",
    ]


    property variant title: [  "Child_Instruct_pt",
                                "Robot_Instruct_pt",
                                "Introduction",
                                "Practice",
                                "Instruction",
                                "Dialogue",
                                "Feedback",
                                "Goal",
                                "Interference",
                                "Dialogue2",
                                "Feedback2",
                                "GameFeedback",
                                "Goodbye",
                                "Condition"]

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


    MainBox1{
        id: mainBox1
        box_index: 0

        color: 'transparent'

        //x: 0
        //y: 0
        //width: controlArea.width/4 - 20
        //height: controlArea.height/3 - 10

        nbButtons: 10
        gridRow: 15
        gridColumn: 3
        texMex: speakingText
        buttonWidth: recwidth * 1/5
        buttonHeight: recheight * 1/12
        titleHeight: recheight * 1/12
        titles: title

    }

    MainBox2{
        id: mainBox2
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

        titles: title

    }



    Box1Introduction{
        id: introductionBox
        box_index: 2

        color: 'transparent'

        //x: 0
        //y: 0
        width: controlArea.width/4
        height: controlArea.height/5

        nbButtons: 10
        gridRow: 15
        gridColumn: 3
        texMex: introductionText
        buttonWidth: recwidth * 1/5
        buttonHeight: recheight * 1/12
        titleHeight: recheight * 1/12
        titles: title

        red: 0.41
        green:0.41
        blue: 0.41

    }

    Box2Practice{
        id: practiceBox
        box_index: 3

        color: 'transparent'

        //x: 0
        //y: 0
        width: controlArea.width/4
        height: controlArea.height/5

        nbButtons: 10
        gridRow: 15
        gridColumn: 3
        texMex: practiceText
        buttonWidth: recwidth * 1/5
        buttonHeight: recheight * 1/12
        titleHeight: recheight * 1/12
        titles: title

        red: 0.41
        green:0.41
        blue: 0.41

    }

    Box3Instruction{
        id: instructionBox
        box_index: 4

        color: 'transparent'

        //x: 0
        //y: 0
        width: controlArea.width/4
        height: controlArea.height/5

        nbButtons: 15
        gridRow: 15
        gridColumn: 3
        texMex: instructionText
        buttonWidth: recwidth * 1/5
        buttonHeight: recheight * 1/12
        titleHeight: recheight * 1/12
        titles: title

        red: 0.41
        green:0.41
        blue: 0.41
    }

    Box4Dialogue{
        id: dialogueBox
        box_index: 5

        color: 'transparent'

        //x: 0
        //y: 0
        width: controlArea.width/4
        height: controlArea.height/5

        nbButtons: 10
        gridRow: 15
        gridColumn: 3
        texMex: dialogueText
        buttonWidth: recwidth * 1/5
        buttonHeight: recheight * 1/12
        titleHeight: recheight * 1/12
        titles: title

        red: 0.41
        green:0.41
        blue: 0.41

    }

    Box5Feedback{
        id: feedbackBox
        box_index: 6

        color: 'transparent'

        //x: 0
        //y: 0
        width: controlArea.width/4
        height: controlArea.height/5

        nbButtons: 10
        gridRow: 15
        gridColumn: 3
        texMex: feedbackText
        buttonWidth: recwidth * 1/5
        buttonHeight: recheight * 1/12
        titleHeight: recheight * 1/12
        titles: title

        red: 0.41
        green:0.41
        blue: 0.41

    }

    Box65Goal{
        id: conditionBox
        box_index: 13
        color: 'transparent'

        //x: 0
        //y: 0
        width: controlArea.width/4
        height: controlArea.height/5

        nbButtons: 10
        gridRow: 15
        gridColumn: 3
        texMex: conditionText
        buttonWidth: recwidth * 1/5
        buttonHeight: recheight * 1/12
        titleHeight: recheight * 1/12
        titles: title

        red: 0.41
        green:0.41
        blue: 0.41

    }

    Box6Goal{
        id: goalBox
        box_index: 7

        color: 'transparent'

        //x: 0
        //y: 0
        width: controlArea.width/4
        height: controlArea.height/5

        nbButtons: 10
        gridRow: 15
        gridColumn: 3
        texMex: goalText
        buttonWidth: recwidth * 1/5
        buttonHeight: recheight * 1/12
        titleHeight: recheight * 1/12
        titles: title

        red: 0.41
        green:0.41
        blue: 0.41

    }

    Box7Interference{
        id: interferenceBox
        box_index: 8

        color: 'transparent'

        //x: 0
        //y: 0
        width: controlArea.width/4
        height: controlArea.height/5

        nbButtons: 10
        gridRow: 15
        gridColumn: 3
        texMex: interferenceText
        buttonWidth: recwidth * 1/5
        buttonHeight: recheight * 1/12
        titleHeight: recheight * 1/12
        titles: title

        red: 0.41
        green:0.41
        blue: 0.41

    }

    Box8Dialogue{
        id: dialogueBox2
        box_index: 9

        color: 'transparent'

        //x: 0
        //y: 0
        width: controlArea.width/4
        height: controlArea.height/5

        nbButtons: 10
        gridRow: 15
        gridColumn: 3
        texMex: dialogue2Text
        buttonWidth: recwidth * 1/5
        buttonHeight: recheight * 1/12
        titleHeight: recheight * 1/12
        titles: title

        red: 0.41
        green:0.41
        blue: 0.41

    }

    Box9Feedback{
        id: feedbackBox2
        box_index: 10

        color: 'transparent'

        //x: 0
        //y: 0
        width: controlArea.width/4
        height: controlArea.height/5

        nbButtons: 10
        gridRow: 15
        gridColumn: 3
        texMex: feedback2Text
        buttonWidth: recwidth * 1/5
        buttonHeight: recheight * 1/12
        titleHeight: recheight * 1/12
        titles: title

        red: 0.41
        green:0.41
        blue: 0.41

    }

    Box10GameFeedback{
        id: gameFeedbackBox
        box_index: 11

        color: 'transparent'

        //x: 0
        //y: 0
        width: controlArea.width/4
        height: controlArea.height/5

        nbButtons: 10
        gridRow: 15
        gridColumn: 3
        texMex: gameFeedbackText
        buttonWidth: recwidth * 1/5
        buttonHeight: recheight * 1/12
        titleHeight: recheight * 1/12
        titles: title

        red: 0.41
        green:0.41
        blue: 0.41

    }

    Box11Goodbye{
        id: goodbyeBox
        box_index: 12

        color: 'transparent'

        //x: 0
        //y: 0
        width: controlArea.width/4
        height: controlArea.height/5

        nbButtons: 10
        gridRow: 15
        gridColumn: 3
        texMex: goodbyeText
        buttonWidth: recwidth * 1/5
        buttonHeight: recheight * 1/12
        titleHeight: recheight * 1/12
        titles: title

        red: 0.41
        green:0.41
        blue: 0.41

    }





//    ControlRow {
//        id: top_row
//        box_index: 0

//        color: 'transparent'

//        //x: 0
//        //y: 0
//        width: controlArea.width - 20
//        height: controlArea.height/(nbRows)-10

//        nbButtons: 10
//        gridRow: 15
//        gridColumn: 3
//        texMex: speakingText
//        buttonWidth: recwidth * 1/5
//        buttonHeight: recheight * 1/12
//        titleHeight: recheight * 1/12

//        red: 0.41
//        green:0.41
//        blue: 0.41
//    }

//    ControlColumn{
//        id: bottom_row
//        box_index: 1
//        color: 'transparent'

//        //x:0
//        //y: controlArea.height/(nbRows)
//        width:  controlArea.width - 20
//        height: controlArea.height/(nbRows) - 10

//        nbButtons: 10
//        gridRow: 15
//        gridColumn: 3
//        texMex: movementText
//        buttonWidth: recwidth * 1/5
//        buttonHeight: recheight * 1/12
//        titleHeight: recheight * 1/12

//        red: 0.18
//        green:0.3
//        blue: 0.3
//    }


}
