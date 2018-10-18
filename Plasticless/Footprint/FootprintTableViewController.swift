//
//  FootprintTableViewController.swift
//  Plasticless
//
//  Created by Luigi Barretta on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class FootprintTableViewController: UITableViewController, UITextFieldDelegate
{
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
  
  var itemsObj: [PlasticItem] = []
  
  
  override func viewDidLoad() {
    saveButton.isEnabled = false
    setupView()
    hideKeyboardWhenTappedAround()
    updateSaveButtonState()
    
    itemOneQuantityTextField.delegate = self
    itemTwoQuantityTextField.delegate = self
    itemThreeQuantityTextField.delegate = self
    itemFourQuantityTextField.delegate = self

    super.viewDidLoad()
    
  }
  
  func setupView() {
    var namesCollection: [UILabel] = [itemOneNameLabel, itemTwoNameLabel, itemThreeNameLabel, itemFourNameLabel]
    var quantitiesCollection: [UITextField] = [itemOneQuantityTextField, itemTwoQuantityTextField, itemThreeQuantityTextField, itemFourQuantityTextField]
    
    self.itemsObj = GenericDecoder.decodeFromFile(withName: "PlasticItems") ?? []
    
    for (index, item) in self.itemsObj.enumerated() {
      
      namesCollection[index].text = item.name
      
      quantitiesCollection[index].text = "\(item.quantity)"
    }
    
  }
  
  
  @IBAction func saveButtonOnClick(_ sender: Any) {
  }
  
  // Enable the Save button only if the text field has a valid  name.
  private func updateSaveButtonState() {
    // Disable the Save button if the text field is empty.
    let text1 = itemOneQuantityTextField.text ?? ""
    let text2 = itemTwoQuantityTextField.text ?? ""
    let text3 = itemThreeQuantityTextField.text ?? ""
    let text4 = itemFourQuantityTextField.text ?? ""
    
    if (text1.isEmpty || text2.isEmpty || text3.isEmpty || text4.isEmpty){
      saveButton.isEnabled = false
    } else {
      saveButton.isEnabled = true
    }
    
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let currentText = textField.text ?? ""
    guard let stringRange = Range(range, in: currentText) else { return false }
    
    let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
    print("test")
    updateSaveButtonState()
    return updatedText.count <= 3
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
