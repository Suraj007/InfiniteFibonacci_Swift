//
//  FibonacciViewCell.swift
//  FibonacciSeries
//
//  Created by Suraj Singh (623-Extern) on 21/11/18.
//  Copyright © 2018 iOS Technologies. All rights reserved.
//

import UIKit

class FibonacciViewCell: UITableViewCell {

    @IBOutlet weak var numberlabel: UILabel!
    @IBOutlet weak var cellIndexNumlabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
