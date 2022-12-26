//File: ContentViewB.swift
//By Opengift Software
//www.myopengift.co.uk
import SwiftUI



class Canvas: ObservableObject {
    
    let width: Int
    let height: Int
    
    @Published private(set) var colors: [Color]
    
    init(width: Int, height: Int, defaultColor: Color = .white) {
        self.width = width
        self.height = height
        self.colors = .init(repeating: defaultColor, count: width*height)
    }

    func colorAt(x: Int, y: Int) -> Color {
        guard x >= 0, x < width else { return .clear }
        guard y >= 0, y < height else { return .clear }
        return colors[y*width + x]
    }

    func applyColor(_ color: Color, at position: (x: Int, y: Int)) {
        guard position.x >= 0, position.x < width else { return }
        guard position.y >= 0, position.y < height else { return }
        colors[position.y*width + position.x] = color
    }
    
}
struct CanvasView: View {
    
    @ObservedObject var canvas: Canvas
    
    var body: some View {
        ZStack{
            Image("transparentPixel").resizable(resizingMode: .tile)
        
        GeometryReader { proxy in
            VStack(spacing: 0) {
                ForEach(0..<canvas.height, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<canvas.width, id: \.self) { column in
                            canvas.colorAt(x: column, y: row)
                                .frame(width: proxy.size.width/CGFloat(canvas.width),
                                       height: proxy.size.height/CGFloat(canvas.height))
                                .border(Color.white, width: 0)
                        }
                    }
                }
            }
        }
        }}
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(canvas: .init(width: 10, height: 10, defaultColor: .blue))
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
struct ColorPickerView: View {

    @Binding var selectedColor: Color
    let colors: [Color]

    var body: some View {
        ScrollView {
            HStack {
                ForEach(colors.indices, id: \.self) { colorIndex in
                    Button {
                        selectedColor = colors[colorIndex]
                    } label: {
                        if colors[colorIndex] == selectedColor {
                            colors[colorIndex]
                                .frame(width: 10, height: 10)
                                .border(Color.black, width: 2)
                        } else {
                            colors[colorIndex]
                                .frame(width: 10, height: 10)
                        }
                    }
                }
            }
        }
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView(selectedColor: .constant(.blue), colors: [.red, .green, .blue, .orange])
    }
}
class CanvasScene: ObservableObject {
    
    @Published var canvases: [Canvas]
    @Published var selectedCanvasIndex: Int
    
    init(canvases: [Canvas], selectedCanvasIndex: Int = 0) {
        self.canvases = canvases
        self.selectedCanvasIndex = selectedCanvasIndex
    }
    
}
struct ContentViewB: View {
    
    @StateObject var scene: CanvasScene = .init(canvases: [.init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)),
                                                           .init(width: 30, height: 30, defaultColor: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0))])
    @State private var selectedColor: Color = .red
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        VStack {
            Picker("Select canvas", selection: $scene.selectedCanvasIndex) {
                ForEach(scene.canvases.indices, id: \.self) { index in
                    Text("Canvas: \(index)").tag(index).font(.system(size: 8.0))
                }
            }
            GeometryReader { proxy in
                CanvasView(canvas: scene.canvases[scene.selectedCanvasIndex])
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let selectedCanvas = scene.canvases[scene.selectedCanvasIndex]
                                let x = Int(value.location.x/proxy.size.width*CGFloat(selectedCanvas.width))
                                let y = Int(value.location.y/proxy.size.height*CGFloat(selectedCanvas.height))
                                selectedCanvas.applyColor(selectedColor, at: (x, y))
                            }
                    )
            }
            .aspectRatio(1, contentMode: .fit)
            Spacer()
            VStack{
            ColorPickerView(selectedColor: $selectedColor, colors: [.red, .green, .blue, .orange, .pink, .black, .gray, .white,Color(red: 0.3, green: 0.1, blue: 0.2, opacity: 1.0),Color(red: 0.0, green: 0.4, blue: 0.1, opacity: 1.0),Color(red: 0.0, green: 0.7, blue: 0.9, opacity: 1.0),Color(red: 0.4, green: 0.4, blue: 0.1, opacity: 1.0),Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 1.0)])
                .frame(width: 10, height: 50 )
                
                ColorPicker("Color Picker", selection: $selectedColor).font(.system(size: 8.0)).frame(width:200 ,height:20)
                Image(systemName: "move.3d").onTapGesture {
                    viewRouter.currentPage = .page3
                }
                
            }
            
        }
        .padding()
    }

}
