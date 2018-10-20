//
//  EditProfileTableViewController.swift
//  Plasticless
//
//  Created by Paolo Di Grazia on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//


import UIKit

class EditProfileTableViewController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  
  @IBOutlet weak var editProfileImageUIImageView: UIImageView!
  @IBOutlet weak var editAddressOneUITextField: UITextField!
  @IBOutlet weak var fullnameLabel: UITextField!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    editProfileImageUIImageView.layer.masksToBounds = true
    editProfileImageUIImageView.layer.cornerRadius = 90
    
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
    editProfileImageUIImageView.isUserInteractionEnabled = true
    editProfileImageUIImageView.addGestureRecognizer(tapGestureRecognizer)
    
    setupView()
  }
  
  func setupView() {
    let defaults = UserDefaults.standard
    if let savedUser = defaults.object(forKey: "SavedUser") as? Data {
      let decoder = JSONDecoder()
      if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
        fullnameLabel.text = loadedUser.fullname
        editAddressOneUITextField.text = loadedUser.address
        
        editProfileImageUIImageView.image = UIImage(data: loadedUser.image)
      }
    }
  }
  
  @objc func imageTapped() {
    let picker = UIImagePickerController()
    picker.allowsEditing = true
    picker.delegate = self
    present(picker, animated: true)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    var newImage: UIImage
    
    if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      newImage = possibleImage
    } else {
      return
    }
  
    editProfileImageUIImageView.image = newImage
    
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func saveProfileUserDataUIButton(_ sender: Any) {
    if let imageData = editProfileImageUIImageView.image?.pngData(), let fullname = fullnameLabel.text, let address = editAddressOneUITextField.text {
      
      let user = User(image: imageData, fullname: fullname, address: address)
      
      let encoder = JSONEncoder()
      if let encoded = try? encoder.encode(user) {
        let defaults = UserDefaults.standard
        defaults.set(encoded, forKey: "SavedUser")
        
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
      }
    }
  }
  
}
