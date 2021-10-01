//
//  Model.swift
//  ToDoList
//
//  Created by Дмитрий Шайманов on 06.12.2020.
//

import Foundation

var ToDoItems: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    
    get{
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]]
        {
            return array
        } else {
            return []
        }
    }
}
func add_item(name_item: String){
    ToDoItems.append(["Name": name_item, "is_completed": false])
}

func delete_item(at item_index: Int){
    ToDoItems.remove(at: item_index)
} 

func move_item(from_index: Int, to_index: Int){
    let from = ToDoItems[from_index]
    ToDoItems.remove(at: from_index)
    ToDoItems.insert(from, at: to_index)
}

func change_state(at item: Int) -> Bool {
    ToDoItems[item]["is_completed"] = !(ToDoItems[item]["is_completed"] as! Bool)
    return ToDoItems[item]["is_completed"] as! Bool
}


