# Pediprojflutter

## Instalación

Para poder instalar este proyecto necesitás tener flutter instalado en tu computadora,
A continuación podés ver los siguientes instructivos:

- [Instructivo instalación en Windows](https://flutter.dev/docs/get-started/install/windows)
- [Instructivo instalación en Mac](https://flutter.dev/docs/get-started/install/macos)

Una vez instalado Flutter en tu dispositivo cloná el repositorio en tu máquina y ejecutá el comando:

`$ pub get`

Con esto vas a instalar todos los paquetes necesarios para poder ejecutar este proyecto

## Ejecución

Para poder ejecturar este proyecto seguí este [instructivo](https://flutter.dev/docs/get-started/install/windows#android-setup) que explica como configurar tanto un emulador como tu dispositivo móvil, según el que vos prefieras

## Estructura de carpetas

```
src
├───lib -> Punto de acceso a la aplicación móvil
    ├───constants -> Constantes de la aplicación (Layout y temas principalmente)
    ├───domain -> Objetos de tipo modelo y definición de los métodos de servicios. Evitar meter implementaciones concretas en este directorio
    └───services -> Clases de servicio que contienen la lógica de negocio
    └───ui -> Archivos de interfaz de usuario
        └───components -> Componentes reutilizables
        └───models -> Clases que definen qué propiedades deben tener los componentes
        └───pages -> Componentes de tipo página que contienen únicamente el estado de esa página
            └───screens -> Componentes que representen la vista de una pantalla particular y heredan el estado de la página

```
