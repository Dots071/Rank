//
//  Contact.swift
//  Rank 0.1
//
//  Created by Océane Nicolle on 21/06/2020.
//  Copyright © 2020 Océane Nicolle. All rights reserved.
//

import UIKit
import RealmSwift


class Contact: Object {
    @objc dynamic var name: String = ""
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "contacts")
}
