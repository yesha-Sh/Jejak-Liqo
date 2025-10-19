import React from 'react';

const StatCard = ({ icon, title, value, isLoading }) => {
  if (isLoading) {
    return (
      <div className="p-6 bg-white rounded-lg shadow-md animate-pulse">
        <div className="h-8 w-8 bg-gray-200 rounded-md"></div>
        <div className="h-4 mt-4 bg-gray-200 rounded w-3/4"></div>
        <div className="h-8 mt-2 bg-gray-200 rounded w-1/2"></div>
      </div>
    );
  }

  return (
    <div className="p-6 bg-white rounded-lg shadow-md">
      <div className="flex items-center justify-between">
        <span className="text-sm font-medium text-muted">{title}</span>
        <div className="p-2 text-primary bg-primary/10 rounded-md">
          {icon}
        </div>
      </div>
      <p className="mt-2 text-3xl font-bold text-on-surface">
        {value}
      </p>
    </div>
  );
};

export default StatCard;