import UIKit

extension CalculatorView {
    // declare functionality of buttons
    
    @objc func calcButtonPressed(_ sender: UIButton) {
        print("Button pressed")
        
        
        let calcMethod = sender.currentTitle
        
        switch calcMethod {
        case "+/-":
            displayValue *= -1
        case "A/C":
            displayValue = 0
        case "%":
            displayValue *= 0.01
        default:
            print("this is the default")
        }
        
    }
    
    @objc func numButtonPressed(_ sender: UIButton) {
        print("number pressed") //test that all num buttons work
        
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
        let numButtonCollection : [UIButton] = [Buttons.buttonPeriod, Buttons.buttonZero, Buttons.buttonOne, Buttons.buttonTwo, Buttons.buttonThree, Buttons.buttonFour, Buttons.buttonFive, Buttons.buttonSix, Buttons.buttonSeven, Buttons.buttonEight, Buttons.buttonNine, Buttons.buttonZero]
        for button in numButtonCollection {
            button.addTarget(self, action: #selector(numButtonPressed(_:)), for: .touchUpInside)
        }
    }
    
}
