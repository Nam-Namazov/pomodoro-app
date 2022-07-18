//
//  ToDo.swift
//  pomodoro-app
//
//  Created by Намик on 7/17/22.
//

import RealmSwift

class ToDo: Object {
    @Persisted var textToDo: String
    
    convenience init(textToDo: String) {
        self.init()
        self.textToDo = textToDo
    }
}
