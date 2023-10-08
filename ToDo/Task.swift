//
//  Task.swift
//  ToDo
//
//  Created by Lahiru Amarasooriya on 2023-10-08.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
