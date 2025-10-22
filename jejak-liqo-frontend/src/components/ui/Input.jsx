import React from 'react';

const Input = React.forwardRef(({ label, id, type = 'text', error, ...props }, ref) => {
  return (
    <div>
      {/* ✅ Menggunakan text-muted */}
      <label htmlFor={id} className="block text-sm font-medium text-muted">
        {label}
      </label>
      <div className="mt-1">
        <input
          id={id}
          type={type}
          ref={ref}
          // ✅ Menggunakan bg-surface, border-border, text-text
          className={`block w-full px-3 py-2 border rounded-md shadow-sm focus:ring-primary focus:border-primary sm:text-sm bg-surface border-border text-text ${
            error ? 'border-red-500' : 'border-border' // Border error tetap merah
          }`}
          {...props}
        />
      </div>
      {error && <p className="mt-1 text-xs text-red-500">{error.message}</p>}
    </div>
  );
});

export default Input;