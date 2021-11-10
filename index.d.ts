declare const SafariModal: {
  isAvailable: () => boolean;
  openURL: (url: string, modal: boolean) => void;
};

export default SafariModal;
