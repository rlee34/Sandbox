//
//  DetailViewController.swift
//  Borrowmatic
//
//  Created by Ryan Lee on 4/26/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: BorrowItem? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

