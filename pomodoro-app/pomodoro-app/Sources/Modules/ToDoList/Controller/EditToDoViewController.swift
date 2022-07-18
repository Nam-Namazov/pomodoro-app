//
//  EditToDoViewController.swift
//  pomodoro-app
//
//  Created by Намик on 7/18/22.
//

import UIKit

final class EditToDoViewController: UIViewController {
    var indexOfElement: Int?
    
    var onDismiss: (() -> Void)?
    
    private let editButton = Utilis().button(withTitle: "Edit")
    
    private let textView = CaptionTextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setup()
        setupNavBar()
        editButtonTarget()
    }
    
    func setTextFromCell(text: String) {
        textView.text = text
    }
    
    private func style() {
        view.backgroundColor = .white
        textView.placeholderLabel.isHidden = true
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = true

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(handleCancel))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: editButton)
    }
    
    private func setup() {
        Utilis().setup(textView: textView, view: view)
    }
    
    private func editButtonTarget() {
        editButton.addTarget(self,
                             action: #selector(handleEditButton),
                             for: .touchUpInside)
    }
    
    @objc private func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func handleEditButton() {
        guard let text = textView.text,
              textView.hasText,
              let index = indexOfElement else {
            return
        }
        RealmManager.shared.editToDo(at: index, text)
        onDismiss?()
        dismiss(animated: true)
    }
}
