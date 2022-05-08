//
//  BrowseCategories.swift
//  ReadaMenu
//
//  Created by Luah Shi Hui on 8/5/22.
//

import SwiftUI

struct BrowseCategories: View {
    
    var restaurant: dataType
    
    var body: some View {
        List{
            ForEach(self.restaurant.categories[0...(self.restaurant.categories.capacity-1)], id: \.self){ category in
                NavigationLink(destination: BrowseDishes()){
                    Text(category).padding()
                }
            }
        }
        .navigationTitle(restaurant.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}


/*
struct BrowseCategories_Previews: PreviewProvider {
    
    static var previews: some View {
        BrowseCategories(restaurant: dataType)
    }
}
 */
 


