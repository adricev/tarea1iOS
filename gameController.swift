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
    
    var shuffledImageNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Baraja los nombres de las imágenes aleatoriamente
        shuffledImageNames = imageNames.shuffled()
        // Inicialmente, asigna imágenes aleatorias
        assignRandomImages()
    }
    
    @IBAction func jugarButtonTapped(_ sender: UIButton) {
        // Baraja nuevamente las imágenes para mostrar diferentes combinaciones
        shuffledImageNames = imageNames.shuffled()
        assignRandomImages()
    }
    
    func assignRandomImages() {
        guard imageViews.count >= shuffledImageNames.count else {
            // Manejar el caso en el que haya menos ImageViews que imágenes disponibles
            return
        }
        
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
