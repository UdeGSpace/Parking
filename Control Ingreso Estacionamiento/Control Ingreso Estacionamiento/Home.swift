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
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Text("CUCEI")
                            .foregroundColor(.blue)
                            .font(.largeTitle)
                            .bold()
                    }.frame(maxWidth: .infinity)
                }
            }
            .accentColor(.blue)
            .foregroundColor(.blue)
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

