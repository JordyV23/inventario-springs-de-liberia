const flowbite = require("flowbite-react/tailwind");

/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
    "node_modules/flowbite-react/lib/esm/**/*.js",
    flowbite.content(),
  ],
  theme: {
    extend: {
      colors: {
        SpringBlue: "#0D3B66",
        SpringBrown: "#C58E4C",
        SpringCream: "#FAF0CA",
        SpringGreen: "#8BC63E",
        SpringLight: "#DBE2EF",
        SpringRed: "#DF2935",
        SpringWhite: "#F9F7F7",
      },
    },
  },
  plugins: [flowbite.content()],
};
