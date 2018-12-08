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
        
        
        // create the "visitor" to the park by entering in their information. This will be populated by hitting "submit" on the form.
        let visitor = Visitor(entrantType: .rideServices, personalInformation: [.firstName: "Joey", .lastName: "Smith", .streetAddress: "123 Ave", .city: "Hometown", .state: "FL", .zipCode: "54321", .SSN: "123-45-6789" , .dateOfBirth: "12/5/1988"])
        // check for missing information on the registration by comparing it to the required information based on the entrant type (i.e, classic guest, manager, etc.)
        if (try! visitor.checkRegistrationForErrors(visitor: visitor)) {
            // if no errors, create the pass
            let pass = Pass(visitor: visitor)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .officeArea, forRideAccessTo: .canNotSkipLines, getsDiscountOf: nil)
        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    }
}

