//
//  Pass.swift
//  Project-4
//
//  Created by Mike Conner on 12/7/18.
//  Copyright © 2018 Mike Conner. All rights reserved.
//

import Foundation

enum AreaAccess: String {
    case amusementArea = "Amusement Area"
    case kitchenArea = "Kitchen Area"
    case rideControlArea = "Ride Control Area"
    case maintenanceArea = "Maintenance Area"
    case officeArea = "Office Area"
}

enum RideAccess {
    case canNotSkipLines
    case canSkipLines
}

enum Discount {
    case food
    case merchandise
}


class Pass {
    var entrantsName: String = ""
    var areaAccess: [AreaAccess] = []
    var rideAccess: [RideAccess] = []
    var discount: [Discount: Int] = [:]
    
    init (visitor: Visitor) {
        if let firstName = visitor.personalInformation[.firstName], let lastName = visitor.personalInformation[.lastName] {
            entrantsName = "\(firstName) \(lastName)"
        } else {
            entrantsName = "This visitor"
        }
        
        // Set values of based on entrant type according to the buisness rules provided.
        switch visitor.entrantType {
        case .classicGuest:
            areaAccess.append(.amusementArea)
            rideAccess.append(.canNotSkipLines)
            discount = [.food: 0, .merchandise: 0]
        case .vipGuest:
            areaAccess.append(.amusementArea)
            rideAccess.append(.canSkipLines)
            discount = [.food: 10, .merchandise: 20]
        case .freeChildGuest:
            areaAccess.append(.amusementArea)
            rideAccess.append(.canNotSkipLines)
            discount = [.food: 0, .merchandise: 0]
        case .foodServices:
            areaAccess.append(.amusementArea)
            areaAccess.append(.kitchenArea)
            rideAccess.append(.canNotSkipLines)
            discount = [.food: 15, .merchandise: 25]
        case .rideServices:
            areaAccess.append(.amusementArea)
            areaAccess.append(.rideControlArea)
            rideAccess.append(.canNotSkipLines)
            discount = [.food: 15, .merchandise: 25]
        case .maintenance:
            areaAccess.append(.amusementArea)
            areaAccess.append(.kitchenArea)
            areaAccess.append(.rideControlArea)
            areaAccess.append(.maintenanceArea)
            rideAccess.append(.canNotSkipLines)
            discount = [.food: 15, .merchandise: 25]
        case .manager:
            areaAccess.append(.amusementArea)
            areaAccess.append(.kitchenArea)
            areaAccess.append(.rideControlArea)
            areaAccess.append(.maintenanceArea)
            areaAccess.append(.officeArea)
            rideAccess.append(.canNotSkipLines)
            discount = [.food: 25, .merchandise: 25]
        }
    }
}


// Extension Declaration

extension Pass {
    func swipeTheEntrants (pass: Pass, forAccessTo: AreaAccess? = nil, forRideAccessTo: RideAccess? = nil, getsDiscountOn: Discount? = nil) {
        var resultOfSwipingThePass: [String] = []
        var temporaryCountingVariable: Int = 0
        for index in 0..<pass.areaAccess.count {
            if forAccessTo == pass.areaAccess[index] {
                if let accessTo = forAccessTo?.rawValue {
                    resultOfSwipingThePass.append("\(entrantsName) has access to the \(accessTo).") }
            }
            else { temporaryCountingVariable += 1 }
            if temporaryCountingVariable == pass.areaAccess.count {
                if let accessTo = forAccessTo?.rawValue {
                    resultOfSwipingThePass.append("\(entrantsName) DOES NOT have access to the \(accessTo).") }
            }
        }
        if pass.rideAccess[0] == forRideAccessTo {
            switch forRideAccessTo {
            case .canSkipLines?:
                resultOfSwipingThePass.append("\(entrantsName) can ride all rides and skip ride lines.")
            case .canNotSkipLines?:
                resultOfSwipingThePass.append("\(entrantsName) can ride all rides but cannot skip any lines.")
            default:
                break
            }
        } else {
            switch forRideAccessTo {
            case .canSkipLines?:
                resultOfSwipingThePass.append("\(entrantsName) can ride all rides and skip ride lines.")
            case .canNotSkipLines?:
                resultOfSwipingThePass.append("\(entrantsName) can ride all rides but cannot skip any lines.")
            default:
                break
            }
        }
        if getsDiscountOn != nil {
            switch getsDiscountOn {
            case .food?:
                if let foodDiscount = pass.discount[.food] { resultOfSwipingThePass.append("\(entrantsName) has a food disount of: \(foodDiscount)%")}
            case .merchandise?:
                if let merchandiseDiscount = pass.discount[.merchandise] { resultOfSwipingThePass.append("\(entrantsName) has a merchandise disount of: \(merchandiseDiscount)%") }
            case .none:
                break
            }
        }
        
        // Print out the results
        for index in 0..<resultOfSwipingThePass.count {
            print(resultOfSwipingThePass[index])
        }
    }
}
