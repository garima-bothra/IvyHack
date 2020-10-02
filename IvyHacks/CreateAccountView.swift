//
//  CreateAccountView.swift
//  IvyHacks
//
//  Created by Garima Bothra on 02/10/20.
//

import SwiftUI
import Firebase

struct CreateAccountView: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        GeometryReader { geometry in
            ZStack
            {
                Color.primaryColor
                    .ignoresSafeArea()
                VStack {
                    Text("Create Account")
                        .font(.largeTitle)
                        .bold()
                    Text("Welcome, Create a new profile to continue!")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                    Spacer()
                        .frame(height: geometry.size.height/6)
                    TextField("Email", text: $email)
                        .padding([.leading, .trailing])
                    Rectangle()
                        .frame(height: 1.0 ,alignment: .bottom)
                        .foregroundColor(Color.gray)
                        .padding([.leading, .trailing])
                    TextField("Password", text: $password)
                        .padding([.leading, .trailing])
                    Rectangle()
                        .frame(height: 1.0 ,alignment: .bottom)
                        .foregroundColor(Color.gray)
                        .padding([.leading, .trailing])
                    Spacer()
                        .frame(height: geometry.size.height/6)
                    NavigationLink(destination: AccountDetailsView()) {
                    Button(action: {
                        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                          // ...
                        }
                    }) {
                        Text("NEXT")
                            .bold()
                            .frame(width: geometry.size.width/2, height: 30)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .background(Color.secondaryColor)
                            .cornerRadius(10)
                    }
                    }
                }
            }
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
