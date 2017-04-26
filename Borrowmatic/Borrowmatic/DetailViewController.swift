//
//  DetailViewController.swift
//  Borrowmatic
//
//  Created by Ryan Lee on 4/26/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UITableViewController {


    @IBOutlet weak var itemTitleTextField: UITextField!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var borrowedAtLabel: UILabel!
    @IBOutlet weak var returnedAtLabel: UILabel!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personTextField: UITextField!
    
    var moc:NSManagedObjectContext!
    
    var detailItem: BorrowItem? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        self.configureView()
    }
    
    @IBAction func saveItem(_ sender: Any) {
        if detailItem == nil {
            let borrowItem = BorrowItem(context: moc)
            borrowItem.title = itemTitleTextField.text
        }
        
        do {
            try moc.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    


}

