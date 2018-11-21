//
//  ViewController+TableExtension.swift
//  FibonacciSeries
//
//  Created by Suraj Singh (623-Extern) on 21/11/18.
//  Copyright © 2018 iOS Technologies. All rights reserved.
//

import Foundation
import UIKit

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.StoryBoard.CellIdentifier.fibonacciViewCell, for: indexPath) as! FibonacciViewCell
        let model = numbersArray[indexPath.row]
        cell.cellIndexNumlabel.text = "Cell " + String(indexPath.row)
        cell.numberlabel.text = model.stringValue()
        return cell
    }
}
