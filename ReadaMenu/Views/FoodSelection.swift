//
//  FoodSelection.swift
//  ReadaMenu
//
//  Created by Ryan Pan Tang Kai on 13/5/22.
//
import SwiftUI

struct FoodSelection: View {
    @Binding var selection: [dishDataType]
    
    init(selection: Binding<[dishDataType]>) {
        _selection = selection
    }
    
    var body: some View {
        VStack {
            List{
                ForEach(self.selection){ element in
                    Button(action: {
                        selection.removeAll{$0 == element}
                    }) {
                        VStack(alignment: .leading) {
                            Text(element.itemName).font(.title).bold().foregroundColor(.black)
                            Spacer()
                            Text(getItemCost(itemCost: element.itemCost).itemCost).font(.subheadline).bold().foregroundColor(.black)
                            Spacer()
                            Text(element.itemDescription).font(.subheadline).foregroundColor(.black)
                        }.padding()
                    }
                }
            }.padding()
        
            Text(getTotal(selection: $selection).totalCost)
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
        
        }.navigationTitle("Selected Food Items")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(UIColor.systemGray6))
        
    }
}
