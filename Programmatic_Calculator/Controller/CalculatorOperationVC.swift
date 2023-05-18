
import UIKit

class CalculatorOperationVC {
     //this is the file I need help with, I would like to enter the following code in here:
    
    /*
     @objc func calcButtonPressed(_ sender: UIButton) {
         print("Calculation button pressed")
         isDoneTypingNumber = true
         sender.alpha = 0.5
         
         //Code should execute after 0.2 second delay.
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
              //Bring's sender's opacity back up to fully opaque.
              sender.alpha = 1.0
          }
        
         calculatorLogic.setNumber(displayValue)

         if let symbolString = sender.currentTitle {

             if let result = calculatorLogic.calculate(symbolString: symbolString) {
                 displayValue = result
             }
         }
     }
     
     @objc func numButtonPressed(_ sender: UIButton) {
         print("Number button pressed")
         sender.alpha = 0.5
         
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
             sender.alpha = 1.0
         }
         guard let currentUserInput = sender.currentTitle else { //safely unwrap and assign new constant for user input, called num
             fatalError("num has no value")
         }
         
         if isDoneTypingNumber {
             if sender.currentTitle == "." { //if the first key the user presses is ".", then will automatically change value to "0." If user input is not ".", then simply go the next block
                 displayLabel.text = "0."
                 isDoneTypingNumber = false
             } else { //next, we'll append whatever num the user presses and immediately make isDoneTypingNumber FALSE, so we can move on to the next block (see below)
                 displayLabel.text! = currentUserInput
                 isDoneTypingNumber = false
             }
         } else {  // NEXT BLOCK
             if currentUserInput == "." {
                 let isInt = floor(displayValue) == displayValue
                 if !isInt {
                     return
                 }
             }
             displayLabel.text = (displayLabel.text ?? "0.0") + currentUserInput
         }
     }
     
     // add targets to calculation buttons
     func addTargetToCalcButtons() {
         let calcButtonCollection: [UIButton] = [Buttons.buttonClear, Buttons.buttonMultiply, Buttons.buttonNegativePostive, Buttons.buttonPercent, Buttons.buttonDivision, Buttons.buttonPlus, Buttons.buttonMinus, Buttons.buttonEqual]
         for button in calcButtonCollection {
             button.addTarget(self, action: #selector(calcButtonPressed(_:)), for: .touchUpInside)
         }
     }
     
     // add targets to number buttons
     func addTargetToNumButtons() {
         let numButtonCollection : [UIButton] = [Buttons.buttonPeriod, Buttons.buttonZero, Buttons.buttonOne, Buttons.buttonTwo, Buttons.buttonThree, Buttons.buttonFour, Buttons.buttonFive, Buttons.buttonSix, Buttons.buttonSeven, Buttons.buttonEight, Buttons.buttonNine]
         for button in numButtonCollection {
             button.addTarget(self, action: #selector(numButtonPressed(_:)), for: .touchUpInside)
         }
     }
     */
}
