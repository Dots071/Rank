//
//  ViewController.swift
//  Rank 0.1
//
//  Created by Océane Nicolle on 02/06/2020.
//  Copyright © 2020 Océane Nicolle. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UIViewController, SetCategoryDelegate  {
    
    let realm = try! Realm()
    
    @IBOutlet weak var tableView: UITableView!
  
    var categories: Results<Category>?
    
    var currentCategory: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let newCategory = Category()
//        newCategory.name = "Family"
//        categories.append(newCategory)
        
        tableView.delegate = self
        tableView.dataSource = self
        title = "Categories"
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        tableView.register(UINib(nibName: K.categoryCellNib, bundle: nil), forCellReuseIdentifier: K.categoryCellIdentifier)

        loadCategories()
        
    }

    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: K.addNewCategoryIdentifier, sender: self)
        
    }

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             if segue.identifier == K.addNewCategoryIdentifier {
                 let addCategoryVC = segue.destination as! CategorySettingsViewController
                 addCategoryVC.delegate = self
                 
             }
             if segue.identifier == K.goToContactsIdentifier {
                 print("segue activated")
                 let destinationVC = segue.destination as! ContactViewController
                 destinationVC.selectedCategory = currentCategory
                 
             }
         }
    
     func setCategory(category: Category) {
    
            print("Delegate Pressed")
    
        saveCategories(category)
                loadCategories()
        
    
           }

         //MARK: - Data Manipulation Methods
    
    func saveCategories(_ category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
            } catch {
                print("Error saving categories to data \(error)")
            }
        }
    
    func loadCategories() {
        
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }

}

    

extension CategoryViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.categoryCellIdentifier, for: indexPath) as! CategoryCell
        
        cell.categoryName.text = categories?[indexPath.row].name ?? "No Categories Added Yet"
        
        return cell
        
    }
    
    
}

//extension CategoryViewController: SetCategoryDelegate {
//
//
//
//}


extension CategoryViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if categories?[indexPath.row] != nil {
            
            currentCategory = categories?[indexPath.row]
        
            performSegue(withIdentifier: K.goToContactsIdentifier, sender: self)
            
        }
            
            
//        do {
//            try realm.write{
//                realm.delete(category)
//            }
//        } catch {
//            print("Error Deleting Category, \(error)")
//        }
//
//        }
//
//        tableView.reloadData()
    }
    
   
}
