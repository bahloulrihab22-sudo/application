import React from 'react';
import { StyleSheet } from 'react-native';
import LinearGradient from 'react-native-linear-gradient'; // or 'expo-linear-gradient' if using Expo

export default function BackgroundPink({ children }) {
  return (
    <LinearGradient
      colors={['#FFE6F0', '#FFC0CB']}
      start={{ x: 0.5, y: 0 }}
      end={{ x: 0.5, y: 1 }}
      style={styles.container}
    >
      {children}
    </LinearGradient>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1, // fill screen
    width: '100%',
    height: '100%',
  },
});
