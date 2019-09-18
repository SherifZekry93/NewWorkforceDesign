//
//  Utility.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/17/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import Foundation
struct Utility {
    
    static func getFinalURL(methodName : String,params : [String] = [String]())->String{
        //http://104.43.140.185/TMSBusinessWS
        var finalURL = UserDefaults.standard.value(forKey: BASE_URL_KEY) as! String
        finalURL.append("/")
        finalURL.append("BusinessWS.svc")
        finalURL.append("/")
        finalURL.append(methodName)
        print(finalURL)
        if !params.isEmpty
        {
            finalURL.append("/")
            let paramsURL = params.joined(separator: "/")
            finalURL.append(paramsURL)
            print(finalURL)
        }
        return finalURL
    }
}



