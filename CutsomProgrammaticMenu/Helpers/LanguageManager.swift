//
//  String.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/15/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import Foundation
import MOLH
extension String
{
    func localized() -> String
    {
//        return self
        return NSLocalizedString(self, comment: "")
    }
}

func setLanguage(lang:String)
{
    MOLH.setLanguageTo("ar")
    MOLH.reset()
}

func getAppLanguage() -> String
{
    return MOLHLanguage.currentAppleLanguage()
}
