import React, { useEffect, useRef } from 'react';
import { Animated, View, StyleSheet } from 'react-native';
import BackgroundPink from '../Widgets/BackgroundPink'; // pink gradient
import Logo from '../Widgets/Logo';
import { useNavigation } from '@react-navigation/native';

export default function Acceuil() {
  const navigation = useNavigation();

  // Animation refs
  const scaleAnim = useRef(new Animated.Value(0.3)).current;
  const fadeAnim = useRef(new Animated.Value(0)).current;
  const floatAnim = useRef(new Animated.Value(0)).current;

  useEffect(() => {
    // Scale sequence (elastic out -> ease out back)
    Animated.sequence([
      Animated.timing(scaleAnim, {
        toValue: 1.5,
        duration: 3000, // roughly 60% of 5s
        useNativeDriver: true,
        easing: Animated.Easing.elastic(1),
      }),
      Animated.timing(scaleAnim, {
        toValue: 1.2,
        duration: 2000, // roughly 40% of 5s
        useNativeDriver: true,
      }),
    ]).start();

    // Fade animation
    Animated.timing(fadeAnim, {
      toValue: 1,
      duration: 5000,
      useNativeDriver: true,
    }).start();

    // Float animation
    Animated.sequence([
      Animated.timing(floatAnim, {
        toValue: -20,
        duration: 2500,
        useNativeDriver: true,
      }),
      Animated.timing(floatAnim, {
        toValue: 0,
        duration: 2500,
        useNativeDriver: true,
      }),
    ]).start();

    // Navigate to Home after 5s
    const timer = setTimeout(() => {
      navigation.replace('Home');
    }, 5000);

    return () => clearTimeout(timer);
  }, []);

  return (
    <BackgroundPink>
      <View style={styles.container}>
        <Animated.View
          style={{
            opacity: fadeAnim,
            transform: [
              { translateY: floatAnim },
              { scale: scaleAnim },
            ],
          }}
        >
          <Logo width={280} />
        </Animated.View>
      </View>
    </BackgroundPink>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});
