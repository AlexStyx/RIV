//
//  ModuleBuilder.swift
//  RIV
//
//  Created by Александр Бисеров on 23.02.2023.
//

import Foundation

@objc
protocol ModuleInput {
    
}

final class ModuleBuilder: NSObject {
    @objc
    class func build(onViewReady: @escaping (ModuleInput) -> Void) -> ModuleRouter {
        let router = ModuleRouter()
        let interactor = ModuleInteractor()
        let view = ModuleViewController()
        view.onViewReady = {
            onViewReady(interactor)
        }
        interactor.router = router
        view.interactor = interactor
        interactor.view = view
        router.view = view
        return router
    }
}
