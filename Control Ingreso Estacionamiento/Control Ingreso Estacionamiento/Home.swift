import SwiftUI

struct Home: View {
    @State private var isPresentingConfirm: Bool = false

    var body: some View {
        NavigationView {
            
            TabView{
                InComing()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Buscar").tag(0)
                    }
                
                ParkingForm() // Esta es tu vista de ParkingForm
                    .tabItem {
                        Image(systemName: "bookmark.circle.fill")
                        Text("Registrar").tag(1)
                    }
                
                Text("Profile Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile").tag(3)
                    }
            }
            .accentColor(.red)
            .navigationTitle("CUCEI")
            .toolbarBackground(.yellow, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

