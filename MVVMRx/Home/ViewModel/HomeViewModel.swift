//
//  HomeViewModel.swift
//  Storm
//
//  Created by Mohammad Zakizadeh on 7/17/18.
//  Copyright © 2018 Storm. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa



class HomeViewModel {
    
    public let albums : PublishSubject<[Album]> = PublishSubject()
    public let tracks : PublishSubject<[Track]> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let errorMessage : PublishSubject<String> = PublishSubject()
    
    private let disposable = DisposeBag()
    
    private let musicClient = MusicClient()
    
    public func requestData(){
        
        self.loading.onNext(true)
        let musicRequest = MusicRequest.forLinkinPark()
        musicClient.fetchAlbumsAndTracks(with: musicRequest) { [unowned self] result in
            self.loading.onNext(false)
            switch result {
            case .success(let response):
                self.albums.onNext(response.albums)
                self.tracks.onNext(response.tracks)
            case .failure(let error):
                self.errorMessage.onNext(error.reason)
            }
        }
        
    }
}
