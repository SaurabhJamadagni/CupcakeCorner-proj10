//
//  Order.swift
//  CupcakeCorner
//
//  Created by Saurabh Jamadagni on 29/08/22.
//

import SwiftUI

class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case type, qunatity, hasSpecialRequest, hasExtraFrosting, wantsSprinkles, name, streetAddress, city, zip
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    @Published var hasSpecialRequest = false {
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
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .qunatity)
        try container.encode(hasSpecialRequest, forKey: .hasSpecialRequest)
        try container.encode(hasExtraFrosting, forKey: .hasExtraFrosting)
        try container.encode(wantsSprinkles, forKey: .wantsSprinkles)
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .qunatity)
        hasSpecialRequest = try container.decode(Bool.self, forKey: .hasSpecialRequest)
        hasExtraFrosting = try container.decode(Bool.self, forKey: .hasExtraFrosting)
        wantsSprinkles = try container.decode(Bool.self, forKey: .wantsSprinkles)
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
    // Empty initializer because otherwise we can't create an empty order.
    // Empty order required at the start of the app.
    init() { }
}
