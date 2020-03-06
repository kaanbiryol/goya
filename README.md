# goya
 
**Goya** is a style/theme manager for Flutter apps.

## Installation

Just import **goya** into your `pubspec.yaml`
```yaml
dependencies:
  goya: "^0.1"
```

## Usage
**Goya** reads your style traits from a YAML file named `goya.yaml`. Either pre-define this file wherever you want or fetch it over a network request.

**Setting up Goya**

You need to use `GoyaProvider` as the root widget of your application. Simply set the path to your `goya.yaml` (you might fetch it over a network request then save to a file) and you are good to go.

```dart
GoyaProvider(path: "assets/goya.yaml", child: MyHomePage(title: 'Goya Demo'))
```

After setting up, all you need to do is tell Goya which key it will use for a specific widget and it takes care of the rest!

```dart
//Keys.text is just a string ".Text" in this example
//Goya reads the predefined variables under the root key ".Text"
//You can define different style traits such as ".TextPrimary", ".TextHeader" etc. in goya.yaml
Text("Goya").goya(key: Keys.text))
```
If you wish to override some property you can just set it as usual;

```dart
//Here we are overriding the TextAlign value to .left even though it is predefined as .center in our goya.yaml
Text("Goya", textAlign: TextAlign.left).goya(key: Keys.text)
```

**Example goya.yaml**

```yaml
#pre-define the colors
.colors:
  - &orange
    0xFFFF9000
  - &blue
    0xFF87CEFA
    
.Text:
  .align: center
  .color: *blue
  .backgroundColor: *orange
  .fontSize: 48.0
  .fontWeight: 8
  .letterSpacing: 0.1
  .wordSpacing: 0.2
  .fontFamily: Pacifico
  .padding: [8.0, 16.0, 8.0, 16.0]

.Container:
  .color: *blue

```
