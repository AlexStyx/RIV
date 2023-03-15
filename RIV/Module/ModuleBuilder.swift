//
//  ModuleBuilder.swift
//  RIV
//
//  Created by Александр Бисеров on 23.02.2023.
//

import Foundation

protocol ModuleInput {
    
}

final class ModuleBuilder {
    static func build(onViewReady: @escaping (ModuleInput) -> Void) -> ModuleRouter {
        let router = ModuleRouter()
        let interactor = ModuleInteractor(router: router)
        let view = ModuleViewController(interactor: interactor)
        view.onViewReady = {
            onViewReady(interactor)
        }
        interactor.view = view
        router.view = view
        return router
    }
}
