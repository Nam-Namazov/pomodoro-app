//
//  RealmManager.swift
//  pomodoro-app
//
//  Created by Намик on 7/17/22.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    private let realm = try! Realm()
    
    func saveToDo(todo: ToDo) {
        do {
            try realm.write({
                realm.add(todo)
            })
        }
        catch {
            print("error")
        }
    }

    var toDoList: [ToDo] {
        Array(realm.objects(ToDo.self))
    }
    
    func editToDo(at index: Int, _ text: String) {
        try? realm.write({
            toDoList[index].textToDo = text
        })
    }
    
    func deleteToDo(todo: ToDo) {
        try? realm.write({
            realm.delete(todo)
        })
    }
}
