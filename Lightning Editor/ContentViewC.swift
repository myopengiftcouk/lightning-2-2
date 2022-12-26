//
//  ContentViewC.swift
//  Lightning
//
//  Created by Edward Taylor on 22/12/2022.
//







import SwiftUI
import SceneKit

struct ContentViewC: View {
 @State var rotationAngle = 0

var body: some View {

    VStack{
        SceneKitView(angle: $rotationAngle)
            .frame(alignment: .center)

    }
  }
}

struct SceneKitView: UIViewRepresentable {

 @Binding var angle: Int

func degreesToRadians(_ degrees: Float) -> CGFloat {
    return CGFloat(degrees * .pi / 180)
}

func makeUIView(context: UIViewRepresentableContext<SceneKitView>) -> SCNView {

    let sceneView = SCNView()
    sceneView.scene = SCNScene()
    sceneView.allowsCameraControl = true
    sceneView.autoenablesDefaultLighting = true
    sceneView.backgroundColor = UIColor.white
    sceneView.frame = CGRect(x: 0, y: 10, width: 0, height: 1)

    return sceneView
}

func updateUIView(_ sceneView: SCNView, context: UIViewRepresentableContext<SceneKitView>) {
        
    var current_x = Float(-16.0)
    var current_y = Float(-16.0)
    var current_z = Float(-16.0)
    var current_number = 0
        //loop here:
    while current_x < 16.0{
        current_x = current_x + 1
        current_number = current_number + 1
        let pixel = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        let pixelnode = SCNNode(geometry: pixel)
        pixelnode.position = SCNVector3(x: current_x, y: current_y, z: current_z)
        
        var x = Int(current_number)
        var y = Int(1)
    
        var current_color = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)
        
        pixel.firstMaterial?.diffuse.contents = current_color
        //pixel codes
        pixelnode.pivot = SCNMatrix4MakeTranslation(0, -1, 0)
    
        let inttofloat = Float(self.angle)

         let rotation = SCNAction.rotate(by: self.degreesToRadians(inttofloat), around: SCNVector3(1, 0, 0), duration: 5)

         pixelnode.runAction(rotation)
        if current_color == UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0){
            
        }else{
                
         sceneView.scene?.rootNode.addChildNode(pixelnode)
    }
}
typealias UIViewType = SCNView

}

}


