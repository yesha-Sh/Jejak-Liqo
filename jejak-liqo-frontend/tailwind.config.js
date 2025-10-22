/** @type {import('tailwindcss').Config} */

// Helper untuk membaca CSS Variable dengan opacity
function withOpacity(variableName) {
  return ({ opacityValue }) => {
    if (opacityValue !== undefined) {
      return `rgba(var(${variableName}), ${opacityValue})`;
    }
    return `rgb(var(${variableName}))`;
  };
}

export default {
  // 1. Beritahu Tailwind untuk mencari 'data-theme="dark"'
  darkMode: ['class', '[data-theme="dark"]'], 
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        // 2. Definisikan palet warna semantik kita
        // Nama-nama ini akan kita gunakan di komponen React

        // Latar belakang utama aplikasi
        'background': withOpacity('--color-background'),
        // Latar belakang komponen (Card, Sidebar, Modal)
        'surface': withOpacity('--color-surface'),
        
        // Warna primer (tombol, link aktif)
        'primary': withOpacity('--color-primary'),
        'primary-hover': withOpacity('--color-primary-hover'),

        // Warna teks
        'text': withOpacity('--color-text'),
        'muted': withOpacity('--color-muted'),
        
        // Warna garis/border
        'border': withOpacity('--color-border'),
      },
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
      },
      // Efek transisi yang lebih 'halus'
      transitionProperty: {
        'colors': 'background-color, border-color, color, fill, stroke, opacity',
      },
    },
  },
  plugins: [],
}