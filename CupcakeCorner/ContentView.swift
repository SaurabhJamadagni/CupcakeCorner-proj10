//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Saurabh Jamadagni on 22/08/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your base flavour", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special request?", isOn: $order.hasSpecialRequest.animation())
                    
                    if order.hasSpecialRequest {
                        Toggle("Add extra frosting", isOn: $order.hasExtraFrosting)
                        
                        Toggle("Add extra sprinkles", isOn: $order.wantsSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
