//
//  NewUser.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 1/13/20.
//  Copyright © 2020 Sherif  Wagih. All rights reserved.
//

import Foundation
struct NewUser:Codable
{
    let token: String
    let role: String
    let requestActions:RequestActions
    static func getLocallySavedUser() -> NewUser?
    {
        if let data = UserDefaults.standard.value(forKey:SAVED_USER_KEY) as? Data
        {
            do
            {
                let user = try PropertyListDecoder().decode(NewUser.self, from: data)
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
struct RequestActions:Codable
{
    let showMyReqs: Bool
    let cancelMyReq: Bool
    let allowPermReq: Bool
    let allowVacReq: Bool
    let allowOvertimeReq: Bool
    let allowMTransReq: Bool
    let allowEditTransReq: Bool
    let showPenReqs: Bool
    let apprRejReqs: Bool
}
