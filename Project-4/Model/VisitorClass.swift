//
//  VisitorClass.swift
//  Project-4
//
//  Created by Mike Conner on 12/3/18.
//  Copyright © 2018 Mike Conner. All rights reserved.
//

class Visitor {
    let entrantType: EntrantType
    let areaAccess: [AreaAccess]
    let rideAccess: [RideAccess]
    let discount: [Discount: Int]
    let personalInformation: [PersonalInformation: Any]
    
    init() {
        entrantType = .defaultValue
        areaAccess = [.defaultValue]
        rideAccess = [.defaultValue]
        discount = [.defaultValue: 0]
        personalInformation = [.defaultValue: 0]
    }
    
    init(entrantType: EntrantType, areaAccess: [AreaAccess], rideAccess: [RideAccess], discount: [Discount : Int], personalInformation: [PersonalInformation : Any]) {
        self.entrantType = entrantType
        self.areaAccess = areaAccess
        self.rideAccess = rideAccess
        self.discount = discount
        self.personalInformation = personalInformation
    }
    
    
}


class Guest: Visitor {
    var guestType: GuestType
    
    init(guestType: GuestType) {
        self.guestType = guestType
        super.init()
    }
    
}

class Employee: Visitor {
    var employeeType: EmployeeType
    
    init(employeeType: EmployeeType) {
        self.employeeType = employeeType
        super.init()
    }
}






