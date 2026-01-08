import Foundation

final class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    func fetchTrackList() -> [TaskList] {
        []
    }
    
    func save(_ taskLists: [TaskList]) {
        
    }
    
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
