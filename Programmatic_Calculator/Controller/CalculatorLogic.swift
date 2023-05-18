
import UIKit

struct CalculatorLogic {
    
    var number: Double?
    
    var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
 
    mutating func calculate(symbolString: String) -> Double? {
        
        if let n = number {
            switch symbolString {
            case "+/-":
                return n * -1
            case "A/C":
                return 0
            case "%":
                return n * 0.01
            case "=":
                let result = performTwoNumCalculation(n2: n)
                number = result // store result for next operation
                intermediateCalculation = nil // clear for next operation
                return result
            default:
                if intermediateCalculation != nil {
                    let result = performTwoNumCalculation(n2: n)
                    intermediateCalculation = (n1: result!, calcMethod: symbolString)
                    return result
                } else {
                    intermediateCalculation = (n1: n, calcMethod: symbolString)
                }
            }
        }
        return nil
    }
    
     func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1,
            let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "x":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}
