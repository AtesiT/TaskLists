import Foundation
import RealmSwift

final class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    //  Здесь добавляем параметр completion для того, чтобы мы смогли раскрыть блок замыкания и внутри него обновить интерфейс
    func createTempData(completion: @escaping () -> Void) {
        let shoppingList = TaskList()
        shoppingList.title = "Shopping List"
        
        //  Создаем пустой экземпляр класса со значениями по умолчанию. После создания - обновляем значения свойств.
        let milk = Task()
        milk.title = "Milk"
        milk.note = "2L"
        
        shoppingList.tasks.append(milk)
    }
}
