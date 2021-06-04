module.exports = {
  purge: {
      mode: "all",
      content: ["./Web/View/**/*.hs", "./Application/Helper/**/*.hs" , "./assets/**/*.css"],
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
      extend: {},
  },
  variants: {
      extend: {},
  },
  plugins: [],
};