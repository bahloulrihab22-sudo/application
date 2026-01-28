import React from 'react';
import { Pressable, Text, StyleSheet, View } from 'react-native';

const PRIMARY_COLOR = '#BFA6D8';

export default function PurpleButton({ text, onPress }) {
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
    backgroundColor: PRIMARY_COLOR,
    borderRadius: 14,
    justifyContent: 'center',
    alignItems: 'center',
  },
  pressed: {
    opacity: 0.85,
  },
  text: {
    fontSize: 18,
    color: '#FFFFFF',
    fontWeight: '600',
  },
});
