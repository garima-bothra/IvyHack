//
//  FirebaseNetworking.swift
//  IvyHacks
//
//  Created by Garima Bothra on 02/10/20.
//

import Foundation
import Firebase

internal func getUID() -> String {
    let uid = Auth.auth().currentUser?.uid
    return uid ?? "notFound"
}

internal func getEmail() -> String {
    let userEmail = Auth.auth().currentUser?.email
    return userEmail ?? "notFound"
}

class FirebaseNetworking {
    static let shared = FirebaseNetworking()
    let database = Database.database().reference()
    let myUID = getUID()

    init() {
        let connectedRef = Database.database().reference(withPath: ".info/connected")
        connectedRef.observe(.value, with: { snapshot in
            if let connected = snapshot.value as? Bool , connected {
                // internet connected
                // later banner alert will be added
                print("Connected")
            } else {
                // internet disconnected
                // banner alert
                print("FUCK")
                self.database.removeAllObservers()
            }
        })
    }
    // deinitializing class
    deinit {
        // remove all observer to free memory
        self.database.removeAllObservers()
    }

    //MARK: - Function to update company name
    public func updateName(phone: String,name: String,completion: @escaping (Bool) -> ()) {
        let ref = database.child("users").child(getUID())
        ref.updateChildValues(["name" : name])
        {
            (error:Error?, database:DatabaseReference) in
            if let error = error { // Error Handling

                completion(false)
            } else {

                completion(true)  // Completion handler
            }
        }
        ref.updateChildValues(["phone" : phone])
        {
            (error:Error?, database:DatabaseReference) in
            if let error = error { // Error Handling

                completion(false)
            } else {

                completion(true)  // Completion handler
            }
        }
    }
}
