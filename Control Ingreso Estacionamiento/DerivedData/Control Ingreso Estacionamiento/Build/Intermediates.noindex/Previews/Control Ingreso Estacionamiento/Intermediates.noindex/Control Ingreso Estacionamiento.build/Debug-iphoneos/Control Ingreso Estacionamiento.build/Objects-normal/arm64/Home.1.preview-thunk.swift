@_private(sourceFile: "Home.swift") import Control_Ingreso_Estacionamiento
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension Home_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/sergiosanchezroldan/Desktop/CUCEI/8vo Semestre/Proyecto/Control Ingreso Estacionamiento/Control Ingreso Estacionamiento/Home.swift", line: 47)
        Home()

    
#sourceLocation()
    }
}

extension Home {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/sergiosanchezroldan/Desktop/CUCEI/8vo Semestre/Proyecto/Control Ingreso Estacionamiento/Control Ingreso Estacionamiento/Home.swift", line: 8)
        NavigationView {
            TabView{
                InComing()
                    .tabItem {
                        Image(systemName: __designTimeString("#6562.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[0].value", fallback: "magnifyingglass"))
                        Text(__designTimeString("#6562.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[0].value.[1].arg[0].value", fallback: "Buscar")).tag(__designTimeInteger("#6562.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[0].value.[1].modifier[0].arg[0].value", fallback: 0))
                    }
                
                ParkingForm() // Esta es tu vista de ParkingForm
                    .tabItem {
                        Image(systemName: __designTimeString("#6562.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[0].arg[0].value.[0].arg[0].value", fallback: "car"))
                        Text(__designTimeString("#6562.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[0].arg[0].value.[1].arg[0].value", fallback: "Registrar")).tag(__designTimeInteger("#6562.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[0].arg[0].value.[1].modifier[0].arg[0].value", fallback: 1))
                    }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text(__designTimeString("#6562.[1].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: "CUCEI"))
                            .foregroundColor(.blue)
                            .font(.largeTitle)
                            .bold()
                        Image(systemName: __designTimeString("#6562.[1].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[1].value.[0].arg[0].value.[1].arg[0].value", fallback: "car.side"))
                            .font(.system(size: __designTimeInteger("#6562.[1].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[1].value.[0].arg[0].value.[1].modifier[0].arg[0].value.arg[0].value", fallback: 30)))
                            .foregroundColor(.blue)
                        
                    }.frame(maxWidth: .infinity)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .accentColor(.blue)
            .foregroundColor(.blue)

        }
    
#sourceLocation()
    }
}

import struct Control_Ingreso_Estacionamiento.Home
import struct Control_Ingreso_Estacionamiento.Home_Previews

