//
//  AlertPresenter.swift
//  CallApp
//
//  Created by Hemanth Prasad on 1/3/19.
//  Copyright © 2019 Hemanth Prasad. All rights reserved.
//

import UIKit

class AlertPresenter {
    static func call(phoneNumber: PhoneNumber, presenter: UIViewController) {
        let alert = UIAlertController(title: "Calling...", message: NumberFormatter.formatNumber(number: phoneNumber), preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        presenter.present(alert, animated: true, completion: nil)
    }
}
