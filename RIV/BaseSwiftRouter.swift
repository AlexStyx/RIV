//
//  BaseSwiftRouter.swift
//  RIV
//
//  Created by Александр Бисеров on 20.02.2023.
//

import UIKit

@objc
protocol BaseSwiftRouterInput {
    func openModuleFrom(window: UIWindow)
    func openModuleFrom(viewController: UIViewController, animated: Bool)
    func openModuleFrom(viewController: UIViewController, inSuperview superview: UIView, onFullViewArea: Bool)
    func closeModule()
    func showAlert(title: String,
                   message: String?,
                   textFields: Int,
                   actions: [UIAlertAction])
}

class BaseSwiftRouter: NSObject, BaseSwiftRouterInput {
    
    weak var view: UIViewController!
   
    func openModuleFrom(window: UIWindow) {
        window.rootViewController = view
    }
    
    func showAlert(title: String,
                   message: String? = nil,
                   textFields: Int = 0,
                   actions: [UIAlertAction] = []) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        if actions.isEmpty {
            alert.addAction(UIAlertAction(title: "OK", style: .default))
        }
        
        actions.forEach(alert.addAction)
        
        if textFields >= 1 {
            (1...textFields).forEach { index in alert.addTextField() }
        }
        view.present(alert, animated: true)
    }
    
    func openModuleFrom(viewController: UIViewController, animated: Bool = true) {
        guard let view = view else { return }
        
        if let viewController = viewController as? UINavigationController {
            viewController.pushViewController(view, animated: animated)
        } else if let viewController = viewController.navigationController {
            viewController.pushViewController(view, animated: animated)
        } else {
            viewController.present(view, animated: animated, completion: nil)
        }
    }

    
    func openModuleFrom(viewController: UIViewController, inSuperview superview: UIView, onFullViewArea: Bool) {
        guard let view = view else { return }
        
        viewController.addChild(view)
        if let child = view.view {
            if onFullViewArea {
                child.translatesAutoresizingMaskIntoConstraints = false
                superview.addSubview(child)
                child.frame = superview.frame
                NSLayoutConstraint.activate([
                    child.topAnchor.constraint(equalTo: superview.topAnchor),
                    child.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                    child.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                    child.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
                ])
            } else {
                superview.addSubview(child)
                child.frame = superview.bounds
            }
        }
        view.didMove(toParent: viewController)
    }
    
    func closeModule() {
        guard let view = view else { return }
        
        if let parentViewController = view.parent {
            guard let _ = parentViewController as? UINavigationController else {
                view.willMove(toParent: nil)
                view.view.removeFromSuperview()
                view.removeFromParent()
                return
            }
        }
        
        if let navigationController = view.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            view.dismiss(animated: true, completion: nil)
        }
    }
}
