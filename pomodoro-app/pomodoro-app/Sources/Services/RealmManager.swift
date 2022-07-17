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
            print("error \(error.localizedDescription)")
        }
    }

    var toDoList: [ToDo] {
        Array(realm.objects(ToDo.self))
    }
    
    func editToDo() {
        
    }
    
    func deleteToDo() {
        
    }
}
