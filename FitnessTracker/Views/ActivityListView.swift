import SwiftUI

struct ActivityListView: View {
    @EnvironmentObject var activityViewModel: ActivityViewModel
    
    var body: some View {
        List {
            ForEach(activityViewModel.activities) { activity in
                ActivityRow(activity: activity)
            }
        }
    }
}

struct ActivityListView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityListView()
            .environmentObject(ActivityViewModel())
    }
}
