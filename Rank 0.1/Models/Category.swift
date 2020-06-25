//
//  CategoryModel.swift
//  Rank 0.1
//
//  Created by Océane Nicolle on 02/06/2020.
//  Copyright © 2020 Océane Nicolle. All rights reserved.
//

import UIKit
import RealmSwift


class Category: Object {
    @objc dynamic var name: String = ""
    
    let contacts = List<Contact>()
}
