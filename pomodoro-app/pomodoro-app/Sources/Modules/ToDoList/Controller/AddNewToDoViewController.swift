//
//  AddNewToDoViewController.swift
//  pomodoro-app
//
//  Created by Намик on 7/16/22.
//

import UIKit
import RealmSwift

final class AddNewToDoViewController: UIViewController {
    var onDismiss: (() -> Void)?
    
    private let textView = CaptionTextView()
    
    private let uploadToDoButton = Utilis().button(withTitle: "Create")

    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG\(Realm.Configuration.defaultConfiguration.fileURL!)")
        style()
        setup()
        configureNavBar()
        uploadToDoButtonTapped()
    }

    private func style() {
        view.backgroundColor = .white
    }
    
    private func configureNavBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = true

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
        Utilis().setup(textView: textView, view: view)
    }

    @objc private func handleCancel() {
        dismiss(animated: true)
    }
    
    @objc private func uploadToDo() {
        guard let textFromTextView = textView.text,
              textView.hasText else {
            return
        }
        let todo = ToDo(textToDo: textFromTextView)
        RealmManager.shared.saveToDo(todo: todo)
        onDismiss?()
        dismiss(animated: true)
    }
}
