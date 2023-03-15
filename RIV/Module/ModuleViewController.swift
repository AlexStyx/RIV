//
//  ViewController.swift
//  RIV
//
//  Created by Александр Бисеров on 17.02.2023.
//

import UIKit

protocol InteractorDescription {
    func handle(event: ModuleName.ViewEvent)
}

class ModuleViewController: UIViewController {
    
    var interactor: InteractorDescription
    var onViewReady: (() -> Void)?
    
    init(interactor: InteractorDescription) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        interactor.handle(event: .viewDidAppear)
    }


}

