//
//  Service.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/17/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    static let shared = Service()//singleton
    
    func fetchGenericJSONData<T:Decodable>(methodType:HTTPMethod = .get,urlString:String,parameters:Parameters?,header:HTTPHeaders? = nil,completion:@escaping (T?,Error?) -> ())
    {
        
        guard let actual_url = URL(string: urlString) else {return}
        Alamofire.request(actual_url, method: methodType, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            do
            {
                if let data = response.data
                {
                    let feeds = try JSONDecoder().decode(T.self, from: data)
                    if response.result.isSuccess && response.error == nil
                    {
                        
                        print(feeds)
                        
                        completion(feeds,nil)
                    }
                    else
                    {
                        //print(response.error)
                        completion(nil,response.error)
                    }
                }
            }
            catch let err
            {
                
                completion(nil,err)
            }
        }
    }
}
