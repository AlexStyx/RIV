//
//  Interactor.swift
//  RIV
//
//  Created by Александр Бисеров on 17.02.2023.
//

import Foundation

protocol InteractorDescription {
    func handle(event: ModuleName.ViewEvent)
}


final class ModuleInteractor {
    
    weak var view: ViewDescription!
    var router: ModuleRouter?
}


extension ModuleInteractor: InteractorDescription {
    func handle(event: ModuleName.ViewEvent) {
        switch event {
        case .viewDidload:
            obtainViewDidLoad()
        case .viewDidAppear:
            break
        }
        
    }
}

extension ModuleInteractor: ModuleInput {
    
}

// MARK: - ObtainEvenets
private extension ModuleInteractor {
    private func obtainViewDidLoad() {
        view.update(with: .dataLoaded)
    }
}

