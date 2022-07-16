//
//  SettingsViewController.swift
//  pomodoro-app
//
//  Created by Намик on 7/16/22.
//

import UIKit

final class SettingsViewController: UIViewController {
    // MARK: - Properties

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }

    // MARK: - Helpers
    private func style() {
        view.backgroundColor = .white
        title = navigationController?.title
    }

    // MARK: - Selectors 
}
