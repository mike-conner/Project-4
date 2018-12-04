//
//  Enumerations.swift
//  Project-4
//
//  Created by Mike Conner on 12/3/18.
//  Copyright © 2018 Mike Conner. All rights reserved.
//

enum EntrantType {
    case guest
    case employee
    case manager
    case defaultValue
}

enum GuestType {
    case classicGuest
    case vipGuest
    case freeChildGuest
}

enum EmployeeType {
    case foodServices
    case rideServices
    case maintenance
    case maanager
}

enum AreaAccess {
    case amusementArea
    case KitchenArea
    case rideControlArea
    case maintenanceArea
    case officeArea
    case defaultValue
}

enum RideAccess {
    case canNotSkipLines
    case canSkipLines
    case defaultValue
}

enum Discount {
    case food
    case merchandise
    case defaultValue
}

enum PersonalInformation {
    case firstName
    case lastName
    case company
    case streetAddress
    case city
    case state
    case zipCode
    case SSN
    case dateOfBirth
    case managementTier
    case defaultValue
}

enum ManagementTier {
    case shiftManager
    case generalManager
    case seniorManager
}


