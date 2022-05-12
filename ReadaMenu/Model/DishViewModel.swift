//
//  DishViewModel.swift
//  ReadaMenu
//
//  Created by Ryan Pan Tang Kai on 12/5/22.
//

import Foundation
import Firebase

class getDish: ObservableObject {
    
    @Published var dishes = [dishDataType]()
    var restaurantname: String
    var categoryname: String
    
    init(restaurantName: String, categoryName: String){
        let db = Firestore.firestore()
        self.restaurantname = restaurantName
        self.categoryname = categoryName
        
        db.collection("Menu")
            .whereField("restaurantName", isEqualTo: restaurantName)
            .whereField("categoryName", isEqualTo: categoryName)
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                for i in documents{
                    let categoryItem = i.get("categoryItem") as! Array<[String:String]>
                    
                    for item in categoryItem {
                        self.dishes.append(dishDataType(id: UUID().uuidString
                                                        , itemCost: item["itemCost"] ?? ""
                                                        , itemName: item["itemName"] ?? ""
                                                        , itemDescription: item["itemDescription"] ?? ""))
                    }
                    
                }
            }

    }
}

//https://stackoverflow.com/questions/68712919/fetch-nested-array-firebase-swiftui

struct dishDataType : Identifiable{
    var id: String
    var itemCost: String
    var itemName: String
    var itemDescription: String
}

struct categoryList: Identifiable {
    var id: String
    var categoryItem: Array<dishDataType>
    var restaurantName: String
    var categoryName: String
}


