
import UIKit

class CalculatorView: UIViewController {

    //MARK: - declare variables
    
    let displayLabel = UILabel() //displays calculator result
    let  labelContainer = UIView() //UIView for result
    
    //declare Stack views
    let topStackView = UIStackView()
    let secondStackView = UIStackView()
    let thirdStackView = UIStackView()
    let fourthStackView = UIStackView()
    let bottomStackView = UIStackView()
    let smallBottomLeft = UIStackView()
    let smallBottomRight = UIStackView()
    
    //declare buttons
    let buttonClear = UIButton()
    let buttonNegativePostive = UIButton()
    let buttonPercent = UIButton()
    let buttonDivision = UIButton()
    
    let buttonSeven = UIButton()
    let buttonEight = UIButton()
    let buttonNine = UIButton()
    let buttonMultiply = UIButton()
    
    let buttonFour = UIButton()
    let buttonFive = UIButton()
    let buttonSix = UIButton()
    let buttonMinus = UIButton()
    
    let buttonOne = UIButton()
    let buttonTwo = UIButton()
    let buttonThree = UIButton()
    let buttonPlus = UIButton()
    
    let buttonZero = UIButton()
    let buttonPeriod = UIButton()
    let buttonEqual = UIButton()
    
    //declare button size
    let buttonSize = 0.14
    
    //declare button colors
    let Orangecolor = UIColor(red: 1.00, green: 0.58, blue: 0.00, alpha: 1.00)
    let bluecolor = UIColor(red: 0.20, green: 0.60, blue: 0.86, alpha: 1.00)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupStackConfiguration()
        //configure buttons
        groupButtons()
        
        //configure label container and display 
        configurelabelContainer()
        configureDisplayLabel()
    }
    
    //MARK: - results display configuration
    
    func configurelabelContainer() {
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
    
    func configureDisplayLabel() {
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
    

    //MARK: - Stacks configuration
    
    func groupStackConfiguration() {
        configureBottomStackView() //bottom stack view is slight different than the others, hence unique configuration func
        //configure rest of stack views
        createStackViews(stackView: fourthStackView, bottomAnchor: bottomStackView.topAnchor, bottomConstant: -1, heightMultiplier: buttonSize)
        createStackViews(stackView: thirdStackView, bottomAnchor: fourthStackView.topAnchor, bottomConstant: -1, heightMultiplier: buttonSize)
        createStackViews(stackView: secondStackView, bottomAnchor: thirdStackView.topAnchor, bottomConstant: -1, heightMultiplier: buttonSize)
        createStackViews(stackView: topStackView, bottomAnchor: secondStackView.topAnchor, bottomConstant: -1, heightMultiplier: buttonSize)
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
            bottomStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: buttonSize),
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
    }
    
    func groupButtons() {
        configureButton(buttonTwo, title: "2", stackView: fourthStackView, buttonColor: bluecolor)
        configureButton(buttonThree, title: "3", stackView: fourthStackView, buttonColor: bluecolor)
        configureButton(buttonOne, title: "1", stackView: fourthStackView, buttonColor: bluecolor)
        configureButton(buttonPlus, title: "+", stackView: fourthStackView, buttonColor: Orangecolor)
        
        configureButton(buttonFour, title: "4", stackView: thirdStackView, buttonColor: bluecolor)
        configureButton(buttonFive, title: "5", stackView: thirdStackView, buttonColor: bluecolor)
        configureButton(buttonSix, title: "6", stackView: thirdStackView, buttonColor: bluecolor)
        configureButton(buttonMinus, title: "-", stackView: thirdStackView, buttonColor: Orangecolor)
        
        configureButton(buttonClear, title: "A/C", stackView: topStackView, buttonColor: .white)
        configureButton(buttonNegativePostive, title: "%", stackView: topStackView, buttonColor: .white)
        configureButton(buttonPercent, title: "+/-", stackView: topStackView, buttonColor: .white)
        configureButton(buttonDivision, title: "÷", stackView: topStackView, buttonColor: Orangecolor)
        
        configureButton(buttonSeven, title: "7", stackView: secondStackView, buttonColor: bluecolor)
        configureButton(buttonEight, title: "8", stackView: secondStackView, buttonColor: bluecolor)
        configureButton(buttonNine, title: "9", stackView: secondStackView, buttonColor: bluecolor)
        configureButton(buttonMultiply, title: "x", stackView: secondStackView, buttonColor: Orangecolor)
        
        configureButton(buttonZero, title: "0", stackView: smallBottomLeft, buttonColor: bluecolor)
        configureButton(buttonPeriod, title: ".", stackView: smallBottomRight, buttonColor: bluecolor)
        configureButton(buttonEqual, title: "=", stackView: smallBottomRight, buttonColor: Orangecolor)
    }
}



