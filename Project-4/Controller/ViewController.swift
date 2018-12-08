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
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, toSkipLines: true, getsDiscountOnMerchandise: .merchandise)
            // Can visitor access the Amusement Area, can they ride rides/skip lines and do they get merchandise discounts. No personal information was provided.
        }
        
        print("\rSecond Visitor:\r")
        let secondVisitor = Visitor(entrantType: .vipGuest, personalInformation: [.firstName: "Alex", .lastName: "Atchinson", .streetAddress: "222 Ave", .city: "Hometown", .state: "FL", .zipCode: "22222", .SSN: "222-22-2222" , .dateOfBirth: "12/5/1988"])
        if (try? secondVisitor.checkRegistrationForErrors(visitor: secondVisitor)) != false {
            let pass = Pass(visitor: secondVisitor)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, toSkipLines: true, getsDiscountOnFood: .food, getsDiscountOnMerchandise: .merchandise)
            // Can visitor access the Amusement Area, can they ride rides/skip lines and do they get food and merchandise discounts.
        }
        
        print("\rThird Visitor:\r")
        let thirdVisitor = Visitor(entrantType: .freeChildGuest, personalInformation: [.firstName: "Bob", .lastName: "Benton"]) // Only first and last name provided. Free Child Guest requires birthdate!
        if (try? thirdVisitor.checkRegistrationForErrors(visitor: thirdVisitor)) != false {
            let pass = Pass(visitor: thirdVisitor)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, toSkipLines: true, getsDiscountOnFood: .food, getsDiscountOnMerchandise: .merchandise)
            // Can visitor access the Amusement Area, can they ride rides/skip lines and do they get food and merchandise discounts.
        }
        
        print("\rFourth Visitor:\r")
        let fourVisitor = Visitor(entrantType: .freeChildGuest, personalInformation: [.firstName: "Chuck", .lastName: "Chilton", .dateOfBirth: "12-05-2015"]) // Same as the third guest but new name and now with birthdate.
        if (try? fourVisitor.checkRegistrationForErrors(visitor: fourVisitor)) != false {
            let pass = Pass(visitor: fourVisitor)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, toSkipLines: true, getsDiscountOnFood: .food, getsDiscountOnMerchandise: .merchandise)
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
            pass.swipeTheEntrants(pass: pass, toSkipLines: true)
            // Can visitor skip lines.
        }
    
        print("\rSeventh Visitor:\r")
        let seventhVisitor = Visitor(entrantType: .foodServices, personalInformation: [.firstName: "Francis", .lastName: "Fredrickson", .streetAddress: "777 Ave", .city: "Hometown", .state: "FL", .zipCode: "77777", .SSN: "777-77-7777" , .dateOfBirth: "12/5/1988"]) // Same as above but new name and with zipcode.
        if (try? seventhVisitor.checkRegistrationForErrors(visitor: seventhVisitor)) != false {
            let pass = Pass(visitor: seventhVisitor)
            pass.swipeTheEntrants(pass: pass, toSkipLines: true)
            // Can visitor skip lines.
        }
    
        print("\rEighth Visitor:\r")
        let eighthVisitor = Visitor(entrantType: .rideServices, personalInformation: [.firstName: "George", .lastName: "Grafton", .streetAddress: "888 Ave", .city: "Hometown", .state: "FL", .zipCode: "88888", .dateOfBirth: "12/5/1988"]) // Missing required SSN
        if (try? eighthVisitor.checkRegistrationForErrors(visitor: eighthVisitor)) != false {
            let pass = Pass(visitor: eighthVisitor)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, toSkipLines: true, getsDiscountOnFood: .food, getsDiscountOnMerchandise: .merchandise)
            // Can visitor access the Amusement Area, can they ride rides/skip lines and do they get food and merchandise discounts.
        }
        
        print("\rNineth Visitor:\r")
        let ninethVisitor = Visitor(entrantType: .maintenance, personalInformation: [.firstName: "Henrietta", .lastName: "Hopper", .streetAddress: "999 Ave", .city: "Hometown", .state: "FL", .zipCode: "99999", .SSN: "999-99-9999", .dateOfBirth: "12/5/1988"])
        if (try? ninethVisitor.checkRegistrationForErrors(visitor: ninethVisitor)) != false {
            let pass = Pass(visitor: ninethVisitor)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, toSkipLines: true, getsDiscountOnFood: .food, getsDiscountOnMerchandise: .merchandise)
            // Can visitor access the Amusement Area, can they ride rides/skip lines and do they get food and merchandise discounts.
        }
    
        print("\rTenth Visitor:\r")
        let tenthVisitor = Visitor(entrantType: .manager, personalInformation: [.firstName: "Isaac", .lastName: "Iglesias", .streetAddress: "000 Ave", .city: "Hometown", .state: "FL", .zipCode: "00000", .SSN: "000-00-0000", .dateOfBirth: "12/5/1988"]) // Missing Managerment Tier
        if (try? tenthVisitor.checkRegistrationForErrors(visitor: tenthVisitor)) != false {
            let pass = Pass(visitor: tenthVisitor)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .officeArea, getsDiscountOnFood: .food, getsDiscountOnMerchandise: .merchandise)
            // Can visitor access the Office Area and do they get food and merchandise discounts.
        }
    
        print("\rEleventh Visitor:\r")
        let eleventhVisitor = Visitor(entrantType: .manager, personalInformation: [.firstName: "Jared", .lastName: "Jackson", .streetAddress: "000 Ave", .city: "Hometown", .state: "FL", .zipCode: "00000", .SSN: "000-00-0000", .dateOfBirth: "12/5/1988", .managementTier: "Shift Manager"]) // Same as above but now with a Management Tier of "Shift Manager"
        if (try? eleventhVisitor.checkRegistrationForErrors(visitor: eleventhVisitor)) != false {
            let pass = Pass(visitor: eleventhVisitor)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .officeArea, getsDiscountOnFood: .food, getsDiscountOnMerchandise: .merchandise)
            // Can visitor access the Office Area and do they get food and merchandise discounts.
        }
        
    
    
    
    
    }
}

