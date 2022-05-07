//
//  RestaurantsViewModel.swift
//  ReadaMenu
//
//  Created by Luah Shi Hui on 6/5/22.
//

import SwiftUI
import Firebase

class getRestaurants: ObservableObject{
    
    @Published var restaurants = [dataType]()
    
    init(){
        let db = Firestore.firestore()
        
        db.collection("Restaurant").getDocuments{ (snap, err) in
            
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documents{
                
                let id = i.documentID
                let name = i.get("Name") as! String
                let location = i.get("Location") as! String
                let description = i.get("Description") as! String
                let categories = i.get("Menu Categories") as! Array<Any>
                
                self.restaurants.append(dataType(id: id, name: name, location: location, description: description, categories: categories))
                //self.restaurants.append(dataType(id: id, name: name, location: location, description: description))
            }
            
        }
    }
}

struct dataType: Identifiable {
    var id: String
    var name: String
    var location: String
    var description: String
    var categories: Array<Any>
}
