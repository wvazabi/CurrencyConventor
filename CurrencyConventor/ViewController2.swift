//
//  ViewController2.swift
//  CurrencyConventor
//
//  Created by Enes Kaya on 26.10.2023.
//

import UIKit

class ViewController2: UIViewController {
    let resetButton     = CWButton(backgroundColor: .systemGreen, title: "Reset", systemImageName: "arrow.clockwise.circle")
    var array:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRulesButton()

        // Do any additional setup after loading the view.
    }
    
    func configureRulesButton() {
            view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(presentRuleVC), for: .touchUpInside)
        resetButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        
            NSLayoutConstraint.activate([
                resetButton.widthAnchor.constraint(equalTo: view.widthAnchor),
                resetButton.heightAnchor.constraint(equalTo: view.heightAnchor),
                resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                resetButton .topAnchor.constraint(equalTo: view.topAnchor)
            ])
        }
    @objc func presentRuleVC() {
           present(ViewController(), animated: true)
        
            
        }
        
       



}
