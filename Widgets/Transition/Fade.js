// Fade.js
export const Fade = {
  gestureEnabled: false,
  cardStyleInterpolator: ({ current }) => ({
    cardStyle: {
      opacity: current.progress,
    },
  }),
  transitionSpec: {
    open: { animation: 'timing', config: { duration: 1200 } },
    close: { animation: 'timing', config: { duration: 1200 } },
  },
};
