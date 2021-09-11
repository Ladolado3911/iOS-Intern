//
//  CurrencyCell.swift
//  iOS Intern
//
//  Created by Ladolado3911 on 11.09.21.
//

import UIKit

class CurrencyCell: UITableViewCell {
    
    var currencyModel: CurrencyModel?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setData(currency: CurrencyModel) {
        name.text = currency.name
        code.text = currency.code
        price.text = "\(currency.priceOf1Gel)"
        date.text = currency.date
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let currency = currencyModel else { return }
        setData(currency: currency)
    }
}
