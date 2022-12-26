//
//By Opengift Software
//www.myopengift.co.uk

import SwiftUI
//public var uiColorArray = [UIColor](){
  //  didSet {
     //   print("arrayChanged")
    //
    //}
//}

    
//func addcolors(){
  //  for _ in 0...1024{
    //uiColorArray.append(UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.1))
    //}//
//}


struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .page1:
            ContentViewA()
        case .page2:
            ContentViewB()
                .transition(.scale)
        case .page3:
            ContentViewC()
                
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
