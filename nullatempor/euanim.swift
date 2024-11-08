import UIKit

extension CGMutablePath {
    func addRoundedRect(in rect: CGRect, topLeft: CGFloat, topRight: CGFloat, bottomLeft: CGFloat, bottomRight: CGFloat) {
        move(to: CGPoint(x: rect.minX + bottomLeft, y: rect.minY))
        
        // Bottom left corner
        addArc(tangent1End: CGPoint(x: rect.minX, y: rect.minY), 
               tangent2End: CGPoint(x: rect.minX, y: rect.minY + bottomLeft), 
               radius: bottomLeft)
        
        // Left edge
        addLine(to: CGPoint(x: rect.minX, y: rect.maxY - topLeft))
        
        // Top left corner
        addArc(tangent1End: CGPoint(x: rect.minX, y: rect.maxY), 
               tangent2End: CGPoint(x: rect.minX + topLeft, y: rect.maxY), 
               radius: topLeft)
        
        // Top edge
        addLine(to: CGPoint(x: rect.maxX - topRight, y: rect.maxY))
        
        // Top right corner
        addArc(tangent1End: CGPoint(x: rect.maxX, y: rect.maxY), 
               tangent2End: CGPoint(x: rect.maxX, y: rect.maxY - topRight), 
               radius: topRight)
        
        // Right edge
        addLine(to: CGPoint(x: rect.maxX, y: rect.minY + bottomRight))
        
        // Bottom right corner
        addArc(tangent1End: CGPoint(x: rect.maxX, y: rect.minY), 
               tangent2End: CGPoint(x: rect.maxX - bottomRight, y: rect.minY), 
               radius: bottomRight)
        
        // Bottom edge
        addLine(to: CGPoint(x: rect.minX + bottomLeft, y: rect.minY))
        
        closeSubpath()
    }
}

// Usage example:
let path = CGMutablePath()
let rect = CGRect(x: 50, y: 50, width: 200, height: 100)
path.addRoundedRect(in: rect, topLeft: 20, topRight: 10, bottomLeft: 30, bottomRight: 5)

let shapeLayer = CAShapeLayer()
shapeLayer.path = path
shapeLayer.fillColor = UIColor.blue.cgColor

// Add `shapeLayer` to your view's layer hierarchy
let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
view.layer.addSublayer(shapeLayer)
