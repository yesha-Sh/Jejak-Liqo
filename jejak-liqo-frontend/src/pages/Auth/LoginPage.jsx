import React, { useState, useEffect } from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import * as z from 'zod';
import { BookOpen, Eye, EyeOff } from 'lucide-react';
import useAuth from '../../hooks/useAuth';
import { useNavigate } from 'react-router-dom';

// --- Skema Validasi untuk Form Login ---
const loginSchema = z.object({
  email: z.string().email('Alamat email tidak valid'),
  password: z.string().min(6, 'Password minimal 6 karakter'),
});

// --- Gambar untuk Carousel di Sisi Kiri
import f1 from '../../assets/img/f1.jpeg';
import f2 from '../../assets/img/f2.jpeg';
import f3 from '../../assets/img/f3.jpeg';
import f4 from '../../assets/img/f4.jpeg';

// --- Gambar untuk Carousel di Sisi Kiri ---
const mentoringImages = [f1, f2, f3, f4];


// --- Komponen Halaman Login ---
const LoginPage = () => {
     const { login } = useAuth();
  const navigate = useNavigate();
  const [error, setError] = useState(null);
  const [isLoading, setIsLoading] = useState(false);
  const [showPassword, setShowPassword] = useState(false);
  const [currentImageIndex, setCurrentImageIndex] = useState(0);

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    resolver: zodResolver(loginSchema),
  });

  // Efek untuk mengganti gambar di carousel setiap 4 detik
  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentImageIndex((prev) => (prev + 1) % mentoringImages.length);
    }, 4000);
    return () => clearInterval(interval);
  }, []);

  // Fungsi yang dijalankan saat form disubmit
  const onSubmit = async (data) => {
    setIsLoading(true);
    setError(null);
    try {
      await login(data);
      navigate('/dashboard');
    } catch (err) {
      setError(err.message || 'Gagal untuk login. Silakan periksa kembali email dan password Anda.');
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="flex min-h-screen">
      {/* Bagian Kiri (Gambar Carousel) - Hanya Tampil di Layar Besar */}
      <div className="hidden lg:flex lg:w-1/2 relative overflow-hidden bg-gradient-to-br from-violet-900 via-sky-800 to-emerald-700">
        <div className="absolute inset-0 bg-black/30 z-10"></div>
        
        {mentoringImages.map((img, idx) => (
          <div
            key={idx}
            className={`absolute inset-0 transition-opacity duration-1000 ${
              idx === currentImageIndex ? 'opacity-100' : 'opacity-0'
            }`}
          >
            <img src={img} alt={`Mentoring ${idx + 1}`} className="w-full h-full object-cover" />
          </div>
        ))}

        <div className="relative z-20 flex flex-col justify-between p-12 text-white w-full">
          <div className="flex items-center space-x-2">
            <div className="w-10 h-10 bg-white rounded-lg flex items-center justify-center">
              <BookOpen className="w-6 h-6 text-violet-600" />
            </div>
            <span className="text-2xl font-bold">Jejak Liqo</span>
          </div>

          <div className="space-y-6">
            <h2 className="text-4xl font-bold leading-tight">
              Kelola Program Mentoring dengan Lebih Efisien
            </h2>
            <p className="text-xl text-white/90">
              Sistem digital terpadu untuk pencatatan absensi, monitoring aktivitas, dan pelaporan otomatis.
            </p>
          </div>
        </div>
      </div>

      {/* Bagian Kanan (Form Login) */}
      <div className="w-full lg:w-1/2 flex items-center justify-center p-8 bg-gray-50">
        <div className="w-full max-w-md">
          <div className="bg-white rounded-2xl shadow-xl p-8 space-y-8">
            <div className="text-center space-y-2">
              <h2 className="text-3xl font-bold text-gray-900">Selamat Datang</h2>
              <p className="text-gray-600">Masuk ke akun Jejak Liqo Anda</p>
            </div>
            
            <form onSubmit={handleSubmit(onSubmit)} className="space-y-6">
              {error && (
                <div className="p-4 text-sm text-red-700 bg-red-50 rounded-lg border border-red-200">
                  {error}
                </div>
              )}

              <div className="space-y-4">
                <div>
                  <label htmlFor="email" className="block text-sm font-medium text-gray-700 mb-2">
                    Alamat Email
                  </label>
                  <input
                    id="email"
                    type="email"
                    autoComplete="email"
                    className={`w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-violet-500 transition-all ${
                      errors.email ? 'border-red-500' : 'border-gray-300'
                    }`}
                    placeholder="nama@email.com"
                    {...register('email')}
                  />
                  {errors.email && (
                    <p className="mt-2 text-sm text-red-600">{errors.email.message}</p>
                  )}
                </div>

                <div>
                  <label htmlFor="password" className="block text-sm font-medium text-gray-700 mb-2">
                    Password
                  </label>
                  <div className="relative">
                    <input
                      id="password"
                      type={showPassword ? 'text' : 'password'}
                      autoComplete="current-password"
                      className={`w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-violet-500 transition-all pr-12 ${
                        errors.password ? 'border-red-500' : 'border-gray-300'
                      }`}
                      placeholder="••••••••"
                      {...register('password')}
                    />
                    <button
                      type="button"
                      onClick={() => setShowPassword(!showPassword)}
                      className="absolute right-4 top-1/2 -translate-y-1/2 text-gray-500 hover:text-gray-700"
                    >
                      {showPassword ? <EyeOff className="w-5 h-5" /> : <Eye className="w-5 h-5" />}
                    </button>
                  </div>
                  {errors.password && (
                    <p className="mt-2 text-sm text-red-600">{errors.password.message}</p>
                  )}
                </div>
              </div>

              <button
                type="submit"
                disabled={isLoading}
                className="w-full px-4 py-3 bg-gradient-to-r from-violet-600 to-sky-500 text-white rounded-lg font-semibold shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105 disabled:opacity-50 disabled:cursor-not-allowed disabled:hover:scale-100"
              >
                {isLoading ? (
                  <span className="flex items-center justify-center space-x-2">
                    <div className="w-5 h-5 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                    <span>Memproses...</span>
                  </span>
                ) : (
                  'Masuk'
                )}
              </button>
            </form>

            <div className="text-center text-sm text-gray-600">
              <p>Belum punya akun? Hubungi administrator</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default LoginPage;

