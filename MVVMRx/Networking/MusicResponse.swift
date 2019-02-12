//
//  MusicResponse.swift
//  MVVMRx
//
//  Created by Nayem on 2/12/19.
//  Copyright © 2019 storm. All rights reserved.
//

import Foundation

struct MusicResponse: Codable {
    
    let tracks: [Track]
    let albums: [Album]
    
    enum CodingKeys: String, CodingKey {
        case tracks = "Tracks"
        case albums = "Albums"
    }
}
