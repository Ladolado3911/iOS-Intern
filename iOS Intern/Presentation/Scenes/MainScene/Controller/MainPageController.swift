//
//  ViewController.swift
//  iOS Intern
//
//  Created by Ladolado3911 on 10.09.21.
//

import UIKit

class MainPageController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var mainDataSource: MainDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDataSource()

    }
    
    private func configDataSource() {
        mainDataSource = MainDataSource(table: tableView,
                                        rootController: self)
    }
}

