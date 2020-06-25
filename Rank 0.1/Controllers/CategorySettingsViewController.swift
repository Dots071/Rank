//
//  CategorySettingsViewController.swift
//  Rank 0.1
//
//  Created by Océane Nicolle on 08/06/2020.
//  Copyright © 2020 Océane Nicolle. All rights reserved.
//

import UIKit

protocol SetCategoryDelegate {
    func setCategory(category: Category)
}

class CategorySettingsViewController: UIViewController {

    var delegate: SetCategoryDelegate?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

           // nameTextField.delegate = self
        
    }
    
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        let newCategory = Category()
          newCategory.name = nameTextField.text!
        print(newCategory.name)
        delegate?.setCategory(category: newCategory)
        
        // saveCategories(category: newCategory)
        self.dismiss(animated: true, completion: nil)
        
    }
    
        
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
         self.dismiss(animated: true, completion: nil)
    }

}

//MARK: - UITextFieldDelegate Methods

//   extension CategorySettingsViewController: UITextFieldDelegate {
//
//   //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//   //        nameTextField.endEditing(true)
//   //        print(nameTextField.text!)
//   //        return true
//   //    }
//
//
//   }
