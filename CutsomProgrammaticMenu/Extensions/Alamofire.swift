//
//  Alamofire.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/17/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
