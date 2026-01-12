import Foundation
import RealmSwift

final class StorageManager {
    static let shared = StorageManager()
    
    private let realm = try! Realm()
    
    private init() {}
    
    func fetchData<T>(_ type: T.Type) -> Results<T> where T:RealmFetchable {
        realm.objects(T.self)
    }
    
    //  Когда пользователи будут взаимодействовать с приложением, этот метод вызываться никогда не будет. Потому что позволяет сохранить в базе сохранить набор данных (набор списков). Набор списков мы можем сохранить только программно. Одноразовый метод ниже позволяет сформировать контент, при установке приложения.
    func save(_ taskLists: [TaskList]) {
        try! realm.write {
            realm.add(taskLists)
        }
    }
    
    //  Пользователь может сам добавить лишь один список, а не несколько.
    func save(_ taskList: String, completion: (TaskList) -> Void) {
        
    }
    
    func delete(_ taskList: TaskList) {
        
    }
    
    func edit(_ taskList: TaskList, newValue: String) {
        
    }
    
    func done(_ taskList: TaskList) {
        
    }
    
    //  MARK: - Tasks
    func save(_ task: String, withnote note: String, to taskList: TaskList, completion: (Task) -> Void) {
        
    }
}
