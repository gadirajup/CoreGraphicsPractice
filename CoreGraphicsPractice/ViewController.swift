//
//  ViewController.swift
//  CoreGraphicsPractice
//
//  Created by Prudhvi Gadiraju on 4/29/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentDrawType = 0
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawRectangle()
    }
    
    func drawCheckerboard() {
        let renderer = UIGraphicsImageRenderer(size: .init(width: 512, height: 512))
        let image = renderer.image { (context) in
            context.cgContext.setFillColor(UIColor.black.cgColor)
            
            for row in 0 ..< 8 {
                for col in 0 ..< 8 {
                    if (row + col) % 2 == 0 {
                        context.cgContext.fill(CGRect(x: col * 64, y: row * 64, width: 64, height: 64))
                    }
                }
            }
        }
        
        imageView.image = image
    }
    
    func drawCircle() {
        let renderer = UIGraphicsImageRenderer(size: .init(width: 512, height: 512))
        let image = renderer.image { (context) in
            context.cgContext.setFillColor(UIColor.red.cgColor)
            context.cgContext.setStrokeColor(UIColor.black.cgColor)
            context.cgContext.setLineWidth(10)
            context.cgContext.addEllipse(in: .init(x: 5, y: 5, width: 502, height: 502))
            context.cgContext.drawPath(using: .fillStroke)
        }
        
        imageView.image = image
    }
    
    func drawRectangle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let image = renderer.image { (context) in
            let rectangle = CGRect(x: 5, y: 5, width: 502, height: 502)
            
            context.cgContext.setFillColor(UIColor.red.cgColor)
            context.cgContext.setStrokeColor(UIColor.black.cgColor)
            context.cgContext.setLineWidth(10)
            context.cgContext.addRect(rectangle)
            context.cgContext.drawPath(using: .fillStroke)
        }
        
        imageView.image = image
    }

    @IBAction func redraw(_ sender: Any) {
        
        currentDrawType += 1
        
        if currentDrawType >= 5 {
            currentDrawType = 0
        }
        
        switch currentDrawType {
        case 0:
            drawRectangle()
        case 1:
            drawCircle()
        case 2:
            drawCheckerboard()
        default:
            break
        }
        
    }
    
}

