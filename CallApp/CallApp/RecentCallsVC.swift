//
//  FirstViewController.swift
//  CallApp
//
//  Created by Hemanth Prasad on 1/3/19.
//  Copyright © 2019 Hemanth Prasad. All rights reserved.
//

import UIKit

class RecentCallsVC: UITableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.calls.phoneNumbers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = NumberFormatter.formatNumber(number: Model.calls.phoneNumbers[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AlertPresenter.call(phoneNumber: Model.calls.phoneNumbers[indexPath.row], presenter: self)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.calls.observers.append { [weak self] _ in
            guard let this = self else { return }
            this.tableView.reloadData()
        }
    }
}

