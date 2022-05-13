//
//  getItemCost.swift
//  ReadaMenu
//
//  Created by Ryan Pan Tang Kai on 13/5/22.
//

import Foundation
import Firebase
import SwiftUI

class getItemCost: ObservableObject {
    
    var cost: String = ""
    var itemCost: String = ""
    
    init(itemCost: String){
        self.cost = itemCost
        self.itemCost = "$" + self.cost
    }
}
