//
//  Visitor.swift
//  Project-4
//
//  Created by Mike Conner on 12/7/18.
//  Copyright © 2018 Mike Conner. All rights reserved.
//


// List the different types of visitors
enum EntrantType {
    case classicGuest
    case vipGuest
    case freeChildGuest
    case foodServices
    case rideServices
    case maintenance
    case manager
}

// List the personal information that may be asked on the registration form.
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
}

// List the different errors that are possible from missing data on the registration form.
enum RegistrationError: Error {
    case missingFirstName
    case missingLastName
    case missingStreetAddress
    case missingCity
    case missingState
    case missingZipCode
    case missingSSN
    case missingDateOfBirth
    case missingManagementTier
}

protocol SetUpVisitor {
    var entrantType: EntrantType { get }
    var personalInformation: [PersonalInformation: Any] { get }
}

struct Visitor: SetUpVisitor {
    let entrantType: EntrantType
    let personalInformation: [PersonalInformation: Any]
    
    func checkRegistrationForErrors(visitor: Visitor) throws -> Bool {
        do {
            switch visitor.entrantType {
            case .classicGuest, .vipGuest:
                // no required information
                return true
            case .freeChildGuest:
                if visitor.personalInformation[.dateOfBirth] == nil { throw RegistrationError.missingDateOfBirth }
                return true
            case .foodServices, .rideServices, .maintenance:
                if visitor.personalInformation[.firstName] == nil { throw RegistrationError.missingFirstName }
                if visitor.personalInformation[.lastName] == nil { throw RegistrationError.missingLastName }
                if visitor.personalInformation[.streetAddress] == nil { throw RegistrationError.missingStreetAddress }
                if visitor.personalInformation[.city] == nil { throw RegistrationError.missingCity }
                if visitor.personalInformation[.state] == nil { throw RegistrationError.missingState }
                if visitor.personalInformation[.zipCode] == nil { throw RegistrationError.missingZipCode }
                if visitor.personalInformation[.SSN] == nil { throw RegistrationError.missingSSN }
                if visitor.personalInformation[.dateOfBirth] == nil { throw RegistrationError.missingDateOfBirth }
                return true
            case .manager:
                if visitor.personalInformation[.firstName] == nil { throw RegistrationError.missingFirstName }
                if visitor.personalInformation[.lastName] == nil { throw RegistrationError.missingLastName }
                if visitor.personalInformation[.streetAddress] == nil { throw RegistrationError.missingStreetAddress }
                if visitor.personalInformation[.city] == nil { throw RegistrationError.missingCity }
                if visitor.personalInformation[.state] == nil { throw RegistrationError.missingState }
                if visitor.personalInformation[.zipCode] == nil { throw RegistrationError.missingZipCode }
                if visitor.personalInformation[.SSN] == nil { throw RegistrationError.missingSSN }
                if visitor.personalInformation[.dateOfBirth] == nil { throw RegistrationError.missingDateOfBirth }
                if visitor.personalInformation[.managementTier] == nil { throw RegistrationError.missingManagementTier }
                return true
            }
        }
        catch RegistrationError.missingFirstName { print("Please enter in a first name.") }
        catch RegistrationError.missingLastName { print("Please enter in a last name.") }
        catch RegistrationError.missingStreetAddress { print("Please enter in a street address.") }
        catch RegistrationError.missingCity { print("Please enter in a city.") }
        catch RegistrationError.missingState { print("Please enter in a state.") }
        catch RegistrationError.missingZipCode { print("Please enter in a zipcode.") }
        catch RegistrationError.missingSSN { print("Please enter in a social security number.") }
        catch RegistrationError.missingDateOfBirth { print("Please enter in a date of birth.") }
        catch RegistrationError.missingManagementTier { print("Please enter in the management tier.") }
        return false
    }
}
