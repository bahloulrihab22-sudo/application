import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { Ionicons } from '@expo/vector-icons';

const ACTIVE_COLOR = 'rgb(144, 66, 216)';
const INACTIVE_COLOR = '#9E9E9E';

export default function BottomNavbar() {
  return (
    <View style={styles.container}>
      <NavItem icon="home" label="Home" isActive />
      <NavItem icon="heart" label="Couple" />
      <NavItem icon="person" label="Profile" />
    </View>
  );
}

function NavItem({ icon, label, isActive = false }) {
  return (
    <View style={styles.item}>
      <Ionicons
        name={icon}
        size={26}
        color={isActive ? ACTIVE_COLOR : INACTIVE_COLOR}
      />
      <Text
        style={[
          styles.label,
          isActive && styles.activeLabel,
        ]}
      >
        {label}
      </Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    height: 70,
    flexDirection: 'row',
    justifyContent: 'space-around',
    backgroundColor: '#FFFFFF',
    borderTopLeftRadius: 24,
    borderTopRightRadius: 24,

    // Shadow (iOS)
    shadowColor: '#000',
    shadowOpacity: 0.05,
    shadowRadius: 10,
    shadowOffset: { width: 0, height: -2 },

    // Shadow (Android)
    elevation: 10,
  },
  item: {
    justifyContent: 'center',
    alignItems: 'center',
  },
  label: {
    fontSize: 12,
    marginTop: 4,
    color: INACTIVE_COLOR,
  },
  activeLabel: {
    color: ACTIVE_COLOR,
    fontWeight: 'bold',
  },
});
