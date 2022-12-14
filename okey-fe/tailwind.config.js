/** @type {import('tailwindcss').Config} */
const { fontFamily } = require("tailwindcss/defaultTheme");
module.exports = {
  content: [
    "./app/**/*.{js,ts,jsx,tsx}",
    "./pages/**/*.{js,ts,jsx,tsx}",
    "./components/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      fontFamily: {
        "sans-serif": ["var(--font-dm-sans)", ...fontFamily.serif],
      },
      colors: {
        accent: "#FF4F5A",
      },
    },
  },
  plugins: [],
};
