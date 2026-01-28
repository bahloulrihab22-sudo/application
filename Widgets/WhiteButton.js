import React from 'react';
import { Pressable, Text, StyleSheet, View } from 'react-native';

const ACCENT_COLOR = '#D8B4E2';
const TEXT_COLOR = '#5E4A6E';

export default function WhiteButton({ text, onPress }) {
  return (
    <View style={styles.container}>
      <Pressable
        onPress={onPress}
        style={({ pressed }) => [
          styles.button,
          pressed && styles.pressed,
        ]}
      >
        <Text style={styles.text}>{text}</Text>
      </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    width: '100%',
    height: 55,
  },
  button: {
    flex: 1,
    borderWidth: 2,
    borderColor: ACCENT_COLOR,
    borderRadius: 14,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'transparent',
  },
  pressed: {
    opacity: 0.85,
  },
  text: {
    fontSize: 18,
    color: TEXT_COLOR,
    fontWeight: '600',
  },
});
