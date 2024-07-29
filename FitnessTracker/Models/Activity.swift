import Foundation

struct Activity: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var duration: Int // duration in minutes
    var date: Date

    static func == (lhs: Activity, rhs: Activity) -> Bool {
        return lhs.id == rhs.id
    }
}
