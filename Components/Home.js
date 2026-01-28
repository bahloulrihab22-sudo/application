import React, { useEffect, useRef } from 'react';
import { View, Animated, StyleSheet } from 'react-native';
import BackgroundWhite from '../Widgets/BackgroundWhite';
import Logo from '../Widgets/Logo';
import PurpleButton from '../Widgets/PurpleButton';
import WhiteButton from '../Widgets/WhiteButton';
import { useNavigation } from '@react-navigation/native';
import SignIn from './SignIn';
import SignUp from './SignUp';

export default function Home() {
  const navigation = useNavigation();

  // Animation refs
  const fadeAnim = useRef(new Animated.Value(0)).current;
  const scaleAnim = useRef(new Animated.Value(0.8)).current;
  const slideAnim = useRef(new Animated.Value(40)).current; // 0.2 * ~200px approx

  useEffect(() => {
    Animated.parallel([
      Animated.timing(fadeAnim, {
        toValue: 1,
        duration: 2000,
        useNativeDriver: true,
      }),
      Animated.timing(scaleAnim, {
        toValue: 1,
        duration: 2000,
        useNativeDriver: true,
      }),
      Animated.timing(slideAnim, {
        toValue: 0,
        duration: 2000,
        useNativeDriver: true,
      }),
    ]).start();
  }, []);

  const handleSignIn = () => {
    navigation.navigate('SignIn'); // Fade transition handled in Stack.Screen options
  };

  const handleSignUp = () => {
    navigation.navigate('SignUp');
  };

  return (
    <BackgroundWhite>
      <View style={styles.safeArea}>
        <View style={{ height: 60 }} />
        {/* Logo */}
        <Logo width={160} />
        <View style={{ flex: 1 }} />

        <Animated.View
          style={{
            opacity: fadeAnim,
            transform: [
              { scale: scaleAnim },
              { translateY: slideAnim },
            ],
          }}
        >
          <PurpleButton text="Sign In" onPress={handleSignIn} />
          <View style={{ height: 16 }} />
          <WhiteButton text="Sign Up" onPress={handleSignUp} />
          <View style={{ height: 40 }} />
        </Animated.View>
      </View>
    </BackgroundWhite>
  );
}

const styles = StyleSheet.create({
  safeArea: {
    flex: 1,
    paddingHorizontal: 28,
    alignItems: 'center',
  },
});
