//
//  Utilis.swift
//  pomodoro-app
//
//  Created by Намик on 7/18/22.
//

import UIKit

class Utilis {
    
    func button(withTitle title: String ) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .lightBlueColor
        button.setTitle(title, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
        button.layer.cornerRadius = 32 / 2
        return button
    }
    
    func setup(textView: UITextView, view: UIView) {
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}

