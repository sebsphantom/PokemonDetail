//
//  SceneDelegate.swift
//  Pokedex
//
//  Made by Carlos Padilla and Sebastian Verástegui on 2024 August 31.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Configura y adjunta la ventana principal a la escena proporcionada
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Se llama cuando la escena se desconecta; liberar recursos que pueden recrearse después
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Se llama cuando la escena pasa de inactiva a activa; reinicia tareas pausadas
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Se llama cuando la escena va a pasar de activa a inactiva, por ejemplo, por una llamada entrante
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Se llama cuando la escena transiciona del fondo al primer plano; deshace cambios del fondo
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Se llama cuando la escena transiciona de primer plano a fondo; guarda datos y libera recursos
    }
}
