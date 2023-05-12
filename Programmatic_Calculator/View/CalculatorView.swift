
import UIKit

class CalculatorView: UIViewController {
    
    //MARK: - declare variables
    
    var calculatorLogic = CalculatorLogic()
    var isDoneTypingNumber = true //determines behavior of calculator functions
    
    let displayLabel = UILabel() //displays calculator result
    let  labelContainer = UIView() //UIView for result
    
    //configure display value into Double type
    var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("cannot convert display label to double")
            }
            return number
        } set {
            displayLabel.text = floor(newValue) == newValue ? String(Int(newValue)) : String(newValue) //changing to Int if value ends in .0
        }
    }
    
    //MARK: - declare programmatic UI elements 
    
    //declare Stack views
    let topStackView = UIStackView()
    let secondStackView = UIStackView()
    let thirdStackView = UIStackView()
    let fourthStackView = UIStackView()
    let bottomStackView = UIStackView()
    let smallBottomLeft = UIStackView()
    let smallBottomRight = UIStackView()
    
    //DELETED BUTTON DECLARATIONS HERE. JUST MAKING A NOTE. WILL USE BUTTONS STRUCT
    
    //declare button size
    let buttonSize = 0.14
    
    //declare button colors
    let Orangecolor = UIColor(red: 1.00, green: 0.58, blue: 0.00, alpha: 1.00)
    let bluecolor = UIColor(red: 0.20, green: 0.60, blue: 0.86, alpha: 1.00)
    
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupStackConfiguration()
        //configure buttons
        groupButtons()
        
        //configure label container and display
        configureDisplayContainer()
        configureDisplay()
    }
    
    //MARK: - calculator functions
    
    @objc func calcButtonPressed(_ sender: UIButton) {
        print("Calculation button pressed")
        isDoneTypingNumber = true
        
        calculatorLogic.setNumber(displayValue)

        if let symbolString = sender.currentTitle {

            if let result = calculatorLogic.calculate(symbolString: symbolString) {
                displayValue = result
            }
        }
    }
    
    @objc func numButtonPressed(_ sender: UIButton) {
        print("Number button pressed")
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
    //MARK: - configure stacks
    //configure top and bottom stacks with unique configurations
    func groupStackConfiguration() {
        configureBottomStackView() //bottom stack view is slight different than the others, hence unique configuration func
        //configure rest of stack views
        createStackViews(stackView: fourthStackView, bottomAnchor: bottomStackView.topAnchor, bottomConstant: -1, heightMultiplier: Buttons.buttonSize)
        createStackViews(stackView: thirdStackView, bottomAnchor: fourthStackView.topAnchor, bottomConstant: -1, heightMultiplier: Buttons.buttonSize)
        createStackViews(stackView: secondStackView, bottomAnchor: thirdStackView.topAnchor, bottomConstant: -1, heightMultiplier: Buttons.buttonSize)
        createStackViews(stackView: topStackView, bottomAnchor: secondStackView.topAnchor, bottomConstant: -1, heightMultiplier: Buttons.buttonSize)
    }
    
    func configureBottomStackView() { //this stack has unique configuration compared to the rest (ie func createStackViews() )
        view.addSubview(bottomStackView)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.axis = .horizontal
        bottomStackView.alignment = .fill
        bottomStackView.distribution = .fillEqually
        bottomStackView.spacing = 4
        
        bottomStackView.addArrangedSubview(smallBottomLeft)
        bottomStackView.addArrangedSubview(smallBottomRight)
        
        smallBottomRight.axis = .horizontal
        smallBottomRight.distribution = .fillEqually
        smallBottomRight.alignment = .fill
        smallBottomRight.spacing = 1
        
        NSLayoutConstraint.activate([
            //            bottomStackView.topAnchor.constraint(equalTo: fourthStackView.bottomAnchor, constant: 5),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bottomStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: Buttons.buttonSize),
            bottomStackView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 0)
        ])
    }
    
    //create and configure the rest of the stacks
    func createStackViews(stackView: UIStackView, bottomAnchor: NSLayoutYAxisAnchor, bottomConstant: CGFloat, heightMultiplier: CGFloat) {
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 3
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomConstant),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: heightMultiplier)
        ])
    }
    
    //MARK: - button configuration
    
    func configureButton(_ button: UIButton, title: String, stackView: UIStackView, buttonColor: UIColor) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.titleLabel?.textAlignment = .center
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 30
        button.backgroundColor = buttonColor
        stackView.addArrangedSubview(button)
        if let title = button.currentTitle, ["A/C", "%", "+/-", "÷", "x", "+", "-", "="].contains(title) {
                   button.addTarget(self, action: #selector(calcButtonPressed(_:)), for: .touchUpInside)
               } else {
                   button.addTarget(self, action: #selector(numButtonPressed(_:)), for: .touchUpInside)
               }
    }
    
    func groupButtons() {
        let blue = Buttons.bluecolor
        let orange = Buttons.Orangecolor
        let white: UIColor = .white
        
        let buttonConfigs = [
            //top row
            (Buttons.buttonClear, "A/C", topStackView, white),
            (Buttons.buttonNegativePostive, "+/-", topStackView, white),
            (Buttons.buttonPercent, "%", topStackView, white),
            (Buttons.buttonDivision, "÷", topStackView, orange),
            //2nd row
            (Buttons.buttonSeven, "7", secondStackView, blue),
            (Buttons.buttonEight, "8", secondStackView, blue),
            (Buttons.buttonNine, "9", secondStackView, blue),
            (Buttons.buttonMultiply, "x", secondStackView, orange),
            //3rd row
            (Buttons.buttonFour, "4", thirdStackView, blue),
            (Buttons.buttonFive, "5", thirdStackView, blue),
            (Buttons.buttonSix, "6", thirdStackView, blue),
            (Buttons.buttonMinus, "-", thirdStackView, orange),
            //4th row
            (Buttons.buttonTwo, "2", fourthStackView, blue),
            (Buttons.buttonThree, "3", fourthStackView, blue),
            (Buttons.buttonOne, "1", fourthStackView, blue),
            (Buttons.buttonPlus, "+", fourthStackView, orange),
            //bottom row
            (Buttons.buttonZero, "0", smallBottomLeft, blue),
            (Buttons.buttonPeriod, ".", smallBottomRight, blue),
            (Buttons.buttonEqual, "=", smallBottomRight, orange)
        ]
        
        for config in buttonConfigs {
            configureButton(config.0, title: config.1, stackView: config.2, buttonColor: config.3)
        }
    }
    
    //MARK: - configure label and its parent view
    
    func configureDisplayContainer() {
        view.addSubview(labelContainer)
        
        labelContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            labelContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            labelContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            labelContainer.bottomAnchor.constraint(equalTo: topStackView.topAnchor, constant: -1)
        ])
        labelContainer.backgroundColor = .clear
    }
    
    func configureDisplay() {
        labelContainer.addSubview(displayLabel)
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        displayLabel.centerXAnchor.constraint(equalTo: labelContainer.centerXAnchor, constant: 0).isActive = true
        displayLabel.centerYAnchor.constraint(equalTo: labelContainer.centerYAnchor, constant: 0).isActive = true
        displayLabel.leadingAnchor.constraint(equalTo: labelContainer.leadingAnchor, constant: 20).isActive = true
        displayLabel.trailingAnchor.constraint(equalTo: labelContainer.trailingAnchor, constant: -20).isActive = true
        
        
        displayLabel.text = "0"
        displayLabel.textColor = .white
        displayLabel.font = .boldSystemFont(ofSize: 50)
        displayLabel.textAlignment = .right
    }
}






