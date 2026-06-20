# Tyba Universities

Tyba Universities es un aplicación creada en Flutter (Versión 3.38.4) que utiliza una implementación del patrón MVVM junto con [Provider](https://pub.dev/packages/provider) para el manejo de estados, el paquete [Dio](https://pub.dev/packages/dio) para las peticiones de red y un enfoque de Clean Architecture para la estructura del proyecto. Esto con el fin de mantener un desarrollo escalable a lo largo del tiempo.

## Instrucciones de uso

**Paso 1:**

Descarga o clona este repositorio con el siguiente link:

```
https://github.com/chrisr04/tyba_universities.git
```

**Paso 2:**

Agrega tu archivo de configuración del entorno .env en la raiz del proyecto, debera tener la siguiente estructura: 

```
API_URL=<url_de_la_api>
```

**Paso 3:**

Ve a la raiz del proyecto y ejecuta el siguiente comando para descargar las dependencias necesarias: 

```
flutter pub get 
```

**Paso 4:**

Luego ejecuta el siguiente comando para levantar la aplicación, recuerda tener un emulador disponible en tu ordenador o en su defecto un dispositivo físico conectado:

```
flutter run --dart-define-from-file=.env
```

**Paso 5 (Opcional):**

Si deseas ejecutar los test de integracion lo puedes hacer mediante el comando

```
flutter test integration_test/app_test.dart --dart-define-from-file=.env
```
