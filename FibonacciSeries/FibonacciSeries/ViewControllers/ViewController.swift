//
//  ViewController.swift
//  FibonacciSeries
//
//  Created by Suraj Singh (623-Extern) on 21/11/18.
//  Copyright © 2018 iOS Technologies. All rights reserved.
//

import UIKit
import BigInt
class ViewController: UIViewController , fibonacciGeneratorProtocol , UIScrollViewDelegate{
    
   
    @IBOutlet weak var tableView: UITableView!
    var numbersArray : [FibNumberModel] = []
    var fibCreator = FibonacciSeriesCreator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.454546464454546464454546464
        fibCreator.delegate = self
        fibCreator.generateFibonacciWithOffset(offset: 0)
        
        // set the tableView properties
        self.tableView.estimatedRowHeight = 45
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    func fibonacciGeneratedList(list: [FibNumberModel]) {
        numbersArray.append(contentsOf: list)
        self.tableView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for cell in self.tableView.visibleCells
        {
            if let fibCell  = cell as? FibonacciViewCell {
                let cellIndexPath = self.tableView.indexPath(for: fibCell)
                if let indexP = cellIndexPath {
                    if indexP.row >= self.numbersArray.count - 10 {
                        self.fibCreator.generateNextPagedSet()
                    }
                }
            }
        }
    }
}

