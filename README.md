# Cupcake Corner

This repo is for the project 10 of 100DaysOfSwiftUI by @twostraws.

## Overview

- This project was an introduction to networking in SwiftUI.
- This app takes the order of cupcakes from a user -- the quantity, the flavour, toppings, etc.
- This is followed by asking the user for shipping details followed by checkout.
- At checkout, the app makes a dummy networking call using `reqres.in`.

## Structure of the app

- The app has three main views in it
  - `ContentView` - Starting page. This is where the user makes their choice about the type of cake they want and the quantity.
  - `AddressView` - Page takes shipping details from the user.
  - `CheckoutView` - This page shows the total amount that's payable and holds the button to place the order.
- The data is shared among these three views using the `Order` class.
- This class conforms to the `ObservableObject` and `Codable` protocols.
- As most of the properties in this class are shared among views, they have the `@Published` property wrapper. Thus, a encoding and init to decode is present to conform this class to Codable.
- The meat of the application utilises NavigationLinks to navigate between pages.
- CheckoutView has an `AsyncImage` that retrieves an image from a remote server.

## Learnings

- This app was a great practice in creating multi-page applications.
- Learned about networking and URLRequest, AsyncImages and URLs.
- This project also allowed me to practice encoding and decoding from and to JSON respectively.
- It was a good learning example in understanding how to work with data and simultaneously manage networking calls.

[My 100DaysOfSwiftUI Repo](https://github.com/SaurabhJamadagni/100DaysOfSwiftUI)

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋