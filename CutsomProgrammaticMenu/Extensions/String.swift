//
//  String.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/16/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
extension String
{
    func checkGivenUrl() -> Bool {
        
        let userURL:String =  self
        
        do {
            let checkReg = try NSRegularExpression(pattern: "(http|https)://([A-Z]|[a-z].)|([A-Z]|[a-z]|[0-9]+)*.([a-z]|[A-Z])", options: .caseInsensitive)
            
            if checkReg.firstMatch(in: userURL, options: .reportCompletion, range: NSMakeRange(0, userURL.lengthOfBytes(using: String.Encoding.utf8))) != nil {
                
                if let url = URL(string: userURL) {
                    if UIApplication.shared.canOpenURL(url) {
                        return true
                    }
                }
                return false
            }
            
        }
            
        catch
        {
            print("Error")
        }
        
        
        return false
    }

}
