import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import BackgroundWhite from '../Widgets/BackgroundWhite';
import Logo from '../Widgets/Logo';
import BottomNavbar from '../Widgets/BottomNavbar';
import { Ionicons } from '@expo/vector-icons'; // For the favorite heart icon

export default function Confirm() {
  return (
    <BackgroundWhite>
      <View style={styles.safeArea}>
        {/* Top spacing */}
        <View style={{ height: 40 }} />

        {/* Logo */}
        <Logo width={180} />

        {/* Spacing */}
        <View style={{ height: 40 }} />

        {/* Main content */}
        <View style={styles.contentContainer}>
          <Ionicons
            name="heart"
            size={80}
            color="rgb(144,66,216)"
          />
          <View style={{ height: 20 }} />
          <Text style={styles.title}>Compte confirmé 💕</Text>
          <View style={{ height: 12 }} />
          <Text style={styles.description}>
            Bienvenue dans votre espace couple.{'\n'}
            Construisez, partagez et grandissez ensemble ✨
          </Text>
        </View>

        {/* Footer navbar */}
        <BottomNavbar />
      </View>
    </BackgroundWhite>
  );
}

const styles = StyleSheet.create({
  safeArea: {
    flex: 1,
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingTop: 0,
    width: '100%',
  },
  contentContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingHorizontal: 32,
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    textAlign: 'center',
  },
  description: {
    fontSize: 16,
    textAlign: 'center',
  },
});
