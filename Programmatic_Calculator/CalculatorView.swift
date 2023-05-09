
import UIKit

class CalculatorView: UIViewController {
    
    let mainStackView = UIStackView()
    
    let displayLabel = UILabel()
    
    let topStackView = UIStackView()
    let secondStackView = UIStackView()
    let thirdStackView = UIStackView()
    let fourthStackView = UIStackView()
    let bottomStackView = UIStackView()
    let bottomLeft = UIStackView()
    let bottomRight = UIStackView()
    
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
    
    let multiplierDistance = 0.14
    
    let  labelContainer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        configureBottomStackView()
        createAndConfigureStackView(stackView: fourthStackView, bottomAnchor: bottomStackView.topAnchor, bottomConstant: -1, heightMultiplier: multiplierDistance)
        createAndConfigureStackView(stackView: thirdStackView, bottomAnchor: fourthStackView.topAnchor, bottomConstant: -1, heightMultiplier: multiplierDistance)
        createAndConfigureStackView(stackView: secondStackView, bottomAnchor: thirdStackView.topAnchor, bottomConstant: -1, heightMultiplier: multiplierDistance)
        createAndConfigureStackView(stackView: topStackView, bottomAnchor: secondStackView.topAnchor, bottomConstant: -1, heightMultiplier: multiplierDistance)
 
        configureButtons()
     
        configureYellowButtons()
        
        configureBlueButtons()
        
        configurelabelContainer()
        configureDisplayLabel()
    }
    
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
    
    func configureButton(_ button: UIButton, title: String, stackView: UIStackView) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.titleLabel?.textAlignment = .center
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 30
        stackView.addArrangedSubview(button)
    }
    
    func configureTopStackView() {
        topStackView.backgroundColor = .clear
        view.addSubview(topStackView)
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.axis = .horizontal
        topStackView.alignment = .fill
        topStackView.distribution = .fillEqually
        topStackView.spacing = 1
        
        mainStackView.addArrangedSubview(topStackView)
        
        
        NSLayoutConstraint.activate([
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            topStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplierDistance)
        ])
    }
    
    func configureSecondStackView() {
        secondStackView.backgroundColor = .clear
        view.addSubview(secondStackView)
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        secondStackView.axis = .horizontal
        secondStackView.alignment = .fill
        secondStackView.distribution = .fillEqually
        secondStackView.spacing = 1
        
        
        NSLayoutConstraint.activate([
            secondStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 5),
            secondStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            secondStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            secondStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplierDistance)
        ])
    }
    
    func createAndConfigureStackView(stackView: UIStackView, bottomAnchor: NSLayoutYAxisAnchor, bottomConstant: CGFloat, heightMultiplier: CGFloat) {
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
    
    func configureBottomStackView() {
        view.addSubview(bottomStackView)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.axis = .horizontal
        bottomStackView.alignment = .fill
        bottomStackView.distribution = .fillEqually
        bottomStackView.spacing = 4
        
        bottomStackView.addArrangedSubview(bottomLeft)
        bottomStackView.addArrangedSubview(bottomRight)
        
        bottomRight.axis = .horizontal
        bottomRight.distribution = .fillEqually
        bottomRight.alignment = .fill
        bottomRight.spacing = 1
        
        
        configureButton(buttonZero, title: "0", stackView: bottomLeft)
        configureButton(buttonPeriod, title: ".", stackView: bottomRight)
        configureButton(buttonEqual, title: "=", stackView: bottomRight)
        
        NSLayoutConstraint.activate([
//            bottomStackView.topAnchor.constraint(equalTo: fourthStackView.bottomAnchor, constant: 5),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bottomStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplierDistance),
            bottomStackView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 0)
        ])
        
    }
    
    
    func configureButtons() {
        configureButton(buttonTwo, title: "2", stackView: fourthStackView)
        configureButton(buttonThree, title: "3", stackView: fourthStackView)
        configureButton(buttonOne, title: "1", stackView: fourthStackView)
        configureButton(buttonPlus, title: "+", stackView: fourthStackView)
                
        configureButton(buttonFour, title: "4", stackView: thirdStackView)
        configureButton(buttonFive, title: "5", stackView: thirdStackView)
        configureButton(buttonSix, title: "6", stackView: thirdStackView)
        configureButton(buttonMinus, title: "-", stackView: thirdStackView)
        
        configureButton(buttonClear, title: "A/C", stackView: topStackView)
        configureButton(buttonNegativePostive, title: "%", stackView: topStackView)
        configureButton(buttonPercent, title: "+/-", stackView: topStackView)
        configureButton(buttonDivision, title: "÷", stackView: topStackView)
        
        configureButton(buttonSeven, title: "7", stackView: secondStackView)
        configureButton(buttonEight, title: "8", stackView: secondStackView)
        configureButton(buttonNine, title: "9", stackView: secondStackView)
        configureButton(buttonMultiply, title: "x", stackView: secondStackView)
    }
    
    func configureYellowButtons() {
        
        let yellowcolor = UIColor(red: 1.00, green: 0.58, blue: 0.00, alpha: 1.00)
        
        buttonDivision.backgroundColor = yellowcolor
        buttonMinus.backgroundColor = yellowcolor
        buttonMultiply.backgroundColor = yellowcolor
        buttonEqual.backgroundColor = yellowcolor
        buttonPlus.backgroundColor = yellowcolor
    }
    
    func configureBlueButtons() {
        let bluecolor = UIColor(red: 0.20, green: 0.60, blue: 0.86, alpha: 1.00)
        
        buttonOne.backgroundColor = bluecolor
        buttonTwo.backgroundColor =  bluecolor
        buttonThree.backgroundColor = bluecolor
        buttonFour.backgroundColor = bluecolor
        buttonFive.backgroundColor = bluecolor
        buttonSix.backgroundColor =  bluecolor
        buttonSeven.backgroundColor =  bluecolor
        buttonEight.backgroundColor  = bluecolor
        buttonNine.backgroundColor = bluecolor
        buttonZero.backgroundColor = bluecolor
        buttonPeriod.backgroundColor = bluecolor
        
    }
    
}



