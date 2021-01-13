
# react-native-safari-modal

On iOS, opens a URL in SafariViewController with presentation options

- PageSheet which is the default
- Push on the VC stack

Before `iOS9` and on `Android` it defaults to RN `Linking.openURL()`

## Getting started

`$ npm install react-native-safari-modal --save`

### Mostly automatic installation

RN > 0.61 automatic install

Else ..

`$ react-native link react-native-safari-modal`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-safari-modal` and add `RNSafariModalController.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNSafariModalController.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<


## Declaration

```typescript
openURL: (url: string, modal: boolean) => void;
```

## Usage
```javascript
import SafariModal from 'react-native-safari-modal';

SafariModal.openURL('https://www.medium.com');
```
