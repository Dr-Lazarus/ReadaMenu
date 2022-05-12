//
//  BrowseDishes.swift
//  ReadaMenu
//
//  Created by Luah Shi Hui on 8/5/22.
//

import SwiftUI

struct BrowseDishes: View {
    var restaurantName: String
    var categoryName: String
    @ObservedObject var dishes = getDish(restaurantName: "", categoryName: "")
    
    init(restaurantName: String, categoryName: String) {
        self.restaurantName = restaurantName
        self.categoryName = categoryName
        dishes = getDish(restaurantName: restaurantName, categoryName: categoryName)
    }
    
    var body: some View {
        List{
            ForEach(self.dishes.dishes) { element in
                VStack(alignment: .leading) {
                    Text(element.itemName).font(.title).bold()
                    Spacer()
                    Text(element.itemCost).font(.subheadline).bold()
                    Spacer()
                    Text(element.itemDescription).font(.subheadline)
                }.padding()
                
            }
        }
        .navigationTitle(categoryName)
        .navigationBarTitleDisplayMode(.inline)
        .offset(x: 0, y: -30)
    }
}

//struct BrowseDishes_Previews: PreviewProvider {
//    static var previews: some View {
//        BrowseDishes(restaurantName: restaurantName, categoryName: String)
//    }
//}
