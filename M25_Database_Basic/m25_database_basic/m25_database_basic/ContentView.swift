//
//  ContentView.swift
//  m25_database_basic
//
//  Created by Kelvin HT on 8/7/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var member:[NSManagedObject] = []
    @State var newMemberString = ""
    
    var body: some View {
        Text("Hello, World!")
    }
    
    func addNewData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Member", in: managedContext)!
        
        let newMember = NSManagedObject(entity: entity, insertInto: managedContext)
        
        newMember.setValue(1, forKeyPath: "id")
        newMember.setValue("Kelvin Herwanda Tandrio", forKeyPath: "name")
        newMember.setValue("Android and iOS Developer", forKeyPath: "about")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
