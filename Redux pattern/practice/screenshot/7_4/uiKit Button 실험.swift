//
//  ViewController.swift
//  prac
//
//  Created by Hankyu Lee on 2022/07/04.
//

import UIKit
class customButton: UIButton {
    
    override var isHighlighted: Bool {
            didSet {
            }
        }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = .red
            } else {
                backgroundColor = .green
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = 4
        clipsToBounds = true
        backgroundColor = .black
        
        }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
class ViewController: UIViewController {

    var isTapped = false {
        didSet {
            testButotn2.setNeedsUpdateConfiguration()
        }
    }
    
    let testButotn4: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        return button
    }()
    
    lazy var testButotn : UIButton = {
        var configuration = UIButton.Configuration.tinted()
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { _ in
            self.isTapped.toggle()
        }))
        
        button.configurationUpdateHandler = { button in
            var config = button.configuration
            config?.background.backgroundColor = button.isSelected ? .yellow : .brown
            button.configuration = config
        }
        
        return button
    }()
    
    lazy var testButotn2: UIButton = {
        var configuration = UIButton.Configuration.tinted()
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { _ in
            print("버튼 2는 아무일 안함")
        }))
        button.configurationUpdateHandler = { button in
            var config = button.configuration
            config?.background.backgroundColor = self.isTapped ? .red : .green
            button.configuration = config
        }
        return button
    }()
    
    let testButotn3: UIButton = customButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testButotn.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchDown)
        view.addSubview(testButotn)
        testButotn.translatesAutoresizingMaskIntoConstraints = false
        testButotn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -300).isActive = true
        testButotn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 80).isActive = true
        testButotn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -80).isActive = true
        
        view.addSubview(testButotn2)
        testButotn2.translatesAutoresizingMaskIntoConstraints = false
        testButotn2.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -200).isActive = true
        testButotn2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 80).isActive = true
        testButotn2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -80).isActive = true

        view.addSubview(testButotn3)
        testButotn3.translatesAutoresizingMaskIntoConstraints = false
        testButotn3.addTarget(self, action: #selector(buttonTapAction3(_:)), for: .touchDown)
        testButotn3.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -150).isActive = true
        testButotn3.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 80).isActive = true
        testButotn3.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -80).isActive = true
        
        testButotn4.addTarget(self, action: #selector(buttonTapAction4(_:)), for: .touchDown)
        view.addSubview(testButotn4)
        testButotn4.translatesAutoresizingMaskIntoConstraints = false
        testButotn4.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        testButotn4.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 80).isActive = true
        testButotn4.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        
    }
    
    @objc internal func buttonTapAction3(_ sender: UIButton) {
        
        sender.isSelected.toggle()

    }
    
    @objc internal func buttonTapAction(_ sender: UIButton) {
        
        sender.isSelected.toggle()

    }
    
    @objc internal func buttonTapAction4(_ sender: UIButton) {
            sender.isSelected.toggle()
            if sender.isSelected {
                testButotn4.backgroundColor = .red
            } else {
                testButotn4.backgroundColor = .gray
            }
        }
    
    
}



