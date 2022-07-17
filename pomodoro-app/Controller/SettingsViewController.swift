//
//  SettingsViewController.swift
//  pomodoro-app
//
//  Created by Намик on 7/16/22.
//

import UIKit

final class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
    
    private func style() {
        view.backgroundColor = .white
        title = navigationController?.title
    }
}
