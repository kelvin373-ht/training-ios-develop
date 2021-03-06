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
    
    @ObservedObject private var dataMembers = PlayCoreData()
    @FetchRequest(entity: Member.entity(), sortDescriptors: []) var members: FetchedResults<Member>
    
    @State private var nameMember = ""
    @State private var aboutMember = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Input Your Name")) {
                    HStack {
                        VStack {
                            TextField("Name", text: self.$nameMember)
                            TextField("About", text: self.$aboutMember)
                        }
                        
                        Button(action: {
                            self.dataMembers.addNewData(id: UUID(), name: self.nameMember, aboutName: self.aboutMember)
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                
                ForEach(members, id: \.id) { member in
                    VStack {
                        Text(member.name ?? "Unknown")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        
                        Text(member.about ?? "Unknown")
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundColor(Color.black)
                    }
                }.onDelete(perform: { (index) in
                    for x in index {
                      let member = self.members[x]
                      if let id = member.id {
                        self.dataMembers.deleteData(id: id)
                      }
                    }
                })
            }
            .navigationBarTitle(Text("My Fans"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
