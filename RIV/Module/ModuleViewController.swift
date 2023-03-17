//
//  ViewController.swift
//  RIV
//
//  Created by Александр Бисеров on 17.02.2023.
//

import UIKit

protocol ViewDescription: AnyObject {
    func update(with action: ModuleName.DataAction)
}

class ModuleViewController: UIViewController {
    
    var interactor: InteractorDescription?
    var onViewReady: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.handle(event: .viewDidload)
    }
    
}

extension ModuleViewController: ViewDescription {
    func update(with action: ModuleName.DataAction) {
        switch action {
        case .dataLoaded:
            obtainDataLoaded()
        }
    }
}

private extension ModuleViewController {
    func obtainDataLoaded() {}
}

