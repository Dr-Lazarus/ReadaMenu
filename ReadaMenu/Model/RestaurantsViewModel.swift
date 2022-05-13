//
//  RestaurantsViewModel.swift
//  ReadaMenu
//
//  Created by Luah Shi Hui on 6/5/22.
//

import SwiftUI
import Firebase
//import FirebaseFirestoreSwift

class getRestaurants: ObservableObject{
    
    @Published var restaurants = [dataType]()
    
    init(){
        let db = Firestore.firestore()
        
        db.collection("Restaurant").addSnapshotListener { (querySnapshot, error) in
            self.restaurants.removeAll()
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            for i in documents{
                
                let id = i.documentID
                let name = i.get("Name") as! String
                let location = i.get("Location") as! String
                let description = i.get("Description") as! String
                let categories = i.get("Menu Categories") as? Array<String>
                
                if ((categories != nil) && (!categories!.isEmpty)){
                    self.restaurants.append(dataType(id: id, name: name, location: location, description: description, categories: categories!))
                }
            }
            
        }
    }
}

//https://stackoverflow.com/questions/68712919/fetch-nested-array-firebase-swiftui

struct dataType: Identifiable {
    var id: String?
    var name: String
    var location: String
    var description: String
    var categories: Array<String>
}




 

