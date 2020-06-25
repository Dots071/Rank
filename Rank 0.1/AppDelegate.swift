//
//  AppDelegate.swift
//  Rank 0.1
//
//  Created by Océane Nicolle on 02/06/2020.
//  Copyright © 2020 Océane Nicolle. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
         
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 1, migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                }
            })

        Realm.Configuration.defaultConfiguration = config
       

        do {
            let _ = try Realm()
        } catch {
            print("Error initializing new realm, \(error)")
        }
        
        return true
    }



}
