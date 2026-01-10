import Foundation
import RealmSwift

final class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    //  Здесь добавляем параметр completion для того, чтобы мы смогли раскрыть блок замыкания и внутри него обновить интерфейс
    func createTempData(completion: @escaping () -> Void) {
        let shoppingList = TaskList()
        shoppingList.title = "Shopping List"
        
        //  Лучше так не делать, так как читаемость кода становится хуже. Но возможность так сделать - имеется
        let moviesList = TaskList(value: ["Movies List", Date(), [["Best film ever"], ["The best of the best", "Must have", Date(), true]] ])
        
        
        
        //  Создаем пустой экземпляр класса со значениями по умолчанию. После создания - обновляем значения свойств.
        let milk = Task()
        milk.title = "Milk"
        milk.note = "2L"
        
        let apples = Task(value: ["Apples", "2Kg"])
        //  let bread = Task(value: ["Bread", "", Date(), true])
        //  Используем ключи, чтобы задать только нужные значения
        let bread = Task(value: ["title": "Bread", "isComplete": true])
        
        shoppingList.tasks.append(milk)
        //  Если индекс поставить 0, то milk будет третьим, т.к. присваивается на место указанного индекса
        shoppingList.tasks.insert(contentsOf: [apples, bread], at: 1)
    }
}
