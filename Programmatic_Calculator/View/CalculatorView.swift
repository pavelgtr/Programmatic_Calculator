
import UIKit

class CalculatorView: UIViewController {
    
    var calculatorLogic = CalculatorLogic()
    var isDoneTypingNumber = true //helps with behavior of calculator functions
    
    let displayLabel = UILabel() //displays calculator result
    let labelContainer = UIView() //UIView for result
   
    var displayValue: Double { //configure display value into Double type
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("cannot convert display label to double")
            }
            return number
        } set {
            displayLabel.text = floor(newValue) == newValue ? String(Int(newValue)) : String(newValue) //changing double to Int if value ends in .0
        }
    }
    
    //MARK: - declare Stacks
    
    let topStackView = UIStackView()
    let secondStackView = UIStackView()
    let thirdStackView = UIStackView()
    let fourthStackView = UIStackView()
    let bottomStackView = UIStackView()
    let smallBottomLeft = UIStackView()
    let smallBottomRight = UIStackView()
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupStacks()
        groupButtons()
        configureDisplayContainer()
        configureDisplay()
        
    }
    
    //MARK: - configure stacks
    //configure top and bottom stacks with unique configurations due to constraints
    func groupStacks() {
        configureBottomStackView() //bottom stack unique configuration
        
        createStackViews(name: fourthStackView, YAxisAnchor: bottomStackView.topAnchor, constant: -1, heightMultiplier: Buttons.buttonSize)
        createStackViews(name: thirdStackView, YAxisAnchor: fourthStackView.topAnchor, constant: -1, heightMultiplier: Buttons.buttonSize)
        createStackViews(name: secondStackView, YAxisAnchor: thirdStackView.topAnchor, constant: -1, heightMultiplier: Buttons.buttonSize)
        createStackViews(name: topStackView, YAxisAnchor: secondStackView.topAnchor, constant: -1, heightMultiplier: Buttons.buttonSize)
    }
    
    func configureBottomStackView() { //this stack has unique configuration compared to the rest (ie func createStackViews()
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
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bottomStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: Buttons.buttonSize),
            bottomStackView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 0)
        ])
    }
    
    //create and configure the rest of the stacks
    func createStackViews(name: UIStackView, YAxisAnchor: NSLayoutYAxisAnchor, constant: CGFloat, heightMultiplier: CGFloat) {
        name.backgroundColor = .clear
        name.axis = .horizontal
        name.alignment = .fill
        name.distribution = .fillEqually
        name.spacing = 3
        view.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            name.bottomAnchor.constraint(equalTo: YAxisAnchor, constant: constant),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            name.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: heightMultiplier)
        ])
    }
    
    //MARK: - button configuration
    
    func configureButton(button: UIButton, title: String, stackView: UIStackView, buttonColor: UIColor) {
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
        //declare button colors
        let blue = UIColor(red: 0.20, green: 0.60, blue: 0.86, alpha: 1.00)
        let orange = UIColor(red: 1.00, green: 0.58, blue: 0.00, alpha: 1.00)
        let white: UIColor = .white
        
        let buttonArray = [
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
        
        for configuration in buttonArray {
            configureButton(button: configuration.0, title: configuration.1, stackView: configuration.2, buttonColor: configuration.3)
        }
    }
    
    //MARK: - configure label and Parent view
    
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
