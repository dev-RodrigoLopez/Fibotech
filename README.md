# Fibotech

Este repositorio contiene la app basada en Flutter para el proyecto Fibotech

## Dependencias

- Flutter >= 3.3.10
- Dart >=2.18.6
- Android Studio >3.0 (opcional)
- Kotlin >1.6.10

## Comenzando 🚀

Para poder ejecutar la aplicación necesitas un emulador Android o dispositivo físico con SDK 21 o superiores.

### Agregar tu APIKEY al archivo de .env

Es necesario agregar la APIKEY a las variables de entorno para poder consumir el ENDPOINT de [openWeather]

1. Ingresar a la siguiente liga: [openWeather]

2. Suscribirse al API de ONE CALL API 3.0 [openWeather3.0]

3. Llenar los datos del formulario. NOTA: El ApiKEY toma alrededor de 30min a 2horas en activarse.

4. Agregar el ApiKEY en la variable apiKeyWeather. Ubicado en lib/core/utils/env.dart

### Agregar nuevio modulo a inyectable comando

```arb
    flutter pub run build_runner build --delete-conflicting-outputs

```
### Correr manejador de bd objectbox

    1. Instalar la libreria de adb [adb]
    2. Correr el comando a nivel global cada que se reinicie el ordenador adb forward tcp:8090 tcp:8090 
    3. Entra en la siguente linea [objectBoxAdmin]


[adb]: https://developer.android.com/studio/command-line/adb
[objectBoxAdmin]: http://127.0.0.1:8090 
[openWeather]: https://openweathermap.org/api
[openWeather3.0]: https://home.openweathermap.org/subscriptions/billing_info/onecall_30/base?key=base&service=onecall_30
