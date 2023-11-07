//
//  gameController.swift
//  TareaiOS
//
//  Created by Adrian  on 26/10/23.
//

import UIKit

class gameController: UIViewController {
    
    @IBOutlet var imageViews: [UIImageView]!
    
    
    // Nombres de las imágenes en tu proyecto
    let imageNames = ["PorscheAzul", "PorscheAmarillo", "PorscheRojo", "PorscheVerde", "PorscheBlanco", "PorscheNavy"]
    
    @IBAction func jugarButtonTapped(_ sender: UIButton) {
        // Baraja los nombres de las imágenes aleatoriamente
        let shuffledImageNames = imageNames.shuffled()
        
        for (index, imageView) in imageViews.enumerated() {
            if index < shuffledImageNames.count {
                // Asigna una imagen aleatoria a cada ImageView
                if let image = UIImage(named: shuffledImageNames[index]) {
                    imageView.image = image
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Inicialmente, asigna imágenes aleatorias
        assignRandomImages()
    }
    
    func assignRandomImages() {
        let shuffledImageNames = imageNames.shuffled()
        
        for (index, imageView) in imageViews.enumerated() {
            if index < shuffledImageNames.count {
                // Asigna una imagen aleatoria a cada ImageView
                if let image = UIImage(named: shuffledImageNames[index]) {
                    imageView.image = image
                }
            }
        }
    }
}
