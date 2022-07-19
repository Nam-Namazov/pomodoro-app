//
//  ToDo.swift
//  pomodoro-app
//
//  Created by Намик on 7/17/22.
//

import RealmSwift

class ToDoTask: Object {
    @Persisted var textToDo: String
    @Persisted var time: Date
    
    convenience init(textToDo: String, time: Date) {
        self.init()
        self.textToDo = textToDo
        self.time = time
    }
}
