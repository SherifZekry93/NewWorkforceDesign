//
//  DecodableAttendance.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 1/14/20.
//  Copyright © 2020 Sherif  Wagih. All rights reserved.
//

import Foundation
struct DecodableAttendance:Codable
{
    let Employee:[NewAttendance]
}

struct NewAttendance:Codable {
    let transactionDate:String?
    let TimeFrom:String?
    let eventDescAr:String?
    let eventDescEn:String?
    let statusId:Int?
    let TimeTo:String?
}
