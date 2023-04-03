//
//  MainScreenRouter.swift
//  GetFood
//
//  Created by Пигалова Елена on 03/04/23.
//

import Foundation
import UIKit

typealias EntryController = MainScreenViewProtocol & UITabBarController

protocol MainScreenRouterProtocol {
    var viewController: EntryController? { get }
    static func start() -> MainScreenRouterProtocol
}

class MainScreenRouter: MainScreenRouterProtocol {
    
    var viewController: EntryController?
    static func start() -> MainScreenRouterProtocol {
        
        let view: MainScreenViewProtocol = MainScreenViewController()
        var interactor: MainScreenInteractorProtocol = MainScreenInteractor()
        var presenter: MainScreenPresenterProtocol = MainScreenPresenter()
        let router = MainScreenRouter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.viewController = view as? EntryController
        
        let font = UIFont(name: "sf-ui-display-regular.ttf", size: 13)
        let menuRouter = MenuRouter.start()
        let menuViewController = menuRouter.menuViewController as! UIViewController
        menuViewController.title = "Меню"
        
        let contactsRouter = ContactsRouter.start()
        let contactsViewController = contactsRouter.viewController as! UIViewController
        contactsViewController.title = "Контакты"
        
        let profileRouter = ProfileRouter.start()
        let profileViewController = profileRouter.viewController as! UIViewController
        profileViewController.title = "Профиль"
        
        let cartRouter = CartRouter.start()
        let cartViewController = cartRouter.viewController as! UIViewController
        cartViewController.title = "Корзина"
        
        router.viewController?.setViewControllers([
            menuViewController,
            contactsViewController,
            profileViewController,
            cartViewController
        ], animated: true)
        router.viewController?.modalPresentationStyle = .fullScreen
        
        guard let items = router.viewController?.tabBar.items else {
            return router
        }
        
        for item in items {
            let attributes = [NSAttributedString.Key.font : UIFont(name: "SFUIDisplay-Regular", size: 13)]
            print(attributes)
            item.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        }
        
        items[0].image = UIImage(named: "menuTabBar")
        items[1].image = UIImage(named: "contactsTabBar")
        items[2].image = UIImage(named: "profileTabBar")
        items[3].image = UIImage(named: "cartTabBar")
        
        return router
    }
}
