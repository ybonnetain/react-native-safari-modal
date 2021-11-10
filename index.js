import { NativeModules, Platform, Linking } from 'react-native';

const { RNSafariModalController } = NativeModules;

const module = {
    openURL: (url, modal = true) => {
        if (!(typeof url === 'string')) {
            return;
        }
        if (!/^(https|http)/i.test(url)) {
            return;
        }
        if (Platform.OS === 'ios') {
            RNSafariModalController.isAvailable()
                ? RNSafariModalController.openURL(url, modal)
                : Linking.openURL(url).catch()
        }
        Linking.openURL(url).catch();
    }
}

export default module;
