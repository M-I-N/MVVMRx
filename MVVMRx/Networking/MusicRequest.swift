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
        return "dcd86ebedb5e519fd7b09b79dd4e4558/raw/b7505a54339f965413f5d9feb05b67fb7d0e464e/MvvmExampleApi.json"
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
