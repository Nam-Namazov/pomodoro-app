//
//  NewToDoTableViewCell.swift
//  pomodoro-app
//
//  Created by Намик on 7/16/22.
//

import UIKit

final class NewToDoTableViewCell: UITableViewCell {
    static let identifier = "cellid"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
