import SwiftUI

struct ContentView: View {
    @EnvironmentObject var activityViewModel: ActivityViewModel
    
    var body: some View {
        NavigationView {
            ActivityListView()
                .navigationTitle("Fitness Tracker")
                .navigationBarItems(trailing: NavigationLink("Add", destination: AddActivityView()))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ActivityViewModel())
    }
}
