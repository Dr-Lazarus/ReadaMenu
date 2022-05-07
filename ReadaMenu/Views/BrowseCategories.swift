//
//  BrowseCategories.swift
//  ReadaMenu
//
//  Created by Luah Shi Hui on 6/5/22.
//

import SwiftUI

struct BrowseCategories: View {
    
    @ObservedObject var restaurants = getRestaurants()
    
    var body: some View {
        List{
            //ForEach(0..<50) { i in Text("List of \(i)") }
            ForEach(self.restaurants.restaurants, id: \.id) {
                i in NavigationLink(destination: BrowseCategories()){
                    VStack(alignment: .leading) {
                        Text(i.name).font(.title).bold()
                        }
                    }
                }
        }
        .navigationTitle("Menu Categories")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BrowseCategories_Previews: PreviewProvider {
    static var previews: some View {
        BrowseCategories()
    }
}
