import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow? // La ventana principal de la app, se ve todo

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Si usas Storyboard, esto se hace solito. Si no, pues aquí le pones lo que necesites a la ventana.
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // liberar recursos
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Se reanuda lo pausado y se pasa al frente la app otra vez.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Algo interrumpe a la app, como una llamada
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Deshacer los cambios cuando se va al fondo
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // guardar lo que se tenga que guardar y liberar recursos pa gastar menos pila
    }
}
