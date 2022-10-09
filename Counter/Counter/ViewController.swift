//
//  ViewController.swift
//  Counter
//
//  Created by SERGEY SHLYAKHIN on 07.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let button = UIButton()
    
    //MARK: - Properties
    private var counter = 0 {
        didSet {
            label.text = "Значение счетчика: \(counter)"
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
    }
}

//MARK: - Private Methods
extension ViewController {
    private func setup() {
        counter = 0
        button.addTarget(self, action: #selector(buttonTapped), for: .primaryActionTriggered)
    }
    
    private func style() {
        view.backgroundColor = .systemBackground
        
        stackView.axis = .vertical
        stackView.spacing = 40

        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 0
        
        button.setTitle("Увеличить счетчик", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .systemGray
    }
    
    private func layout() {
        [ label,
          button
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
    @objc func buttonTapped () {
        counter += 1
    }
}
