import React from 'react';

const Card = ({ children, className = '' }) => {
  return (
    // ✅ Menggunakan bg-surface
    <div className={`bg-surface rounded-lg shadow-md p-6 ${className}`}>
      {children}
    </div>
  );
};

export default Card;