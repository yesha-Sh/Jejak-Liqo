import React from 'react';

const Select = React.forwardRef(({ label, id, error, children, ...props }, ref) => {
  return (
    <div>
      <label htmlFor={id} className="block text-sm font-medium text-gray-700">
        {label}
      </label>
      <div className="mt-1">
        <select
          id={id}
          ref={ref}
          className={`block w-full px-3 py-2 border rounded-md shadow-sm focus:ring-primary focus:border-primary sm:text-sm ${
            error ? 'border-red-500' : 'border-gray-300'
          }`}
          {...props}
        >
          {children}
        </select>
      </div>
      {error && <p className="mt-1 text-xs text-red-500">{error.message}</p>}
    </div>
  );
});

export default Select;