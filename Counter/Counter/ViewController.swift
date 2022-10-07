//
//  ViewController.swift
//  Counter
//
//  Created by SERGEY SHLYAKHIN on 07.10.2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var label: UILabel!
    
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
        counter = 0
    }
    
    //MARK: - Actions
    @IBAction func buttonTaped(_ sender: UIButton) {
        counter += 1
    }
    
}

