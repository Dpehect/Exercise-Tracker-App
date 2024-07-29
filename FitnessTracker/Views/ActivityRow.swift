import SwiftUI

struct ActivityRow: View {
    @EnvironmentObject var activityViewModel: ActivityViewModel
    var activity: Activity
    @State private var showingEditView = false

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(activity.name)
                    .font(.headline)
                Text("\(activity.duration) minutes")
                    .font(.subheadline)
            }
            Spacer()
            Text(activity.date, style: .date)
                .font(.caption)
            Button(action: {
                showingEditView = true
            }) {
                Image(systemName: "pencil")
            }
            .buttonStyle(BorderlessButtonStyle())
            .sheet(isPresented: $showingEditView) {
                EditActivityView(activity: activity)
                    .environmentObject(activityViewModel)
            }
            Button(action: {
                activityViewModel.deleteActivity(activity: activity)
            }) {
                Image(systemName: "trash")
            }
            .buttonStyle(BorderlessButtonStyle())
        }
    }
}

struct ActivityRow_Previews: PreviewProvider {
    static var previews: some View {
        ActivityRow(activity: Activity(name: "Running", duration: 30, date: Date()))
            .environmentObject(ActivityViewModel())
    }
}
