import Foundation
import Realm

final class TaskList {
    var title = ""
    var date = Date()
    var tasks: [Task] = []
}

final class Task {
    var title = ""
    var note = ""
    var date = Date()
    var isComplete = false
}
