import React from 'react';
import { Navigate } from 'react-router-dom';
import useAuth from '../hooks/useAuth';

const RoleRoute = ({ children, allowedRoles }) => {
  const { user, loading } = useAuth();

  if (loading) {
    return <div className="flex items-center justify-center h-screen">Loading...</div>;
  }

  if (!user || !allowedRoles.includes(user.role)) {
    // Redirect ke dashboard atau halaman "unauthorized" jika peran tidak sesuai
    return <Navigate to="/dashboard" replace />;
  }

  return children;
};

export default RoleRoute;