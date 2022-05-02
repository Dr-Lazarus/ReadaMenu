//
//  BrowseRestaurants.swift
//  ReadaMenu
//
//  Created by Luah Shi Hui on 2/5/22.
//

import SwiftUI

struct BrowseRestaurants: View {
    @State var SearchingFor = ""
    let restaurants = [
        "Burger King",
        "Crooked Cooks",
        "Gom Gom",
        "Gong Yuan Mala Tang",
        "Hans",
        "Mac Donalds",
        "Mr Bean",
        "Saizeriya",
        "Stuff'd",
        "Sukiya",
        "Toast Box",
        "Ya Kun"
    ]
    var body: some View {
        List{ //list view
            ForEach(results, id:\.self){
                restaurant in NavigationLink(destination: ContentView()){
                    Text(restaurant)
                        .padding()
                        .accessibility(label: Text(restaurant))
                }
            }
        }.offset(x: 0, y: -30)
            
        .searchable(text: $SearchingFor, placement: .navigationBarDrawer(displayMode: .always)) //search bar
        .navigationTitle("Restaurant List")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    var results: [String]{
        if SearchingFor.isEmpty{
            return restaurants
        } else{
            return restaurants.filter{$0.contains(SearchingFor)} //show matching result
        }
    }
}

struct BrowseRestaurants_Previews: PreviewProvider {
    static var previews: some View {
        BrowseRestaurants()
    }
}
