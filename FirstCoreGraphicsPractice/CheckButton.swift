//
//  CheckButton.swift
//  FirstCoreGraphicsPractice
//
//  Created by 양호준 on 2022/02/10.
//

import UIKit

@IBDesignable
class CheckButton: UIButton {
    @IBInspectable private var lineWidth: CGFloat = 0
    @IBInspectable private var strokeColor: UIColor = .systemBlue
    @IBInspectable private var fillColor: UIColor = .systemRed
    
    override func draw(_ rect: CGRect) {
        // context 영역에 그리게 된다.
        // 현재 graphics context를 가지고 옴.
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let height = bounds.height
        let width = bounds.width
        
        let circleRect = bounds.insetBy(dx: width * 0.05, dy: height * 0.05)
        
        context.beginPath()
        context.setLineWidth(lineWidth) // 선 굵기 스토리보드에서 조정 가능
        context.setFillColor(fillColor.cgColor) // 채우기 색
        context.setStrokeColor(strokeColor.cgColor) // 선 색
        context.addEllipse(in: circleRect) // 원으로 그려줘
        context.drawPath(using: .fillStroke) // 그리는 방법 선택
        
        // 체크 표시를 그려보자
        if isSelected {
            context.beginPath()
            context.setLineJoin(.round) // .bevel하면 끝이 잘리게 됨.
            context.setLineCap(.round)
            context.move(to: CGPoint(x: width * 0.2, y: height * 0.5))
            context.addLine(to: CGPoint(x: width * 0.45, y: height * 0.75))
            context.addLine(to: CGPoint(x: width * 0.8, y: height * 0.3))
            context.drawPath(using: .stroke)
        }
        context.closePath() // 한 번만 해보면 된다.
        // CGAffine 사용해서 회전을 할 수 있다.
    }
}
