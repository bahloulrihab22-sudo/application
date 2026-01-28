import React from "react";
import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";

// Screens
import Acceuil from "./screens/Acceuil";
import Home from "./screens/Home";
import SignIn from "./screens/SignIn";
import SignUp from "./screens/SignUp";
import Confirm from "./screens/Confirm";

// Optional: fade transition
import { Easing, Animated } from "react-native";

const Stack = createNativeStackNavigator();

// Fade transition for screen changes
const FadeTransition = ({ current }) => ({
  cardStyle: {
    opacity: current.progress,
  },
});

export default function Page() {
  return (
    <NavigationContainer>
      <Stack.Navigator
        initialRouteName="Acceuil"
        screenOptions={{ headerShown: false }}
      >
        <Stack.Screen name="Acceuil" component={Acceuil} />
        <Stack.Screen name="Home" component={Home} />
        <Stack.Screen
          name="SignIn"
          component={SignIn}
          options={{ animation: "fade" }}
        />
        <Stack.Screen
          name="SignUp"
          component={SignUp}
          options={{ animation: "fade" }}
        />
        <Stack.Screen
          name="Confirm"
          component={Confirm}
          options={{ animation: "fade" }}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
