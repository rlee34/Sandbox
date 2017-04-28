//
//  DetailViewController.swift
//  Borrowmatic
//
//  Created by Ryan Lee on 4/26/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, TimeFrameDelegate {


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
    
    var personImageAdded = false
    var itemImageAdded = false
    
    enum PicturePurpose {
        case item
        case person
    }
    
    var picturePurposeSelector: PicturePurpose = .item
    
    var startDate: NSDate?
    var endDate: NSDate?
    
    func configureView() {
        if let titleTextField = itemTitleTextField {
            if let borrowItem = detailItem {
                titleTextField.text = borrowItem.title
                
                if let availableImageData = borrowItem.image as? Data {
                    itemImageView.image = UIImage(data: availableImageData)
                }
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyy"
                
                if let availableStartDate = borrowItem.startDate as? Date {
                    borrowedAtLabel.text = "Borrowed at: \(dateFormatter.string(from: availableStartDate))"
                }
                
                if let availableEndDate = borrowItem.endDate as? Date {
                    returnedAtLabel.text = "Return at: \(dateFormatter.string(from: availableEndDate))"
                }
                
                if let associatedPerson = borrowItem.person {
                    personTextField.text = associatedPerson.name
                    
                    if let personImageData = associatedPerson.image as? Data {
                        personImageView.image = UIImage(data: personImageData)
                    }
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let itemGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DetailViewController.addPictureForItem))
        itemImageView.addGestureRecognizer(itemGestureRecognizer)
        
        let personGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DetailViewController.addPictureForPerson))
        personImageView.addGestureRecognizer(personGestureRecognizer)
        
        self.configureView()
    }
    
    @IBAction func saveItem(_ sender: Any) {
        if detailItem == nil {
            let borrowItem = BorrowItem(context: moc)
            borrowItem.title = itemTitleTextField.text
            
            if let itemImage = itemImageView.image {
                borrowItem.image = NSData(data: UIImageJPEGRepresentation(itemImage, 0.3)!)
            }
            
            if let availableStartDate = startDate {
                borrowItem.startDate = availableStartDate
            }
            
            if let availableEndDate = endDate {
                borrowItem.endDate = availableEndDate
            }
            
            let personRequest:NSFetchRequest<Person> = Person.fetchRequest()
            
            if let name = personTextField.text {
                personRequest.predicate = NSPredicate(format: "name == %@", name)
            }
            
            personRequest.fetchLimit = 1
            
            let numberOfResults = try! moc.count(for: personRequest)
            
            if numberOfResults == 0 {
                let newPerson = Person(context: moc)
                newPerson.name = personTextField.text
                
                if let personImageToSave = personImageView.image {
                    newPerson.image = NSData(data: UIImageJPEGRepresentation(personImageToSave, 0.3)!)
                }
                
                newPerson.addToBorrowItem(borrowItem)
            } else {
                var items = [Person]()
                do {
                    try items = moc.fetch(personRequest)
                } catch {
                    print(error.localizedDescription)
                }
                
                if let foundPerson = items.first {
                    foundPerson.addToBorrowItem(borrowItem)
                }
            }
            
        } else {
            if let availableStartDate = startDate {
                detailItem?.startDate = availableStartDate
            }
            
            if let availableEndDate = endDate {
                detailItem?.endDate = availableEndDate
            }
        }
        
        do {
            try moc.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addPictureForItem() {
        picturePurposeSelector = .item
        addImageWithPurpose()
    }
    
    func addPictureForPerson() {
        picturePurposeSelector = .person
        addImageWithPurpose()
    }
    
    func addImageWithPurpose() {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.delegate = self
        
        imagePickerVC.sourceType = .photoLibrary
        
        self.present(imagePickerVC, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            let scaledImage = UIImage.scaleImage(image: image, toWidth: 120, andHeight: 120)
            
            if picturePurposeSelector == .item {
                itemImageView.image = scaledImage
                itemImageAdded = true
            } else {
                personImageView.image = scaledImage
                personImageAdded = true
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTimeframeVC" {
            let timeframeVC = segue.destination as! TimeframeViewController
            timeframeVC.timeFrameDelegate = self
        }
    }
    
    func didSelectDateRange(range: GLCalendarDateRange) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyy"
        
        borrowedAtLabel.text = "Borrowed at: \(dateFormatter.string(from: range.beginDate))"
        returnedAtLabel.text = "Returned at: \(dateFormatter.string(from: range.endDate))"
        
        startDate = range.beginDate as NSDate
        endDate = range.endDate as NSDate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    


}

