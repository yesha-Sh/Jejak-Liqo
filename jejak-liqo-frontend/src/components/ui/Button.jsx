import React from 'react';

const variants = {
  primary: 'bg-primary text-white hover:bg-primary/90',
  secondary: 'bg-gray-200 text-gray-800 hover:bg-gray-300',
  danger: 'bg-red-600 text-white hover:bg-red-700',
};

const Button = ({ children, onClick, variant = 'primary', type = 'button', disabled = false, ...props }) => {
  return (
    <button
      type={type}
      onClick={onClick}
      disabled={disabled}
      className={`px-4 py-2 text-sm font-medium rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 ${variants[variant]} disabled:opacity-50 disabled:cursor-not-allowed transition-colors`}
      {...props}
    >
      {children}
    </button>
  );
};

export default Button;