//
//  ContactViewController.swift
//  Rank 0.1
//
//  Created by Océane Nicolle on 21/06/2020.
//  Copyright © 2020 Océane Nicolle. All rights reserved.
//

import UIKit
import RealmSwift

class ContactViewController: UIViewController {
    
    let realm = try! Realm()

    @IBOutlet weak var tableView: UITableView!
    
    var contactsArray: Results<Contact>?
    
    var selectedCategory: Category? {
        didSet {
            print("self.selectedCategory")
            loadContacts()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = selectedCategory?.name
               navigationController?.navigationBar.prefersLargeTitles = true
               navigationItem.largeTitleDisplayMode = .always
     
        tableView.register(UINib(nibName: K.contactCellNib, bundle: nil), forCellReuseIdentifier: K.contactCellIdentifier)
        
        
        
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let editProfileView = EditProfileView()
        let navController = NavigationController(rootViewController: editProfileView)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
    
    
    
    func loadContacts() {
         
      //  if let safeContacts =
            
            contactsArray = selectedCategory?.contacts.sorted(byKeyPath: "name", ascending: true)
           if contactsArray?.first != nil {
                 tableView.reloadData()
            }
            
        
         
        
     }
    
    
    

}


extension ContactViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactsArray?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.contactCellIdentifier, for: indexPath) as! ContactCell
        if let contact = contactsArray?[indexPath.row] {
            
            cell.contactNameLabel.text = contact.name
            
        } else {
            cell.contactNameLabel.text = "No Contacts"
        }
            
               return cell
    }
    
    
    
    
}
