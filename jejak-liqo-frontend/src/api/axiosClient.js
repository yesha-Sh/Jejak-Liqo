import axios from 'axios';

const axiosClient = axios.create({
  baseURL: import.meta.env.VITE_API_URL,
  headers: {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  },
});

axiosClient.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('authToken');
    if (token) {
      config.headers['Authorization'] = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

axiosClient.interceptors.response.use(
  (response) => {
    // Backend mengirim response yang konsisten, kita bisa langsung return datanya
    return response.data;
  },
  (error) => {
    const { response } = error;
    if (response?.status === 401) {
      // Token tidak valid atau expired, hapus dari local storage
      localStorage.removeItem('authToken');
      localStorage.removeItem('user');
      // Redirect ke halaman login
      window.location.href = '/login';
    }
    
    // Melempar error agar bisa ditangani oleh react-query atau blok catch
    return Promise.reject(error.response?.data || { message: 'Something went wrong!' });
  }
);

export default axiosClient;