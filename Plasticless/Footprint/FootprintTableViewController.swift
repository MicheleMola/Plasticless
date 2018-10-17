//
//  FootprintTableViewController.swift
//  Plasticless
//
//  Created by Luigi Barretta on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class FootprintTableViewController: UITableViewController {
    //Outlets
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var tableViewDescription: UILabel!
    
    @IBOutlet weak var itemOnePictureImageView: UIImageView!
    @IBOutlet weak var itemOneNameLabel: UILabel!
    @IBOutlet weak var itemOneQuantityTextField: UITextField!

    @IBOutlet weak var itemTwoPictureImageView: UIImageView!
    @IBOutlet weak var itemTwoNameLabel: UILabel!
    @IBOutlet weak var itemTwoQuantityTextField: UITextField!
    
    @IBOutlet weak var itemThreePictureImageView: UIImageView!
    @IBOutlet weak var itemThreeNameLabel: UILabel!
    @IBOutlet weak var itemThreeQuantityTextField: UITextField!
    
    @IBOutlet weak var itemFourPictureImageView: UIImageView!
    @IBOutlet weak var itemFourNameLabel: UILabel!
    @IBOutlet weak var itemFourQuantityTextField: UITextField!
    
    //Create an instance of the object PlasticItem
//    let myItems = PlasticItem(image: <#UIImage#>, name: <#String#>, quantity: <#Int#>)
    var itemsObj = [PlasticItem]()
    
    var itemImages: [UIImage] = []
    var itemNames: [String] = []
    var itemQuantities: [Int] = []
    
    override func viewDidLoad() {
        setupView()
        hideKeyboardWhenTappedAround()
        
//        for i in 0..<4 { // this will add 3 elements to PlasticItems
//            itemsObj.append(PlasticItem(image: itemImages[i], name: itemNames[i], quantity: itemQuantities[i]))
//        }
//        
        super.viewDidLoad()
        
        // Enable the Save button only if the text field has a valid number.
        updateSaveButtonState()

    }
    
    func setupView() {
        var imagesCollection: [UIImageView] = [itemOnePictureImageView, itemTwoPictureImageView, itemThreePictureImageView, itemFourPictureImageView]
        var namesCollection: [UILabel] = [itemOneNameLabel, itemTwoNameLabel, itemThreeNameLabel, itemFourNameLabel]
        var quantitiesCollection: [UITextField] = [itemOneQuantityTextField, itemTwoQuantityTextField, itemThreeQuantityTextField, itemFourQuantityTextField]
    }
    
    
    @IBAction func saveButtonOnClick(_ sender: Any) {
    }
    // Enable the Save button only if the text field has a valid  name.
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = itemOneQuantityTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    @IBAction func itemOneQuantityTextFieldDidBeginEditing(_ itemOneQuantityTextField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
        updateSaveButtonState()
    }
    
    @IBAction func itemOneQuantityTextFieldDidEndEditing(_ itemOneQuantityTextField: UITextField) {
        updateSaveButtonState()

    }
    

    
}

//Close keyboard when tap occurs
extension FootprintTableViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
