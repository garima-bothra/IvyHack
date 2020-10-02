//
//  LoginView.swift
//  IvyHacks
//
//  Created by Garima Bothra on 02/10/20.
//

import SwiftUI
import Firebase

struct LoginView: View {

    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        GeometryReader { geometry in
            ZStack
            {
                Color.primaryColor
                    .ignoresSafeArea()
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                    Text("Welcome back! Sign In to continue")
                        .foregroundColor(.gray)
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
                    Button(action: {
                        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                            print("error: \(error)")
                          // ...
                        }
                    }) {
                        Text("SIGN IN")
                            .bold()
                            .frame(width: geometry.size.width/2, height: 30)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .background(Color.secondaryColor)
                            .cornerRadius(10)
                    }
                    NavigationLink(destination: CreateAccountView()) {
                        Text("Don't have an account? ")
                            .font(.system(size: 12))
                            .foregroundColor(.gray) + Text("Create account")
                            .bold()
                            .font(.system(size: 12))
                            .foregroundColor(.secondaryColor)
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
