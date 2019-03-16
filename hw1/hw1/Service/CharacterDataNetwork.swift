//
//  CharacterDataNetwork.swift
//  hw1
//
//  Created by Александр Пономарёв on 12/03/2019.
//  Copyright © 2019 Александр Пономарёв. All rights reserved.
//

import Alamofire
import Foundation

class CharacterDataNetwork: CharacterService {
    func getCharacter(url: String?, _ completionHandler: @escaping (([Person], String?) -> Void)) {
        guard let url = url else { return }
        request(url).responseData {
            switch $0.result {
            case let .success(data):
                let jsonDecoder = JSONDecoder()
                let character = try? jsonDecoder.decode(People.self, from: data)
                completionHandler(character?.results ?? [], character?.next)
            case let .failure(error):
                print("Error: \(error)")
            }
        }
    }
}
