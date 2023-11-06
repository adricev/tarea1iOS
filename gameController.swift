//
//  gameController.swift
//  TareaiOS
//
//  Created by Adrian  on 26/10/23.
//

import UIKit

class MemoryGameViewController: UIViewController {
    var sequence = [String]()
    var userSequence = [String]()
    var score = 0

    let imageViews: [UIImageView] = {
        var views = [UIImageView]()
        let imageNames = ["PorscheAzul.jpg", "PorscheAmarillo.jpg", "PorscheRojo.jpg", "PorscheVerde.jpg", "PorscheBlanco.jpg", "PorscheNavy.jpg"]

        for imageName in imageNames {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.isUserInteractionEnabled = true
            imageView.image = UIImage(named: imageName)
            imageView.tag = imageNames.firstIndex(of: imageName)!
            views.append(imageView)
        }

        return views
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Pone los imageViews en la vista
        for (index, imageView) in imageViews.enumerated() {
            imageView.frame = CGRect(x: 50 + (index % 3) * 80, y: 100 + (index / 3) * 80, width: 60, height: 60)
            view.addSubview(imageView)

            // Agrega un gesto de toque a cada imageView
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            imageView.addGestureRecognizer(tapGesture)
        }

        // Inicia el juego
        startGame()
    }

    func startGame() {
        sequence.removeAll()
        userSequence.removeAll()
        score = 0

        // Genera una secuencia aleatoria de identificadores de imágenes
        let imageNames = ["PorscheAzul.jpg", "PorscheAmarillo.jpg", "PorscheRojo.jpg", "PorscheVerde.jpg", "PorscheBlanco.jpg", "PorscheNavy.jpg"]
        for _ in 1...6 {
            sequence.append(imageNames.randomElement()!)
        }

        // Muestra la secuencia de imágenes al usuario
        showSequence()
    }

    func showSequence() {
        for (index, imageName) in sequence.enumerated() {
            let imageView = imageViews.first { $0.tag == imageViews.firstIndex(of: $0)! }
            let delay = Double(index) * 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                UIView.transition(with: imageView!, duration: 0.5, options: .transitionCrossDissolve, animations: {
                    imageView!.image = UIImage(named: imageName)
                }, completion: { _ in
                    UIView.transition(with: imageView!, duration: 0.5, options: .transitionCrossDissolve, animations: {
                        imageView!.image = nil
                    }, completion: { _ in
                        if index == self.sequence.count - 1 {
                            // Usuario debe tocar la secuencia
                            self.userSequence.removeAll()
                        }
                    })
                })
            }
        }
    }

    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        if let tappedImageView = sender.view as? UIImageView {
            if let imageName = imageViews.first(where: { $0.tag == tappedImageView.tag }) {
                // Obtén el identificador único de la imagen
                let imageIdentifier = "image\(imageName.tag + 1)"
                userSequence.append(imageIdentifier)

                // Verifica si la secuencia del usuario coincide con la secuencia generada
                if userSequence == sequence {
                    score += 1
                    // Mostrar siguiente nivel o completar el juego
                    startGame()
                } else if userSequence.count == sequence.count {
                    // La secuencia del usuario es incorrecta, el juego termina
                    // Puedes guardar la puntuación y mostrarla en la vista de puntuaciones
                    // en lugar de reiniciar el juego
                    startGame()
                }
            }
        }
    }
}
