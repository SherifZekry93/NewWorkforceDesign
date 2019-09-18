//
//  User.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/17/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import Foundation
struct User:Codable
{
    let JobDescriptionAr: String?
    let JobDescriptionEn: String?
    let employeeId:Int
    let employeeNameAr:String
    let employeeNameEn:String
    let employeePhoto:String
    let errorMessage:String?
    let fileNumber:String
    let hasError:String?
    let isManager:Bool
    let orgStructureId:Int
    let securityUserId:Int
    static func getLocallySavedUser() -> User?
    {
        if let data = UserDefaults.standard.value(forKey:SAVED_USER_KEY) as? Data
        {
            do
            {
                let user = try PropertyListDecoder().decode(User.self, from: data)
                return user
            }
            catch
            {
                return nil
                //showMessage(body: "Unable to retrieve data", theme: .error)
            }
            
        }
        return nil
    }
    static func removeSavedUser()
    {
        UserDefaults.standard.setValue(nil, forKey: SAVED_USER_KEY)
    }
}
