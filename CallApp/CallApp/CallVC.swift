//
//  SecondViewController.swift
//  CallApp
//
//  Created by Hemanth Prasad on 1/3/19.
//  Copyright © 2019 Hemanth Prasad. All rights reserved.
//

import UIKit

class CallVC: UIViewController {
    
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var controlButtons: UIStackView!
    
    var number: PhoneNumber = [] {
        didSet {
            self.numberLabel.text = NumberFormatter.formatNumber(number: self.number)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let allButtons: [UIButton] = topStackView.subviews
            .flatMap { $0.subviews as! [UIButton] }
        let digitButtons = allButtons.filter { !controlButtons.subviews.contains($0) }
        configureAllButtons(buttons: allButtons)
        configureDigitButtons(buttons: digitButtons)
        configureCallButton(button: callButton)
    }
    
    func configureAllButtons(buttons: [UIButton]) {
        buttons.forEach {
            $0.layer.cornerRadius = $0.bounds.size.width / 2            
        }
    }
    
    func configureDigitButtons(buttons: [UIButton]) {
        buttons.forEach {
            $0.addTarget(self, action: #selector(digitButtonTapped(sender:)), for: .touchUpInside)
            $0.backgroundColor = UIColor(white: 0.8, alpha: 1)
        }
    }
    
    func configureCallButton(button: UIButton) {
        button.addTarget(self, action: #selector(callButtonTapped(sender:)), for: .touchUpInside)
    }
    
    @objc
    func digitButtonTapped(sender: UIButton) {
        let title = sender.titleLabel!.text!
        number =  number + [title]
    }
    
    @objc
    func callButtonTapped(sender: UIButton) {
        guard number.count > 0 else { return }
        Model.calls.insert(call: number)
        AlertPresenter.call(phoneNumber: number, presenter: self)
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        number = Array(number.dropLast())
    }
}

