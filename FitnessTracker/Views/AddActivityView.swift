import SwiftUI

struct AddActivityView: View {
    @EnvironmentObject var activityViewModel: ActivityViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var duration: String = ""
    @State private var date: Date = Date()
    
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
                    activityViewModel.addActivity(name: name, duration: durationInt, date: date)
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Add Activity")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .navigationTitle("Add Activity")
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddActivityView()
                .environmentObject(ActivityViewModel())
        }
    }
}
