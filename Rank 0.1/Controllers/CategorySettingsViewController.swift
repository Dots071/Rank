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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var subCategories = ["R&D", "Sales", "Finanace"]
       var customFields = ["LinkedProfile", "GitHub", "Skype"]
       var rankParameters = ["Price", "Service", "Size"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Category Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        tableView.dataSource = self
           // nameTextField.delegate = self
        
    }
    
    
   
    
    
    @IBAction func colorButtonSelected(_ sender: UIButton) {
        
        if sender.tag == 1 {
            print("Blue")
        } else if sender.tag == 2 {
            print("Teal")
        } else if sender.tag == 3 {
            print("Yellow")
        } else if sender.tag == 4 {
            print("Orange")
        } else {
            print("Red")
        }
        
        
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let newCategory = Category()
                 newCategory.name = nameTextField.text!
               print(newCategory.name)
               delegate?.setCategory(category: newCategory)
               
               // saveCategories(category: newCategory)
               self.dismiss(animated: true, completion: nil)
        
    }
    
    

    
        
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
        
         
    }
    
    @objc func subCategoryAddPressed(_ sender: UIButton) {
        print("subCategoryAddPressed")
    }
    
    @objc func customFieldAddPresse(_ sender: UIButton) {
        print("customFieldAddPressed")

    }
    
    @objc func parameterAddPressed(_ sender: UIButton) {
        print("parameterAddPressed")

    }
    

}

//MARK: - UITableView Data Source Methods

extension CategorySettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if (section == 0) {return subCategories.count}
        if (section == 1) {return customFields.count}
        if (section == 2) {return rankParameters.count}
        
        return 0
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableCell", for: indexPath)
        print(indexPath.row)
        
        
       
        if indexPath.section == 0 {
            
            cell.textLabel?.text = subCategories[indexPath.row]
            
        } else if indexPath.section == 1 {

            cell.textLabel?.text = customFields[indexPath.row]

        } else {

            cell.textLabel?.text = rankParameters[indexPath.row]

        }
        
        return cell
       
    }
    
}

//MARK: - TableView Delegate Methods

extension CategorySettingsViewController: UITableViewDelegate {
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {return "SUB CATEGORIES"}
//        if section == 1 {return "CUSTOM FIELDS"}
//        if section == 2 {return "RANK PARAMETERS"}
//        return ""
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = UIView()

        let frame = tableView.frame

        let title = UILabel()
        title.frame = CGRect(x: frame.minX + 5, y: frame.minY, width: frame.size.width - 50, height: 45)
            title.font = UIFont.systemFont(ofSize: 12)

        if section == 0 {
            title.text = "SUB CATEGORIES"
        }
        if section == 1 {
            title.text = "CUSTOM FIELDS"
        }
        if section == 2 {
            title.text = "RANK PARAMETERS"
        }
//            let addButton = UIButton(frame: CGRect(x: frame.size.width - 50, y: 0, width: 50, height: 45))
//            addButton.setImage(UIImage(systemName: "plus"), for: .normal)
//            addButton.addTarget(self, action: #selector(parameterAddPressed(_:)), for: .touchUpInside)
//            addButton.tag = section
//
//            view.addSubview(title)
//            view.addSubview(addButton)

        

        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return 45
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
