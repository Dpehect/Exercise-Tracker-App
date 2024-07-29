import Foundation

class ActivityViewModel: ObservableObject {
    @Published var activities: [Activity] = []
    
    func addActivity(name: String, duration: Int, date: Date) {
        let newActivity = Activity(name: name, duration: duration, date: date)
        activities.append(newActivity)
    }
    
    func updateActivity(activity: Activity, name: String, duration: Int, date: Date) {
        if let index = activities.firstIndex(of: activity) {
            activities[index].name = name
            activities[index].duration = duration
            activities[index].date = date
        }
    }
    
    func deleteActivity(activity: Activity) {
        if let index = activities.firstIndex(of: activity) {
            activities.remove(at: index)
        }
    }
}
