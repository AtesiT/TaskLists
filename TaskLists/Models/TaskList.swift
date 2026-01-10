import Foundation
import RealmSwift

//  Наследуеимся от Object

final class TaskList: Object {
    @Persisted var title = ""
    @Persisted var date = Date()
    //  Заменяем [Task], т.к. мы работаем в базе данных Realm и для этого есть спецальная коллекция в базе
    @Persisted var tasks = List<Task>()
}

final class Task: Object {
    @Persisted var title = ""
    @Persisted var note = ""
    @Persisted var date = Date()
    @Persisted var isComplete = false
}
