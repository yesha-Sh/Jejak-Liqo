import React from 'react';
import { Navigate, useLocation } from 'react-router-dom';
import useAuth from '../hooks/useAuth';

const ProtectedRoute = ({ children }) => {
  const { isAuthenticated, loading } = useAuth();
  const location = useLocation();

  // Menampilkan pesan loading saat status otentikasi sedang diperiksa
  if (loading) {
    return <div className="flex items-center justify-center h-screen">Loading...</div>;
  }

  // Jika tidak terotentikasi, alihkan ke halaman login
  if (!isAuthenticated) {
    return <Navigate to="/login" state={{ from: location }} replace />;
  }

  // Jika terotentikasi, tampilkan halaman yang diminta
  return children;
};

export default ProtectedRoute;