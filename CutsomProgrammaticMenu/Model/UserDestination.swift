//
//  UserDestination.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/18/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import Foundation
import CoreLocation
struct UserDestinations:Codable {
    let CheckInDate:String //"",
    let ExternalSiteId: Int//,
    let Status: Bool//,
    let TheRange: Int//100,
    let diffDate: String//"",
    let latitude:Double// 25.2623961,
    let longitude:Double// 51.5376926
    func getFullLocation() -> CLLocation
    {
        return CLLocation(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
    }
}
