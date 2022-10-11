//
//  ViewController.swift
//  Counter
//
//  Created by SERGEY SHLYAKHIN on 07.10.2022.
//

import UIKit

class ViewController: UIViewController {

    private let stackView = UIStackView()
    private let counterLabel = UILabel()
    private let incrementCounterButton = UIButton()
    
    //MARK: - Properties
    private var counter = 0 {
        didSet {
            counterLabel.text = "Значение счетчика: \(counter)"
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        applyStyle()
        applyLayout()
    }
}

//MARK: - Private Methods
extension ViewController {
    private func setup() {
        counter = 0
        incrementCounterButton.addTarget(self, action: #selector(incrementCounterButtonTapped), for: .primaryActionTriggered)
    }
    
    private func applyStyle() {
        view.backgroundColor = .systemBackground
        
        stackView.axis = .vertical
        stackView.spacing = 40

        counterLabel.textAlignment = .center
        counterLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        counterLabel.numberOfLines = 0
        
        incrementCounterButton.setTitle("Увеличить счетчик", for: .normal)
        incrementCounterButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        incrementCounterButton.setTitleColor(.systemBlue, for: .normal)
        incrementCounterButton.backgroundColor = .systemGray
    }
    
    private func applyLayout() {
        [ counterLabel,
          incrementCounterButton
        ].forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(item)
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
        ])
    }
}

//MARK: - Actions
extension ViewController {
    @objc func incrementCounterButtonTapped() {
        counter += 1
    }
}
