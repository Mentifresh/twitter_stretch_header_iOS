//
//  HeaderView.swift
//  twitter_stretch_header
//
//  Created by Daniel Kilders Díaz on 31/12/2018.
//  Copyright © 2018 dankil. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    var animator: UIViewPropertyAnimator!
    
    let imageView: UIImageView = {
        let image =  UIImageView(image: #imageLiteral(resourceName: "beach2"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // custome code for layout
        
        backgroundColor = .red
        
        addSubview(imageView)
        
        setupImageConstraints()
        
        // blur
        setupVisualEffectBlur()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupImageConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor)
            ])
    }
    
    fileprivate func setupVisualEffectBlur() {
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            
            // end state of animation
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            
            self?.addSubview(visualEffectView)
            self?.setupVisualEffectsConstraints(of: visualEffectView)
        })
    }
    
    fileprivate func setupVisualEffectsConstraints(of view: UIVisualEffectView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.rightAnchor.constraint(equalTo: self.rightAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.leftAnchor.constraint(equalTo: self.leftAnchor)
            ])
    }
}
