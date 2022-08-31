//
//  Order.swift
//  CupcakeCorner
//
//  Created by Saurabh Jamadagni on 29/08/22.
//

import SwiftUI

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    @Published var hasSpecialRequest = true {
        // Required so that these revert back to false when special request is toggled off.
        didSet {
            if !hasSpecialRequest {
                hasExtraFrosting = false
                wantsSprinkles = false
            }
        }
    }
    @Published var hasExtraFrosting = false
    @Published var wantsSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    
    var cost: Double {
        var cost = Double(quantity) * 2
        
        // Price increase a little bit as the type of cake goes up the array
        cost += Double(type) / 2
        
        if hasExtraFrosting {
            cost += Double(quantity)
        }
        
        if wantsSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}
