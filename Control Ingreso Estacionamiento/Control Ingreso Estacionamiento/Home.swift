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
                        Image(systemName: "car")
                        Text("Registrar").tag(1)
                    }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("CUCEI")
                            .foregroundColor(.blue)
                            .font(.largeTitle)
                            .bold()
                        Image(systemName: "car.side")
                            .font(.system(size: 30))
                            .foregroundColor(.blue)
                        
                    }.frame(maxWidth: .infinity)
                }
            }
            .accentColor(.blue)
            .foregroundColor(.blue)

        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

