import React from 'react';
import { View, StyleSheet } from 'react-native';

export default function BackgroundWhite({ children }) {
  return <View style={styles.container}>{children}</View>;
}

const styles = StyleSheet.create({
  container: {
    flex: 1, // fills the screen
    width: '100%',
    height: '100%',
    backgroundColor: 'white',
  },
});
