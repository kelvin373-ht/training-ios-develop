//
//  ContentView.swift
//  RegisterRxSwift
//
//  Created by Kelvin HT on 11/17/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View {
        VStack {
            Text("Registration Form")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            
            VStack(alignment: .leading) {
                Text("Name")
                    .font(.headline)
                    .bold()
                TextField("Enter your name...", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Email")
                    .font(.headline)
                    .bold()
                TextField("Enter your email...", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Password")
                    .font(.headline)
                    .bold()
                TextField("Enter your password...", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Confirm Password")
                    .font(.headline)
                    .bold()
                TextField("Enter your confirm password...", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    print("Success Sign In")
                    print("\(self.name) \(self.email)")
                }) {
                    HStack {
                        Text("Sign In")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                
            }.frame(minWidth: 0,maxWidth: .infinity)
            .padding(EdgeInsets(top: 30, leading: 10, bottom: 0, trailing: 10))
                
        }.frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
