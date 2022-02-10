//
//  PlusButton.swift
//  FirstCoreGraphicsPractice
//
//  Created by 양호준 on 2022/02/10.
//

import UIKit

@IBDesignable
class PlusButton: UIButton {
    @IBInspectable private var lineWidth: CGFloat = 0
    @IBInspectable private var strokeColor: UIColor = .systemBlue
    @IBInspectable private var fillColor: UIColor = .systemRed
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let height = bounds.height
        let width = bounds.width
        
        let circleRect = bounds.insetBy(dx: width * 0.05, dy: height * 0.05)
        context.beginPath()
        context.setLineWidth(lineWidth)
        context.setFillColor(fillColor.cgColor)
        context.setStrokeColor(strokeColor.cgColor)
        context.addEllipse(in: circleRect)
        context.drawPath(using: .fillStroke)
        
        context.beginPath()
        context.setLineCap(.round)
        context.move(to: CGPoint(x: width * 0.2, y: height * 0.5))
        context.addLine(to: CGPoint(x: width * 0.8, y: height * 0.5))
        context.move(to: CGPoint(x: width * 0.5, y: height * 0.2))
        context.addLine(to: CGPoint(x: width * 0.5, y: height * 0.8))
        context.drawPath(using: .stroke)
        context.closePath()
    }
}
