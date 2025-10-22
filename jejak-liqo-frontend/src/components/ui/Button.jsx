import React from 'react';

// ✅ Variasi warna dan gaya tombol
const variants = {
  // Versi Primary SEKARANG menggunakan gradasi dan shadow (Mirip Landing Page)
  primary: 'bg-gradient-to-r from-sky-500 to-blue-600 text-white shadow-md hover:shadow-lg hover:from-sky-600 hover:to-blue-700 focus:ring-sky-500/50',
  
  // Secondary: Warna netral sesuai tema
  secondary: 'bg-surface text-text border border-border hover:bg-gray-50 dark:hover:bg-white/5 focus:ring-primary/50', 
  
  // Danger: Tetap merah
  danger: 'bg-red-600 text-white hover:bg-red-700 focus:ring-red-500/50', 
};

const Button = ({ children, onClick, variant = 'primary', type = 'button', disabled = false, className = '', ...props }) => {
  return (
    <button
      type={type}
      onClick={onClick}
      disabled={disabled}
      // ✅ Penyesuaian class dasar: font-semibold, hover:scale, focus:ring-offset
      className={`px-4 py-2 text-sm font-semibold rounded-lg focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-background 
                 ${variants[variant]} 
                 disabled:opacity-60 disabled:cursor-not-allowed 
                 transition-all duration-300 ease-in-out hover:scale-[1.03] 
                 ${className}`} // Tambahkan className prop agar bisa ditimpa
      {...props}
    >
      {children}
    </button>
  );
};

export default Button;