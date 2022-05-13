//
//  BrowseCategories.swift
//  ReadaMenu
//
//  Created by Luah Shi Hui on 8/5/22.
//

import SwiftUI

struct BrowseCategories: View {
    
    var restaurant: dataType
    @State var selection: [dishDataType] = []
    @State var viewSelection: Bool = false
    
    init(restaurant: dataType) {
        self.restaurant = restaurant
        self.selection.removeAll()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                List{
                    ForEach(self.restaurant.categories, id: \.self){ category in
                        NavigationLink(destination: BrowseDishes(
                            restaurantName: self.restaurant.name,
                            categoryName: category,
                            selection: $selection
                        )){
                            Text(category).padding()
                        }
                    }
                }.frame(height:geometry.size.height * 0.80)
                    .padding(.top, 1)
                
                NavigationLink(destination: FoodSelection(selection: $selection), isActive: $viewSelection) { EmptyView() }

                Button(action:{
                    self.viewSelection = true
                }) {
                    Text("View Selection")
                        .font(Font.system(size: geometry.size.width*0.05))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black).padding(20).padding([.horizontal], 100)
                        .background(Rectangle().cornerRadius(10).foregroundColor(.yellow))
                }.frame(height:geometry.size.height * 0.20, alignment: .top)
                    .padding()
            }
        }.navigationTitle(restaurant.name)
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(UIColor.systemGray6))
            
    }
}

/*
struct BrowseCategories_Previews: PreviewProvider {
    
    static var previews: some View {
        BrowseCategories(restaurant: dataType)
    }
}
 */
 


