import SwiftUI

struct EditActivityView: View {
    @EnvironmentObject var activityViewModel: ActivityViewModel
    @Environment(\.presentationMode) var presentationMode
    var activity: Activity
    
    @State private var name: String
    @State private var duration: String
    @State private var date: Date
    
    init(activity: Activity) {
        self.activity = activity
        _name = State(initialValue: activity.name)
        _duration = State(initialValue: String(activity.duration))
        _date = State(initialValue: activity.date)
    }
    
    var body: some View {
        Form {
            Section(header: Text("Activity Details")) {
                TextField("Activity Name", text: $name)
                TextField("Duration (minutes)", text: $duration)
                    .keyboardType(.numberPad)
                DatePicker("Date", selection: $date, displayedComponents: .date)
            }
            
            Button(action: {
                if let durationInt = Int(duration) {
                    activityViewModel.updateActivity(activity: activity, name: name, duration: durationInt, date: date)
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Save Changes")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .navigationTitle("Edit Activity")
    }
}

struct EditActivityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditActivityView(activity: Activity(name: "Running", duration: 30, date: Date()))
                .environmentObject(ActivityViewModel())
        }
    }
}
