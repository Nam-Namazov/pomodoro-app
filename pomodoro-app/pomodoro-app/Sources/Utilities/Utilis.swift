//
//  Utilis.swift
//  pomodoro-app
//
//  Created by Намик on 7/18/22.
//

import UIKit

class Utilis {
    func labelBold(with text: String?, font: CGFloat, numberOfLines: Int, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: font)
        label.numberOfLines = numberOfLines
        label.textColor = textColor
        return label
    }
    
    func labelStandard(with text: String?, font: CGFloat, numberOfLines: Int, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: font)
        label.numberOfLines = numberOfLines
        label.textColor = textColor
        return label
    }
    
    
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
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
