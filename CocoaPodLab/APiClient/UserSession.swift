//
//  UserSession.swift
//  CocoaPodLab
//
//  Created by Tsering Lama on 3/1/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import Foundation
import Alamofire

struct UserClient {
    static func getUsers(completion: @escaping (AFResult<[Result1]>) -> ()) {
        let endpointURL = "https://randomuser.me/api/?results=20"
        
        guard let url = URL(string: endpointURL) else {
            print("bad url")
            return
        }
        AF.request(url).response { (response) in
            if let error = response.error {
                completion(.failure(error))
            } else if let data = response.data {
                do {
                    let results = try JSONDecoder().decode(RandomUser.self, from: data)
                    let userData = results.results
                    completion(.success(userData))
                } catch {
                    
                }
            }
        }
    }
}
