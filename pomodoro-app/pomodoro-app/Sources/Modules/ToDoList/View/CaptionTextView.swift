//
//  CaptureTextView.swift
//  pomodoro-app
//
//  Created by Намик on 7/18/22.
//

import UIKit

class CaptionTextView: UITextView {
    let placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.text = "What would you like to do?"
        return label
    }()

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4)
        ])
        
        autocorrectionType = .no
        backgroundColor = .white
        font = UIFont.boldSystemFont(ofSize: 18)
        isScrollEnabled = false
        heightAnchor.constraint(equalToConstant: 300).isActive = true

        NotificationCenter.default.addObserver(self, selector: #selector(handleTextChange), name: UITextView.textDidChangeNotification, object: nil)
    }

    @objc private func handleTextChange() {
        if text.isEmpty {
            placeholderLabel.isHidden = false
        } else {
            placeholderLabel.isHidden = true
        }
    }
}
