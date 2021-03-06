//
//  Result.swift
//  MVVMRx
//
//  Created by Nayem on 2/12/19.
//  Copyright © 2019 Mufakkharul Islam Nayem. All rights reserved.
//

import Foundation

final class MusicClient {
    
    private lazy var baseURL: URL = {
        return URL(string: "https://gist.githubusercontent.com/M-I-N/")!
    }()
    
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchAlbumsAndTracks(with request: MusicRequest, completion: @escaping (Result<MusicResponse, DataResponseError>) -> Void ) {
        let urlRequest = URLRequest(url: baseURL.appendingPathComponent(request.path))
        let encodedURLRequest = urlRequest.encode(with: request.parameters)
        session.dataTask(with: encodedURLRequest) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.hasSuccessStatusCode,
                let data = data else {
                    print(error.debugDescription)
                    completion(.failure(.network))
                    return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(MusicResponse.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                print(error)
                completion(.failure(.decoding))
            }
            
        }.resume()
    }
}
