//
//  MainDataSource.swift
//  iOS Intern
//
//  Created by Ladolado3911 on 11.09.21.
//

import UIKit

class MainDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var tableView: UITableView!
    private var rootController: MainPageController!
    private var data: [CurrencyModel]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(table tableView: UITableView, rootController controller: MainPageController) {
        super.init()
        self.tableView = tableView
        self.rootController = controller
        config()
        populateData()
    }
    
    private func config() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "CurrencyCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CurrencyCell")
    }
    
    private func populateData() {
        CurrencyManager().getCurrency { [weak self] data in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = data else { return 0 }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = data else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell")
        let currencyCell = cell as? CurrencyCell
        currencyCell?.currencyModel = data[indexPath.row]
        return currencyCell!
    }
}
