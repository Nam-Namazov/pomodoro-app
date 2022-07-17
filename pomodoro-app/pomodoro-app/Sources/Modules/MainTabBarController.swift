//
//  MainTabBarController.swift
//  pomodoro-app
//
//  Created by Намик on 7/16/22.
//

import UIKit

final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setupTabBarController()
    }

    private func style() {
        view.backgroundColor = .white
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance

        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().prefersLargeTitles = false
        UINavigationBar.appearance().barStyle = .default
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBarAppearance()
    }
    
    private func setupTabBarController() {
        let toDoController = createNavController(controller: ToDoListViewController(),
                                                 imageName: "list.bullet",
                                                 title: "Today")
        let pomodoroController = createNavController(controller: PomodoroViewController(),
                                                     imageName: "timelapse",
                                                     title: "Pomodoro")
        let settingsController = createNavController(controller: SettingsViewController(),
                                                     imageName: "gearshape",
                                                     title: "Settings")
        
        viewControllers = [toDoController,
                           pomodoroController,
                           settingsController]
    }
    
    private func createNavController(controller: UIViewController,
                                     imageName: String,
                                     title: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: controller)
        navController.tabBarItem.image = UIImage(systemName: imageName)
        navController.title = title
        return navController
    }
}
