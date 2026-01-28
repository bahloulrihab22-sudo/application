import React from 'react';
import { View, Pressable, StyleSheet } from 'react-native';
import { Ionicons } from '@expo/vector-icons';

export default function ReturnButton({ onPress }) {
  return (
    <View style={styles.container}>
      <Pressable onPress={onPress} hitSlop={10}>
        <Ionicons name="arrow-back" size={24} color="black" />
      </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    alignSelf: 'flex-start', // same as Alignment.centerLeft
  },
});
