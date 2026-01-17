export default [
  {
    languageOptions: {
      ecmaVersion: 2022,
      sourceType: "module",
      globals: {
        console: "readonly",
      },
    },
    rules: {
      // Common rules that might catch issues
      "no-unused-vars": "error",
      "no-console": "warn",
    },
  },
];
