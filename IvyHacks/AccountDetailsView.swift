//
//  AccountDetailsView.swift
//  IvyHacks
//
//  Created by Garima Bothra on 02/10/20.
//

import SwiftUI

struct AccountDetailsView: View {
    @State var name: String = ""
    @State var phone: String = ""
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
                    TextField("Name", text: $name)
                        .padding([.leading, .trailing])
                    Rectangle()
                        .frame(height: 1.0 ,alignment: .bottom)
                        .foregroundColor(Color.gray)
                        .padding([.leading, .trailing])
                    TextField("Phone Number", text: $phone)
                        .padding([.leading, .trailing])
                    Rectangle()
                        .frame(height: 1.0 ,alignment: .bottom)
                        .foregroundColor(Color.gray)
                        .padding([.leading, .trailing])
                    Spacer()
                        .frame(height: geometry.size.height/6)
                    Button(action: {
                        FirebaseNetworking.shared.updateName(phone: phone, name: name, completion: {_ in })
                    }) {
                        Text("SIGN UP")
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

struct AccountDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailsView()
    }
}
