//File: ContentViewA.swift
//By Opengift Software
//www.myopengift.co.uk
import SwiftUI
let variable2 = """
    \r
    \r
    \r
    \r
    \r
    \r
    \r
    Lightning Maker
    """


let variable3 = """
    \r
    \r
    \r
    \r
    \r
    \r
    \r
    \r
    \r
    \r
    \r
    Opengift Software
    """
struct ContentViewA: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            Intro()
            Button(action: {
                withAnimation {
                    viewRouter.currentPage = .page2
                }
            }) {
                NextButtonContent()
            }
        }
    }
}

struct ContentViewA_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewA().environmentObject(ViewRouter())
    }
}



struct NextButtonContent : View {
    var body: some View {
        Text("Start ...")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.top, 50)
    }
}

struct Intro : View {
    var body: some View {
        ZStack {

            
            Text(variable2)
                .fontWeight(.thin)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .frame(alignment: .center)
                .font(.headline)
                .offset(x: 0, y: -1).foregroundColor(.black)
            
            Text(variable3)
                .fontWeight(.ultraLight)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .font(.footnote)
                .padding().offset(x: 0, y: 1).foregroundColor(.black)
        
        Image("iconMain")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 64, height: 64)
            .cornerRadius(10)
            .clipped()
        }
    }
}

