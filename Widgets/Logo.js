import React from 'react';
import { Image, StyleSheet } from 'react-native';

export default function Logo({ width = 160 }) {
  return (
    <Image
      source={require('../assets/pigeon.png')} // <- same as Flutter's asset
      style={[styles.logo, { width, height: width }]} // maintain square ratio
      resizeMode="contain"
    />
  );
}

const styles = StyleSheet.create({
  logo: {
    // height is set dynamically via width
  },
});
