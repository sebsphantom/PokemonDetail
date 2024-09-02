//
//  AppDelegate.swift
//  Pokedex
//
//  Made by Carlos Padilla and Sebastian Verástegui on 2024 August 31.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Punto de inicio para personalizar después de iniciar la app
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Configura y crea una nueva escena cuando se solicita
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Se llama cuando el usuario descarta una sesión de escena
        // Libera recursos específicos de las escenas descartadas
    }

}
