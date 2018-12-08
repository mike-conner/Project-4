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
        
        
        // Create the "visitor" to the park by entering in their information. This will be populated by hitting "submit" on the form in the next Unit.
        let visitor = Visitor(entrantType: .foodServices, personalInformation: [.firstName: "Joey", .lastName: "Smith", .streetAddress: "123 Ave", .city: "Hometown", .state: "FL", .zipCode: "54321", .SSN: "123-45-6789" , .dateOfBirth: "12/5/1988"])
        // Check for missing information on the registration form by comparing it to the required information based on the entrant type (i.e, classic guest, manager, etc.).
        if (try? visitor.checkRegistrationForErrors(visitor: visitor)) != false {
            // If no errors, create the appropriate pass for the visitor.
            let pass = Pass(visitor: visitor)
            // Check to see if the visitor's pass has access to a specific area, if they can skip the ride lines, and/or if they get a discount on either food or merchandise.
            // Only required parameter is the Pass. Other three parameters are option depending on what you want to know.
            pass.swipeTheEntrants(pass: pass, forAccessTo: .officeArea, forRideAccessTo: .canNotSkipLines,  getsDiscountOn: .merchandise)
        }
        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    }
}

