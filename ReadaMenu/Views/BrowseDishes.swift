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
    @Binding var selection: [dishDataType]
    
    init(restaurantName: String, categoryName: String, selection: Binding<[dishDataType]>) {
        self.restaurantName = restaurantName
        self.categoryName = categoryName
        dishes = getDish(restaurantName: restaurantName, categoryName: categoryName)
        _selection = selection
    }
    
    var body: some View {
        List{
            ForEach(self.dishes.dishes) { element in
                Button(action: {
                    selection.append(dishDataType(id: UUID().uuidString
                                                  , itemCost: element.itemCost
                                                  , itemName: element.itemName
                                                  , itemDescription: element.itemDescription))
                })
                {
                    VStack(alignment: .leading) {
                        Text(element.itemName).font(.title).bold().foregroundColor(.black)
                        Spacer()
                        Text(getItemCost(itemCost: element.itemCost).itemCost).font(.headline).bold().foregroundColor(.black)
                        Spacer()
                        Text(element.itemDescription).font(.callout).foregroundColor(.black)
                    }.padding()
                    .accessibilityElement(children: .combine)
                }.accessibilityHint(add_string(itemName: element.itemName))
                   
            
            }.listRowInsets(.init(top: 50, leading: 50, bottom: 50, trailing: 50))
        }.background(Color(.systemGray6))
        .navigationTitle(categoryName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

func add_string(itemName: String) -> String {
    let add_item: String = "Double clicking this button will add " + itemName + " to selection."
    return add_item
}


