//
//  ViewController.swift
//  Counter
//
//  Created by SERGEY SHLYAKHIN on 07.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
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
    }
    
    //MARK: - Methods
    private func setup() {
        view.backgroundColor = .systemBackground
        counter = 0
    }
    
    //MARK: - Actions
    
}

