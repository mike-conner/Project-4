//
//  ViewController.swift
//  Project-4
//
//  Created by Mike Conner on 12/3/18.
//  Copyright © 2018 Mike Conner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Create the visitor to the park by entering in their information. This will be populated by hitting "submit" on the form in the next Unit.
        
        print("\rFirst Visitor:\r") // Added for console readability. Prints a "header" for each visitor.
        let firstVisitor = Visitor(entrantType: .classicGuest, personalInformation: [:]) // Create the visitor.
        // Check for missing information on the registration form by comparing it to the required information based on the entrant type (i.e, classic guest, manager, etc.).
        if (try? firstVisitor.checkRegistrationForErrors(visitor: firstVisitor)) != false {
            // If no errors, create the appropriate pass for the visitor.
            let pass = Pass(visitor: firstVisitor)
            // Check to see if the visitor's pass has access to a specific area, if they can skip the ride lines, and/or if they get a discount on either food or merchandise.
            // Only required parameter is the Pass. Other three parameters are option depending on what you want to know.
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, forRideAccessTo: .canNotSkipLines, getsDiscountOnMerchandise: .merchandise)
            // Can visitor access the Amusement Area, can they ride rides/skip lines and do they get merchandise discounts. No personal information was provided.
        }
        
        print("\rSecond Visitor:\r")
        let secondVisitor = Visitor(entrantType: .vipGuest, personalInformation: [.firstName: "Alex", .lastName: "Atchinson", .streetAddress: "222 Ave", .city: "Hometown", .state: "FL", .zipCode: "22222", .SSN: "222-22-2222" , .dateOfBirth: "12/5/1988"])
        if (try? secondVisitor.checkRegistrationForErrors(visitor: secondVisitor)) != false {
            let pass = Pass(visitor: secondVisitor)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, forRideAccessTo: .canNotSkipLines, getsDiscountOnFood: .food, getsDiscountOnMerchandise: .merchandise)
            // Can visitor access the Amusement Area, can they ride rides/skip lines and do they get food and merchandise discounts.
        }
        
        print("\rThird Visitor:\r")
        let thirdVisitor = Visitor(entrantType: .freeChildGuest, personalInformation: [.firstName: "Bob", .lastName: "Benton"]) // Only first and last name provided. Free Child Guest requires birthdate!
        if (try? thirdVisitor.checkRegistrationForErrors(visitor: thirdVisitor)) != false {
            let pass = Pass(visitor: thirdVisitor)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, forRideAccessTo: .canNotSkipLines, getsDiscountOnFood: .food, getsDiscountOnMerchandise: .merchandise)
            // Can visitor access the Amusement Area, can they ride rides/skip lines and do they get food and merchandise discounts.
        }
        
        print("\rFourth Visitor:\r")
        let fourVisitor = Visitor(entrantType: .freeChildGuest, personalInformation: [.firstName: "Chuck", .lastName: "Chilton", .dateOfBirth: "12-05-2015"]) // Same as the third guest but new name and now with birthdate.
        if (try? fourVisitor.checkRegistrationForErrors(visitor: fourVisitor)) != false {
            let pass = Pass(visitor: fourVisitor)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, forRideAccessTo: .canNotSkipLines, getsDiscountOnFood: .food, getsDiscountOnMerchandise: .merchandise)
            // Can visitor access the Amusement Area, can they ride rides/skip lines and do they get food and merchandise discounts.
        }
    
        print("\rFifth Visitor:\r")
        let fifthVisitor = Visitor(entrantType: .foodServices, personalInformation: [.firstName: "Darren", .lastName: "Dillary", .streetAddress: "555 Ave", .city: "Hometown", .state: "FL", .zipCode: "55555", .SSN: "555-55-5555" , .dateOfBirth: "12/5/1988"])
        if (try? fifthVisitor.checkRegistrationForErrors(visitor: fifthVisitor)) != false {
            let pass = Pass(visitor: fifthVisitor)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .kitchenArea, getsDiscountOnFood: .food)
            // Can visitor access the Kitchen Area and do they get food discounts.
        }
        
        print("\rSixth Visitor:\r")
        let sixthVisitor = Visitor(entrantType: .foodServices, personalInformation: [.firstName: "Erika", .lastName: "Edmonds", .streetAddress: "666 Ave", .city: "Hometown", .state: "FL", .SSN: "666-66-6666" , .dateOfBirth: "12/5/1988"]) // Missing required zip code.
        if (try? sixthVisitor.checkRegistrationForErrors(visitor: sixthVisitor)) != false {
            let pass = Pass(visitor: sixthVisitor)
            pass.swipeTheEntrants(pass: pass, forRideAccessTo: .canSkipLines)
            // Can visitor access the Kitchen Area and do they get food discounts.
        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    }
}

