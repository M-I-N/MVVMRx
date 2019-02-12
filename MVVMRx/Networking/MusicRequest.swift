//
//  MusicRequest.swift
//  MVVMRx
//
//  Created by Nayem on 2/12/19.
//  Copyright © 2019 storm. All rights reserved.
//

import Foundation

struct MusicRequest {
    var path: String {
        return "53d89cbe0d26f0d9f9c65385d7c78a2b/raw/b82c7c3ef8f0e8e5f91a98d981d552834d6b8eba/MvvmExampleApi.json"
    }
    
    let parameters: Parameters
    private init(parameters: Parameters) {
        self.parameters = parameters
    }
}

extension MusicRequest {
    static func forLinkinPark() -> MusicRequest {
        let parameters = Parameters()
        return MusicRequest(parameters: parameters)
    }
}
