//
//  Animation.swift
//  ProductPreviewer
//
//  Created by iPHTech 15 on 09/05/23.
//

import Foundation
import UIKit

class Animation{
    static let shared = Animation()
    var identifier: Int?
    
    func animateImageSize(xFront: CGFloat, yFront: CGFloat, image: UIImageView, xBack: CGFloat, yBack: CGFloat){
        UIView.animate(withDuration: 1.0, animations: {() -> Void in
            image.transform = CGAffineTransform(scaleX: xFront, y: yFront)
        }, completion: {_ in
            image.transform = CGAffineTransform(scaleX: xBack, y: yBack)
        })
    }
    
    func circleAnim(_ view: UIView, duration: CFTimeInterval, completion: @escaping() -> ()) {
        let maskDiameter = CGFloat(sqrtf(powf(Float(view.bounds.width), 2) + powf(Float(view.bounds.height), 2)))
        print(maskDiameter) //893
        let mask = CAShapeLayer()
        let animationId = "path"

        // Make a circular shape.
        mask.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: maskDiameter, height: maskDiameter), cornerRadius: maskDiameter / 2).cgPath

        mask.position = CGPoint(x: (view.bounds.width - maskDiameter) / 2, y: (view.bounds.height - maskDiameter) / 2)
        
        // Add as a mask to the parent layer.
        view.layer.mask = mask
        

        // Animate.
        let animation = CABasicAnimation(keyPath: animationId)
        animation.duration = duration
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = true

        // Create a new path.
        let newPath = UIBezierPath(roundedRect: CGRect(x: maskDiameter / 2, y: maskDiameter / 2, width: 0, height: 0), cornerRadius: 0).cgPath
        
        if identifier == 1{
            // Set start and end values.
            animation.fromValue = newPath //mask.path
            animation.toValue = mask.path //newPath
        }
        else{
            animation.fromValue = mask.path
            animation.toValue = newPath
            
        }

        // Start the animation.
        mask.add(animation, forKey: animationId)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        completion()
        }
    }
    
    func changeBlue(imageView: UIImageView){
        UIView.transition(with: imageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
            let myImage2 = UIImage(named: "layer")
            imageView.image = myImage2!.maskWithGradientColor(color: UIColor.blue, value1: 0, value2: 0, value3: 1, value4: 0, value5: 0, value6: 1, alphaValueTop: 1, alphaValueBottom: 0)},
                          completion: nil)
    }
    
    func changeRed(imageView: UIImageView){
        UIView.transition(with: imageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
            let originalImage = imageView.image
       let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
            imageView.image = tintedImage
           // self.layerImageView.tintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
            let myImage2 = UIImage(named: "layer")
            imageView.image = myImage2!.maskWithGradientColor(color: UIColor.red, value1:1 , value2: 0, value3: 0, value4: 1, value5: 1, value6: 1, alphaValueTop: 0, alphaValueBottom: 1)
        },
                          completion: nil)
        
    }
    
    func changeGreen(imageView: UIImageView){
        
        UIView.transition(with: imageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
            let originalImage = imageView.image
       let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
            imageView.image = tintedImage
            let myImage2 = UIImage(named: "layer")
            imageView.image = myImage2!.maskWithGradientColor(color: UIColor.orange, value1: 0, value2: 1, value3: 0, value4: 1, value5: 0, value6: 0, alphaValueTop: 0, alphaValueBottom: 1)
        },
                          completion: nil)
    }
    func changeBlack(imageView: UIImageView){
        
        UIView.transition(with: imageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
            let originalImage = imageView.image
       let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
            imageView.image = tintedImage
            //self.layerImageView.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
            let myImage2 = UIImage(named: "layer")
            imageView.image = myImage2!.maskWithGradientColor(color: UIColor.black, value1: 0, value2: 0, value3: 0, value4: 0, value5: 0, value6: 0, alphaValueTop: 0, alphaValueBottom: 1)
        },
                          completion: nil)
        
    }
    
    func changeWhite(imageView: UIImageView){
       
        UIView.transition(with: imageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
            let originalImage = imageView.image
       let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
            imageView.image = tintedImage
            imageView.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5) },
                          completion: nil)
    }
}
