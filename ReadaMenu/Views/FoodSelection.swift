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
                        if let index = selection.firstIndex(of: element) {
                            selection.remove(at: index)
                        }
                    }) {
                        VStack(alignment: .leading) {
                            Text(element.itemName).font(.title).bold().foregroundColor(.black)
                            Spacer()
                            Text("$" + element.itemCost).font(.subheadline).bold().foregroundColor(.black)
                            Spacer()
                            Text(element.itemDescription).font(.subheadline).foregroundColor(.black)
                        }.padding()
                        .accessibilityElement(children: .combine)
                    }
                }
            }.padding()
        
            Text("Total Cost: $" + String(describing: String(format: "%.2f",getTotal(selection: $selection).total)))
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
        
        }.navigationTitle("Selected Food Items")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(UIColor.systemGray6))
        
    }
}
