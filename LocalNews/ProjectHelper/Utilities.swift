//
//  Utilities.swift
//  cwrnch-ios
//
//  Created by apple on 23/09/19.
//  Copyright © 2019 Sukhmani. All rights reserved.
//

import UIKit
import AVFoundation

private var player: AVPlayer?

extension UIView {
    //MARK:- sainiShadowWithGradientAndCornerRadius
    func sainiShadowWithGradientAndCornerRadius(shadowColor: CGColor,shadowOpacity: Float,shadowRadius:CGFloat,cornerRadius: CGFloat,colorArr: [CGColor],verticalGradient: Bool){
    
        //Shadow
        self.layer.shadowColor = shadowColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    
        //gradient
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = self.frame.size
        layer.startPoint = CGPoint.zero
        
        layer.endPoint = verticalGradient ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0)
        layer.colors = colorArr
        layer.cornerRadius = cornerRadius
        self.layer.insertSublayer(layer, at: 0)
    
        //corner radius
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
    }

    class MyTapGestureRecognizer: UITapGestureRecognizer {
        var action : (()->Void)? = nil
    }

    func addTapGesture(action : @escaping ()->Void ){
        let tap = MyTapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
        tap.action = action
        tap.numberOfTapsRequired = 1
    
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
    
    }
    @objc func handleTap(_ sender: MyTapGestureRecognizer) {
        sender.action!()
    }
    
    func sainiPlayVideoInBackground(fileName: String){
        let path = Bundle.main.path(forResource: fileName, ofType: ".mp4")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.frame
        playerLayer.videoGravity = .resizeAspectFill
        self.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachedEnd), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        player!.seek(to: .zero)
        player!.play()
        player?.isMuted = true
    }
    @objc func playerItemDidReachedEnd(){
        player!.seek(to: .zero)
    }
}

//MARK: - MyTextFieldDelegate
protocol MyTextFieldDelegate: class {
    func textFieldDidDelete()
}

// subclass UITextField and create protocol for it to know when the backButton is pressed
class MyTextField: UITextField {
    
    weak var myDelegate: MyTextFieldDelegate? // make sure to declare this as weak to prevent a memory leak/retain cycle
    
    override func deleteBackward() {
        super.deleteBackward()
        myDelegate!.textFieldDidDelete()
    }
    
    // when a char is inside the textField this keeps the cursor to the right of it. If the user can get on the left side of the char and press the backspace the current char won't get deleted
    override func closestPosition(to point: CGPoint) -> UITextPosition? {
        let beginning = self.beginningOfDocument
        let end = self.position(from: beginning, offset: self.text?.count ?? 0)
        return end
    }
}
