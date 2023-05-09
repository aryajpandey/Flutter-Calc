import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateController extends GetxController {

  var userInput = "";
  var userOutput = "";

  //Equal Button Functionality

  equalPressed(){
    String userInputFC = userInput;
    userInputFC = userInputFC.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(userInputFC);
    ContextModel ctx = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, ctx);

    userOutput = eval.toString();
    update();

  }

  //Clear Input Functionality

  clearInputAndOutput(){
    userInput="";
    userOutput="";

    update();
  }

  //Delete Button Functionality

  deleteBtnAction(){
    userInput = userInput.substring(0,0);
    update();
  }

  //Number Button Tapped
  onBtnTapped(List<String> buttons, int index){
    userInput += buttons[index];
    update();
  }
}