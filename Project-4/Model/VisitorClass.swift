//
//  VisitorClass.swift
//  Project-4
//
//  Created by Mike Conner on 12/3/18.
//  Copyright © 2018 Mike Conner. All rights reserved.
//

protocol SetUpVisitor {
    var entrantType: EntrantType { get }
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get }
    var discount: [Discount: Int] { get }
    var personalInformation: [PersonalInformation: Any] { get }
}

struct Visitor: SetUpVisitor {
    var entrantType: EntrantType
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discount: [Discount: Int]
    var personalInformation: [PersonalInformation: Any]
}









