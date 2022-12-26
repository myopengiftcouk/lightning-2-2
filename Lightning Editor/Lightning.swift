//Lightning Editor
//By Opengift Software
//www.myopengift.co.uk
import SwiftUI

@main
struct Lightning: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            MotherView().environmentObject(viewRouter)
        }
    }
}
