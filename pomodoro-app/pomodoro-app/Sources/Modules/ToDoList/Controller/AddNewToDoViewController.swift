//
//  AddNewToDoViewController.swift
//  pomodoro-app
//
//  Created by Намик on 7/16/22.
//

import UIKit

final class AddNewToDoViewController: UIViewController {
    private let captureTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "What would you like to do?"
        textfield.textAlignment = .left
        textfield.autocorrectionType = .no
        textfield.textColor = .black
        return textfield
    }()
    
    private let uploadToDoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightBlueColor
        button.setTitle("Create", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
        button.layer.cornerRadius = 32 / 2
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setup()
        configureNavBar()
        uploadToDoButtonTapped()
    }
    
    // MARK: - Helpers
    private func style() {
        view.backgroundColor = .white
    }
    
    private func configureNavBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                           target: self,
                                                           action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: uploadToDoButton)
    }

    private func uploadToDoButtonTapped() {
        uploadToDoButton.addTarget(self,
                                    action: #selector(uploadToDo),
                                    for: .touchUpInside)
    }

    private func setup() {
        let stackView = UIStackView(arrangedSubviews: [captureTextField])
        stackView.axis = .horizontal
        stackView.spacing = 12

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    @objc private func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func uploadToDo() {
        // отправить этот текст из текстфилда в cell тудулиста (мб засейвить в реалм и в селл зарефетчить и вставить)
    }
}
