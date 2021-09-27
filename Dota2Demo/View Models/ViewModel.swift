//
//  ViewModel.swift
//  Dota2Demo
//
//  Created by Chr1s on 2021/9/22.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    @Published var hero: Dota2Hero?
    @Published var team: Dota2Team?
    
    let service = NetworkService.shared
    
    var cancellable = Set<AnyCancellable>()

    init() {

        service.fetchData()
            .receive(on: RunLoop.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] (hero, team) in
                self?.hero = hero
                self?.team = team
            }
            .store(in: &cancellable)

    }
}
