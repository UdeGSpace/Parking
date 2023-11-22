import SwiftUI

struct Home: View {
    let tabBar = UIViewController()
    @State private var selection: Int = 0;
    var body: some View {
        NavigationView {
            NavigationStack {
                TabView(selection: $selection) {
                    InComing()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home").tag(0)
                        }
                    NavigationLink(destination: ParkingForm()){
                        }
                        .tabItem {
                            Image(systemName: "bookmark.circle.fill")
                            Text("Registrar").tag(1)
                        }
                    
                    Text("Scan Tab")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "camera.circle.fill")
                            Text("Scan").tag(2)
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
                .toolbarBackground(.yellow,for: .navigationBar)
                .toolbarBackground(.visible,for: .navigationBar)
                }

            }

        }
    }

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
