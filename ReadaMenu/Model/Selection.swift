//
//  Selection.swift
//  ReadaMenu
//
//  Created by Ryan Pan Tang Kai on 13/5/22.
//

import Foundation
import Firebase
import SwiftUI

class getTotal: ObservableObject {
    
    @Binding var selection: [dishDataType]
    var total: Double = 0.0
    
    init(selection: Binding<[dishDataType]>){
        _selection = selection
        
        for item in self.selection {
            total += (item.itemCost as NSString).doubleValue
            print(total)
        }
    }
}


 

